import {
  Controller,
  Get,
  Post,
  Body,
  // Patch,
  Param,
  Delete,
  UseGuards,
  Headers,
  HttpCode,
  UseInterceptors,
  UploadedFile,
  Request,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { AuthGuard } from '@nestjs/passport';

import { ImageService } from './image.service';
import { CreateImageDto } from './dto/create-image.dto';
import { UpdateImageDto } from './dto/update-image.dto';
import { FileInterceptor } from '@nestjs/platform-express';

@ApiTags('image')
@ApiBearerAuth()
@UseGuards(AuthGuard('jwt'))
@Controller('image')
export class ImageController {
  constructor(private readonly imageService: ImageService) { }

  @Post('upload')
  @UseInterceptors(FileInterceptor('file'))
  async uploadImage(@UploadedFile() file: Express.Multer.File, @Request() req) {
      const createImageDto = {
          image_name: file.filename,
          url: file.path,
          description: 'Some description',
      };
      return await this.imageService.create(createImageDto, req.user.id);
  }
  
  @Get('/get-image')
  findAll() {
    return this.imageService.findAll();
  }

  // NOTE: get created images by user
  @Get('/get-image-by-user/:userId')
  findAllByUser(@Param('userId') userId: string) {
    return this.imageService.findAllByUser(+userId);
  }

  @Get('/get-image/:id')
  findOne(@Param('id') id: string) {
    return this.imageService.findOne(+id);
  }

  @Get('/get-image-by-name/:imageName')
  findImageByName(@Param('imageName') imageName: string) {
    return this.imageService.findImageByName(imageName);
  }

  // NOTE: this created from nest cli
  // @Patch(':id')
  // update(@Param('id') id: string, @Body() updateImageDto: UpdateImageDto) {
  //   return this.imageService.update(+id, updateImageDto);
  // }

  @HttpCode(200)
  @Delete(':id')
  remove(@Body() body: { userId: string }, @Param('id') id: string) {
    return this.imageService.remove(body, Number(id));
  }
}
