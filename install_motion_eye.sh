
echo reference: https://github.com/ccrisan/motioneye/wiki/Install-On-Raspbian
step=1

step() {
    echo [* Step: $step *] $1
    step=$(($step+1))
}

quit_error() {
    #quit script while error
    if [[ $? -ne 0 ]]; then
        echo Quit at Step [$step] because of error
        exit $?
    fi
}

step "Install ffmpeg and v4l-utils"
apt-get install ffmpeg v4l-utils -y

quit_error


step "Install libmariadbclient18 and libpq5 required by motion"
apt-get install libmariadbclient18 libpq5 -y

quit_error

step "Install motion"
:'
note: Raspbian Stretch comes with motion version 4.0; it is however recommended that you install version 4.1
'

wget https://github.com/Motion-Project/motion/releases/download/release-4.1.1/pi_stretch_motion_4.1.1-1_armhf.deb
dpkg -i pi_stretch_motion_4.1.1-1_armhf.deb

quit_error

step "Install the dependencies from the repositories" 
apt-get install python-pip python-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libz-dev -y
quit_error

step "Install motioneye"
pip install motioneye
quit_error

step "Prepare the configuration directory"
mkdir -p /etc/motioneye
cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
quit_error

step "Prepare the media directory"
mkdir -p /var/lib/motioneye
quit_error

step "Add an init script, configure it to run at startup and start the motionEye server"
cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service
systemctl daemon-reload
systemctl enable motioneye
systemctl start motioneye

quit_error

# testing capturing a pcture
# choose mmal camera in this case
raspistill -v -o test.jpg

echo "Finish. Default port: 8765, Username: admin"