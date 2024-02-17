import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { PrismaService } from './database/prisma';
import { RestaurantModule } from './restaurant/restaurant.module';

@Module({
  imports: [ConfigModule.forRoot(), RestaurantModule],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
