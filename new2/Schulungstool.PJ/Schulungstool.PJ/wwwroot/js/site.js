// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
if (_SERVER['REQUEST_METHOD'] == 'POST') {
    if (is_uploaded_file(_FILES['my_upload']['tmp_name'])) {
        //First, Validate the file name
        if (empty(_FILES['my_upload']['name'])) {
            console.log(" File name is empty! ");
            exit;
        }
        upload_file_name = _FILES['my_upload']['name'];
        //Too long file name?
        if (strlen(upload_file_name) > 100) {
            console.log(" too long file name ");
            exit;
        }
        //replace any non-alpha-numeric cracters in th file name
        upload_file_name = preg_replace("/[^A-Za-z0-9 \\.\\-_]/", '', upload_file_name);
        //set a limit to the file upload size
        if (_FILES['my_upload']['size'] > 1000000) {
            console.log(" too big file ");
            exit;
        }
        //Save the file
        dest = __DIR__ + '/uploads/' + upload_file_name;
        if (move_uploaded_file(_FILES['my_upload']['tmp_name'], dest)) {
            console.log('File Has Been Uploaded !');
        }
    }
}