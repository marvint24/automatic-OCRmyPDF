Set-Location "/media/data"

while ($true) {
    #Create Original Folder to store originals
    if(-not(Test-Path "Original")){
        New-Item "Original" -ItemType Directory
        chmod -R 777 /media/data
    }

    #Searches for files that need to be scanned
    function getFiles {
        return Get-ChildItem -Filter "*DoOcr*" -File
    }
    
    
    if(getFiles){
        #Picks first file
        $file=(getFiles)[0]
        $fileName=$file.Name
        
        #Renames the file
        $newName=$fileName.Replace("DoOcr","RunningOcr")
        Rename-Item $file.FullName $newName
        
        #Extracts language specification
        $languages=$newName.Substring(10,$newName.IndexOf("-")-10)
        switch ($languages) {
            "De" {$ocrLanguages="deu"}
            "En" {$ocrLanguages="eng"}
            "DeEn" {$ocrLanguages="deu+eng"}
        }
        
        #Starts OCR task
        ocrmypdf -l $ocrLanguages $newName $newName.Replace("RunningOcr","")
        Move-Item $newName "./Original/$fileName"
    }
    if(-not (getFiles)){
        #Waits for new files
        Start-Sleep -Seconds 30
    }
}

