-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('NONE', 'NITRO_BOOSTER', 'PARTNER', 'COMMUNITY_MANAGER', 'DEVELOPER');

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT E'NONE';