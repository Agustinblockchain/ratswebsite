-- CreateTable
CREATE TABLE "Nfts" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "tags" TEXT[],
    "quantity" INTEGER NOT NULL,
    "projectsId" INTEGER NOT NULL,
    "fingerprint" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "Nfts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Projects" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "policyId" TEXT NOT NULL,
    "value" INTEGER NOT NULL,

    CONSTRAINT "Projects_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Projects_policyId_key" ON "Projects"("policyId");

-- AddForeignKey
ALTER TABLE "Nfts" ADD CONSTRAINT "Nfts_projectsId_fkey" FOREIGN KEY ("projectsId") REFERENCES "Projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
