toilet -f term -F border --rainbow "$(date)"

if [ "$(tty)" = "/dev/tty1" ]; then
  /src/PigeonStats/update.sh
  echo
  /src/PigeonStats/usage.sh
  echo
fi
