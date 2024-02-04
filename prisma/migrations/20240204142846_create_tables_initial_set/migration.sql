-- CreateEnum
CREATE TYPE "Category" AS ENUM ('Starter', 'Main', 'Dessert', 'Drink', 'Other');

-- CreateEnum
CREATE TYPE "Day" AS ENUM ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- CreateTable
CREATE TABLE "Restaurant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "photo" TEXT NOT NULL,

    CONSTRAINT "Restaurant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RestaurantProduct" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "photo" TEXT NOT NULL,
    "category" "Category" NOT NULL,
    "restaurantId" TEXT NOT NULL,

    CONSTRAINT "RestaurantProduct_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RestaurantProductSale" (
    "id" TEXT NOT NULL,
    "saleDescription" TEXT NOT NULL,
    "salePrice" DOUBLE PRECISION NOT NULL,
    "saleDays" "Day" NOT NULL,
    "saleHours" TEXT NOT NULL,
    "restaurantProductId" TEXT NOT NULL,

    CONSTRAINT "RestaurantProductSale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RestaurantOpeningHours" (
    "id" TEXT NOT NULL,
    "day" "Day" NOT NULL,
    "openingHour" TEXT NOT NULL,
    "closingHour" TEXT NOT NULL,
    "restaurantId" TEXT NOT NULL,

    CONSTRAINT "RestaurantOpeningHours_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Restaurant_name_key" ON "Restaurant"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Restaurant_address_key" ON "Restaurant"("address");

-- AddForeignKey
ALTER TABLE "RestaurantProduct" ADD CONSTRAINT "RestaurantProduct_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RestaurantProductSale" ADD CONSTRAINT "RestaurantProductSale_restaurantProductId_fkey" FOREIGN KEY ("restaurantProductId") REFERENCES "RestaurantProduct"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RestaurantOpeningHours" ADD CONSTRAINT "RestaurantOpeningHours_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
