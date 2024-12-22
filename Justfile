set dotenv-load

# Serve video from the controller.
serve-video:
  @ssh jca@${CONTROLLER_IP} "ffmpeg -f v4l2 -input_format mjpeg -video_size 1920x1080 -i /dev/video0 -vcodec libx264 -preset ultrafast -tune zerolatency -pix_fmt yuv420p -f mpegts -listen 1 http://0.0.0.0:4444"

# Watch the video on the client.
watch-video:
  @ffplay http://${CONTROLLER_IP}:4444
