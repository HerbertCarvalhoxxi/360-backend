/*
  Warnings:

  - You are about to alter the column `image` on the `infos` table. The data in that column could be lost. The data in that column will be cast from `String` to `Binary`.
  - Made the column `bio` on table `infos` required. This step will fail if there are existing NULL values in that column.
  - Made the column `image` on table `infos` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_infos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "street" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "image" BLOB NOT NULL,
    "bio" TEXT NOT NULL
);
INSERT INTO "new_infos" ("age", "bio", "id", "image", "name", "neighborhood", "state", "street") SELECT "age", "bio", "id", "image", "name", "neighborhood", "state", "street" FROM "infos";
DROP TABLE "infos";
ALTER TABLE "new_infos" RENAME TO "infos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
