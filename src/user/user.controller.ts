import {
  Body,
  Controller,
  Get,
  Param,
  Put,
  Post,
  HttpCode,
  // Req,
  UseGuards,
  UseInterceptors,
  UploadedFile,
} from '@nestjs/common';
import { ApiBearerAuth, ApiBody, ApiConsumes, ApiTags } from '@nestjs/swagger';
import { AuthGuard } from '@nestjs/passport';
import { FileInterceptor } from '@nestjs/platform-express';
import { user } from '@prisma/client';
import { diskStorage } from 'multer';

import { UserService } from './user.service';
import { User } from './entities/user.entity';
import { FileUploadDto } from './dto/file.dto';

@ApiBearerAuth()
@UseGuards(AuthGuard('jwt'))
@ApiTags('user')
@Controller('user')
export class UserController {
  constructor(private userService: UserService) { }

  @Get()
  getUser(): Promise<user[]> {
    return this.userService.getUser();
  }

  @Get('/:userId')
  getUserById(@Param('userId') userId: string) {
    return this.userService.getUserById(Number(userId));
  }


  @Put('/:userId')
  changeUser(@Body() body: User, @Param('userId') userId: string) {
    return this.userService.changeUser(body, Number(userId));
  }
}
