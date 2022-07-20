"use strict";

/**
 * First function called, is used to initialize all necessary components
 */
$(document).ready(function () {

    document.getElementById("addContentSelector").addEventListener("change", function (event) {
        let folderName = "test";//document.getElementById("folderName").value;
        let fileInput = event.target;
        let entryId = parseInt(fileInput.dataset.entryId);
        let uploadUrl = fileInput.dataset.uploadUrl;


        if (fileInput.files && fileInput.files[0]) {
            let reader = new FileReader();
            let fileToRead = fileInput.files[0];

            reader.onload = function (fileReader) {

                if (fileToRead.size > 50000000) {
                    alert("Die max. Dateigröße liegt bei 50MB!");
                    return;
                }

                let xhr = new XMLHttpRequest();

                let contentType;
                if (fileToRead.type === "")
                    contentType = "application/octet-stream";
                else
                    contentType = fileToRead.type;

                xhr.onload = function () {
                    location.reload();
                };

                xhr.open("POST", "/Home/UploadContent/?folderName=" + folderName, true);

                xhr.setRequestHeader("Content-type", contentType);
                xhr.setRequestHeader("file-name", fileToRead.name);

                xhr.send(fileToRead);
            };

            reader.readAsDataURL(fileInput.files[0]);
        }
    });
});