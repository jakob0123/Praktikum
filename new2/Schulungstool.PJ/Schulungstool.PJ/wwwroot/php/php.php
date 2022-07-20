$image = "";
if (isset($_POST["signature"]))
{
    $image = $_POST["signature"];
    echo "";
} else {
    echo "
Kein Bild übertragen

";
}