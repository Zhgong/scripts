echo "1. Install ffmpeg and v4l-utils"
apt-get install ffmpeg v4l-utils -y

echo "2. Install libmariadbclient18 and libpq5 required by motion"
apt-get install libmariadbclient18 libpq5 -y