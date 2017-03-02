EXIFTOOL=`which exiftool`

if [ "$EXIFTOOL" = "" ]; then
    if [ ! -d "$DEV_HOME/development/Image-ExifTool-10.44" ]; then
        wget -O "$DEV_HOME/development/Image-ExifTool-10.44.tar.gz" http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-10.44.tar.gz
    fi
    cp $DEV_HOME/development/Image-ExifTool-10.44/exiftool $DEV_HOME/local/bin
    cp $DEV_HOME/development/Image-ExifTool-10.44/lib -r $DEV_HOME/local/bin
else
    echo "exiftool is installed."
fi
