Set-Location "/media/data"

while ($true) {
    if(-not(Test-Path "Original")){
        New-Item "Original" -ItemType Directory
        chmod -R 777 /media/data
    }

    function getFiles {
        return Get-ChildItem -Filter "*DoOcr*" -File
    }
    if(getFiles){
        $file=(getFiles)[0]
        $fileName=$file.Name
        $newName=$fileName.Replace("DoOcr","RunningOcr")
        Rename-Item $file.FullName $newName
        $languages=$newName.Substring(10,$newName.IndexOf("-")-10)
        switch ($languages) {
            "De" {$ocrLanguages="deu"}
            "En" {$ocrLanguages="eng"}
            "DeEn" {$ocrLanguages="deu+eng"}
        }
        ocrmypdf -l $ocrLanguages $newName $newName.Replace("RunningOcr","")
        Move-Item $newName "./Original/$fileName"
    }
    if(-not (getFiles)){
        Start-Sleep -Seconds 30
    }
}

