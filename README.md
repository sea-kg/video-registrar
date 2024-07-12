# desktop-video-registrar


## Install requirements

Ubuntu 22.04
```
$ apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
```


device=/dev/video0
```
$ gst-launch-1.0 v4l2src ! num-buffers=2000 ! 'video/x-raw(memory:NVMM),width=1920, height=1080, framerate=30/1, format=NV12' ! x264enc ! qtmux ! filesink location=test.mp4 -e
```


gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=2000 ! 'video/x-raw(memory:NVMM),width=1920, height=1080, framerate=30/1, format=NV12' ! x264enc ! qtmux ! filesink location=test.mp4 -e


gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=2000 ! autovideoconvert ! mp4mux ! filesink location=test.mp4 -e


Check the video from webcam: `gst-launch-1.0 v4l2src ! decodebin ! videoconvert ! autovideosink`


## Helpful commands

- `gst-launch-1.0 -v v4l2src device=/dev/video0 ! fakesink` - Test device via gstreamer
- `gst-inspect-1.0 video4linux2` - Information about plugin
- `v4l2-ctl --list-devices` - list devices
- `ffmpeg -f v4l2 -list_formats all -i /dev/video0` - List device capabilities
- `gst-launch-1.0 -v v4l2src device=/dev/video0 num-buffers=20000 ! 'video/x-raw,width=640,height=480,framerate=30/1,format=YUY2' ! filesink location=1.raw` - write raw data to file from web camara
- `ffmpeg -f rawvideo -pix_fmt yuyv422 -video_size 640x480 -r 30 -i 1.raw -vcodec h264 -pix_fmt yuv420p output.mp4` - encode raw data to mp4 (oputput pixel format better for vlc)

## helpful links

- https://dev.to/ethand91/gstreamer-c-stream-webcam-over-tcp-tutorial-lfh
- https://gist.github.com/hum4n0id/cda96fb07a34300cdb2c0e314c14df0a
- https://trac.ffmpeg.org/wiki/Capture/Webcam
- https://stackoverflow.com/questions/66854985/gstreamer-pipeline-saves-my-camera-stream-to-a-file-but-i-need-a-pipeline-to-st
- https://htrd.su/blog/2020/02/11/gstreamer-cant-link-videoconvert-with-appsink-using-caps/