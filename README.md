## A simple PowerShell script running in a Docker container that automatically runs OCR on the files in a specified folder.

1. Download this repository `git clone https://github.com/marvint24/automatic-OCRmyPDF.git`
2. Modify the docker-compose.yml
3. Change the checkFolder.ps1 to your needs
4. (Optional) Add languages in the languages folder
5. Start the container with `docker-compose up --build`

<br/>

### Filename format
`DoOcrDe-XXXX`  
`1⮥--2⮥--3⮥`

1. `DoOcr` Part that triggers the script  
2. `De` Language selector  
3. `XXXX` User specified part  

Example:  
`DoOcrDe-Letter_01`

<br/>
<br/>

Credits to [OCRmyPDF](https://github.com/ocrmypdf/OCRmyPDF) and [tesseract](https://github.com/tesseract-ocr/tesseract).
