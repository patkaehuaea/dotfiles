toilet -f term -F border --rainbow "$(date)"

curl "wttr.in/Redmond?format=%l:+%c+%t+%w"

if [ "$(tty)" = "/dev/tty1" ]; then
  ~/src/PigeonStats/alls.sh
  echo
fi
