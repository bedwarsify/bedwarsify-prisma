-- CreateEnum
CREATE TYPE "SessionType" AS ENUM ('OVERLAY');

-- CreateEnum
CREATE TYPE "ReportReason" AS ENUM ('HACKER', 'SNIPER');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "minecraftId" TEXT,
    "discordId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "secret" TEXT NOT NULL,
    "type" "SessionType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Report" (
    "id" TEXT NOT NULL,
    "reporterId" TEXT NOT NULL,
    "reporteeId" TEXT NOT NULL,
    "reason" "ReportReason" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User.minecraftId_unique" ON "User"("minecraftId");

-- CreateIndex
CREATE UNIQUE INDEX "User.discordId_unique" ON "User"("discordId");

-- CreateIndex
CREATE UNIQUE INDEX "Report.reporterId_reporteeId_unique" ON "Report"("reporterId", "reporteeId");

-- AddForeignKey
ALTER TABLE "Session" ADD FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD FOREIGN KEY ("reporterId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD FOREIGN KEY ("reporteeId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
