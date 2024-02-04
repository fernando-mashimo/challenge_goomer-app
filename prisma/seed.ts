import { PrismaClient, Category, Day } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const restaurant = await prisma.restaurant.create({
    data: {
      name: 'Restaurant 1',
      address: '123 Main St',
      photo: 'https://example.com/photo.jpg',
    },
  });

  const product = await prisma.restaurantProduct.create({
    data: {
      name: 'Product 1',
      price: 9.99,
      photo: 'https://example.com/product.jpg',
      category: Category.Main,
      restaurantId: restaurant.id,
    },
  });

  await prisma.restaurantProductSale.create({
    data: {
      saleDescription: 'Sale 1',
      salePrice: 7.99,
      saleDays: Day.Monday,
      saleHours: '09:00-17:00',
      restaurantProductId: product.id,
    },
  });

  await prisma.restaurantOpeningHours.create({
    data: {
      day: Day.Monday,
      openingHour: '09:00',
      closingHour: '17:00',
      restaurantId: restaurant.id,
    },
  });

  await prisma.restaurantOpeningHours.create({
    data: {
      day: Day.Tuesday,
      openingHour: '09:00',
      closingHour: '17:00',
      restaurantId: restaurant.id,
    },
  });

  await prisma.restaurantOpeningHours.create({
    data: {
      day: Day.Wednesday,
      openingHour: '09:00',
      closingHour: '17:00',
      restaurantId: restaurant.id,
    },
  });

  await prisma.restaurantOpeningHours.create({
    data: {
      day: Day.Thursday,
      openingHour: '09:00',
      closingHour: '17:00',
      restaurantId: restaurant.id,
    },
  });

  await prisma.restaurantOpeningHours.create({
    data: {
      day: Day.Friday,
      openingHour: '09:00',
      closingHour: '17:00',
      restaurantId: restaurant.id,
    },
  });

  await prisma.restaurantOpeningHours.create({
    data: {
      day: Day.Saturday,
      openingHour: '09:00',
      closingHour: '17:00',
      restaurantId: restaurant.id,
    },
  });

  await prisma.restaurantOpeningHours.create({
    data: {
      day: Day.Sunday,
      openingHour: 'Closed',
      closingHour: 'Closed',
      restaurantId: restaurant.id,
    },
  });

  console.log('Seed complete');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
