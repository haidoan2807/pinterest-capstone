import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { Prisma, PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';

import { User } from './entities/user';

@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService,
    private configService: ConfigService,
  ) { }
  prisma = new PrismaClient();
  async login(userLogin) {
    const { email, password } = userLogin;
  
    // 1. Check if the user exists in the database
    const user = await this.prisma.user.findFirst({ where: { email } });
    if (!user) {
      throw new Error('User not found');
    }
  
    // 2. Validate the password
    const isPasswordValid = bcrypt.compareSync(password, user.password);
    if (!isPasswordValid) {
      throw new Error('Invalid password');
    }
  
    // 3. Generate a JWT token
    const payload = { userId: user.user_id, email: user.email };
    const token = await this.jwtService.signAsync(
      payload,
      { secret: this.configService.get('KEY'), expiresIn: '15m' }
    );
  
    return {
      success: true,
      message: 'Login successful',
      token
    };
  }
  
  
  async signUp(userSignUp: User) {
    try {
      const { user_id, email, full_name, password, age } = userSignUp;
      const checkUser = await this.prisma.user.findFirst({ where: { email } });

      if (checkUser) {
        throw new Error('Existing User!');
      }

      const newUser: Prisma.userCreateInput = {
        user_id: Number(user_id),
        age,
        full_name,
        email,
        password: bcrypt.hashSync(password, 10),
      };

      await this.prisma.user.create({ data: newUser });
      const message = 'Signup successfully. Please sign in!';

      return {
        success: true,
        message,
        data: {
          user_id: newUser.user_id,
          age: newUser.age,
          full_name: newUser.full_name,
          email: newUser.email,
        },
      };
    } catch (error) {
      throw new Error(error);
    }
  }
}
