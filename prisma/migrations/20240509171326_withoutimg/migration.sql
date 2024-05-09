/*
  Warnings:

  - You are about to drop the column `image` on the `infos` table. All the data in the column will be lost.

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
    "bio" TEXT NOT NULL
);
INSERT INTO "new_infos" ("age", "bio", "id", "name", "neighborhood", "state", "street") SELECT "age", "bio", "id", "name", "neighborhood", "state", "street" FROM "infos";
DROP TABLE "infos";
ALTER TABLE "new_infos" RENAME TO "infos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
