# Telegram Large Files Upload

## Requirements

[Register a new Telegram app](https://my.telegram.org/apps), get `api_id`, `api_hash`.

Set environment variables:

```bash
export API_ID="0000000"
export API_HASH="0123456789acbdefghijklmnopqrstuw"
export SEND_TO="some_bot" # username, chat or channel
export CAPTION="[topic1](link1)
[topic2](link2)"
export FILE_PATH="/path/to/podcast.mp3"

# If running as Docker container:
export LOCAL_PATH_SESSIONS="/path/to/sessions" # path to directory where to store Telegram sessions
export LOCAL_PATH_FILES="/path/to/files" # path to directory where file is located
export FILE_PATH="/files/podcast.mp3" # `/files/` is a path in container where files directory mounted
```

## Running Docker container

```bash
docker run --name telegram-large-files-upload \
    --rm \
    --env API_ID="${API_ID}" \
    --env API_HASH="${API_HASH}" \
    --env FILE_PATH="${FILE_PATH}" \
    --env SEND_TO="${SEND_TO}" \
    --env CAPTION="${CAPTION}" \
    --volume ${LOCAL_PATH_SESSIONS}:/session:z \
    --volume ${LOCAL_PATH_FILES}:/files:ro \
    chuhlomin/telegram-large-files-upload:latest
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

## Local Development

Install dependencies (add flag `--user` on MacOS):

```bash
pip3 install -r requirements.txt
```

- [Telethon](https://telethon.readthedocs.io/en/latest/index.html) ([API](https://tl.telethon.dev/index.html)) for interaction with Telegram 
- [Progressbar](https://github.com/niltonvolpato/python-progressbar/) for showing file upload progress
- [EyeD3](https://eyed3.readthedocs.io/en/latest/) for reading MP3-file tags and duration

Run app:

```bash
python3 main.py
```
