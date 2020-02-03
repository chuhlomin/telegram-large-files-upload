# Telegram Large Files Upload

Install dependencies (add flag `--user` on MacOS):

```bash
pip3 install telethon progressbar eyed3
```

- https://telethon.readthedocs.io/en/latest/index.html, https://tl.telethon.dev/index.html
- https://github.com/niltonvolpato/python-progressbar/
- https://eyed3.readthedocs.io/en/latest/

[Register a new Telegram app](https://my.telegram.org/apps), get `api_id`, `api_hash`.

Set environment variables:

```bash
export API_ID="0000000"
export API_HASH="0123456789acbdefghijklmnopqrstuw"
export PHONE="+01234567890" # your phone number in Telegram
export FILE_PATH="/path/to/podcast.mp3"
export SEND_TO="some_bot" # username, chat or channel
export CAPTION="[topic1](link1)
[topic2](link2)"
```

Run app:

```bash
make run
```

On the first run it will ask you for your phone number and then for code sent to you in Telegram, so the app can do actions on your behalf.

```
Please enter your phone (or bot token): ...
Please enter the code you received: ...
Please enter your password: ...
Signed in successfully as ...
Lame tag CRC check failed
Starting uploading "..."
Uploading:  95% |########## | 119013376 of 124746836 ETA:  0:00:07
```

Ignore "`Lame tag CRC check failed`" warning from `eyeD3`.
