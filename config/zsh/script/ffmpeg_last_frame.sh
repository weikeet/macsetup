# Usage: 使用分栏模式查看总时长, 作为参数参入, 最后一秒无法提取, 可向前一秒
# zsh fetch_last_img.sh Sleep_Advisor_QAE.mp4 12

# ffmpeg -i $1 -ss 00:00:$2 -frames:v 1 $1.last.png

ffmpeg -i $1 -ss 00:00:$2 -frames: 1 -f image2 $1.last.png
