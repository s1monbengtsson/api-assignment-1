/*
  Warnings:

  - You are about to drop the column `orderId` on the `orderitems` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `orderitems` table. All the data in the column will be lost.
  - Added the required column `order_id` to the `OrderItems` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `OrderItems` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `orderitems` DROP FOREIGN KEY `OrderItems_orderId_fkey`;

-- DropForeignKey
ALTER TABLE `orderitems` DROP FOREIGN KEY `OrderItems_productId_fkey`;

-- AlterTable
ALTER TABLE `orderitems` DROP COLUMN `orderId`,
    DROP COLUMN `productId`,
    ADD COLUMN `order_id` INTEGER UNSIGNED NOT NULL,
    ADD COLUMN `product_id` INTEGER UNSIGNED NOT NULL;

-- AddForeignKey
ALTER TABLE `OrderItems` ADD CONSTRAINT `OrderItems_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderItems` ADD CONSTRAINT `OrderItems_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
