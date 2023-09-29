import { Injectable, Param } from '@nestjs/common';

import { PrismaClient, image } from '@prisma/client';
import { v4 as uuidv4 } from 'uuid';
import { CreateImageDto } from './dto/create-image.dto';
import { UpdateImageDto } from './dto/update-image.dto';
import * as fs from 'fs';
import * as path from 'path';

@Injectable()
export class ImageService {
  prisma = new PrismaClient();

  async create(createImageDto: CreateImageDto, userId: number): Promise<image> {
    const { image_name, url, description } = createImageDto;
    return await this.prisma.image.create({
        data: {
            user_id: userId,
            image_name,
            url,
            description,
        }
    });
}



  async findAll(): Promise<image[]> {
    const data = await this.prisma.image.findMany();
    return data;
  }

  async findAllByUser(id: number) {
    try {
      const data = await this.prisma.image.findMany({
        where: {
          user_id: id,
        },
      });
      return { success: true, data };
    } catch (error) {
      return { success: false, message: `401: Cannot find image list!` };
    }
  }

  // find image info and user info based on image_id
  async findOne(id: number) {
    try {
      const data = await this.prisma.image.findFirst({
        where: {
          image_id: id,
        },
      });
      const { user_id } = data;
      const userInfo = await this.prisma.user.findFirst({
        where: {
          user_id,
        },
      });
      const imageData = {
        ...data,
        user: userInfo,
      };
      return imageData;
    } catch {
      throw new Error(`404: cannot find any image`);
    }
  }

  async findImageByName(imageName: string) {
    const data = await this.prisma.image.findMany({
      where: {
        image_name: {
          contains: imageName,
        },
      },
    });
  
    if (data.length === 0) {
      return {
        success: false,
        message: '404: cannot find any image with this name',
        data: []
      };
    }
  
    return {
      success: true,
      message: 'Images found successfully',
      data
    };
  }
  

  update(id: number, updateImageDto: UpdateImageDto) {
    return `This action updates a #${id} image`;
  }

  async remove(userDelete: { userId: string }, id: number) {
    const { userId } = userDelete;
    try {
      const user = await this.prisma.image.findFirst({
        where: {
          user_id: Number(userId),
        },
      });
      if (!user) {
        return {
          success: false,
          message: `404: Cannot find user!`,
        };
      }
      const data = await this.prisma.image.findFirst({
        where: {
          image_id: Number(id),
        },
      });
      if (!data) {
        return {
          success: false,
          message: `404: Cannot find the image!`,
        };
      }

      const deleteImage = await this.prisma.image.delete({
        where: {
          image_id: Number(id),
        },
      });
      return { success: true, message: 'Image deleted!', deleteImage };
    } catch (err) {
      return { success: false, message: `404: ` };
    }
  }
}
