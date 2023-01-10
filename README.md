## A simple PowerShell script running in a Docker container that automatically runs OCR on the files in a specified folder.

1. Modify the docker-compose.yml
2. Change the checkFolder.ps1 to your needs
3. (Optional) Add languages in the languages folder
4. Start the container with `docker-compose up --build`

Credits to [OCRmyPDF](https://github.com/ocrmypdf/OCRmyPDF) and [tesseract](https://github.com/tesseract-ocr/tesseract).
