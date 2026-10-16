FROM ghcr.io/imputnet/cobalt:11
# Render memberi tahu port lewat $PORT (default 10000); cobalt memakai API_PORT.
# Samakan keduanya agar Render bisa me-routing trafik ke container.
#
# Dukungan opsional cookie YouTube (untuk video yang kena bot-check):
# isi env YOUTUBE_COOKIES dengan ISI file cookies.json format cobalt
# (contoh: {"youtube":["cookie1=val1; cookie2=val2"]}),
# entrypoint akan menuliskannya ke /tmp/cookies.json dan mengaktifkan COOKIE_PATH.
# JANGAN taruh cookie di file ini (masuk git) — isi via dashboard Render → Environment (Secret).
CMD ["sh", "-c", "if [ -n \"$YOUTUBE_COOKIES\" ]; then printf '%s' \"$YOUTUBE_COOKIES\" > /tmp/cookies.json && export COOKIE_PATH=/tmp/cookies.json && echo '[cookies] YOUTUBE_COOKIES loaded'; fi; API_PORT=${PORT:-9000} exec node src/cobalt"]
