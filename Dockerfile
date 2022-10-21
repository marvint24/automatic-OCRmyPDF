FROM mcr.microsoft.com/powershell:lts-7.2-debian-bullseye-slim

RUN apt-get update
RUN apt-get install ocrmypdf -y

WORKDIR /usr/share/tesseract-ocr/4.00/tessdata/

COPY ./languages/* ./

WORKDIR /app

COPY ./checkFolder.ps1 ./

CMD [ "pwsh", "checkFolder.ps1" ]