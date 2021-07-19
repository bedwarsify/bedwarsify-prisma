-- CreateTable
CREATE TABLE "DiscordLevelRole" (
    "id" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "guildId" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "DiscordLevelRole.level_guildId_unique" ON "DiscordLevelRole"("level", "guildId");

-- AddForeignKey
ALTER TABLE "DiscordLevelRole" ADD FOREIGN KEY ("guildId") REFERENCES "DiscordGuild"("id") ON DELETE CASCADE ON UPDATE CASCADE;
