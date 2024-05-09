-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_infos" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "street" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "image" TEXT,
    "bio" TEXT
);
INSERT INTO "new_infos" ("age", "bio", "id", "image", "name", "neighborhood", "state", "street") SELECT "age", "bio", "id", "image", "name", "neighborhood", "state", "street" FROM "infos";
DROP TABLE "infos";
ALTER TABLE "new_infos" RENAME TO "infos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
