#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from telethon.sync import TelegramClient, events
from telethon.tl.types import DocumentAttributeAudio
import progressbar as pb
import eyed3
from os import environ, path

api_id = environ['API_ID']
api_hash = environ['API_HASH']
filePath = environ['FILE_PATH']
sendTo = environ['SEND_TO']
caption = environ['CAPTION']

widgets = ['Uploading: ', pb.Percentage(), ' ',
           pb.Bar(), ' ',
           pb.SimpleProgress(), ' ',
           pb.ETA()]
bar = pb.ProgressBar(widgets=widgets, maxval=path.getsize(filePath))


def progress(sent, total):
    bar.update(sent)


with TelegramClient('session/large-files-upload', api_id, api_hash) as client:
    file = eyed3.load(filePath)
    title = "%s – %s" % (file.tag.title, file.tag.artist)
    print("Starting uploading \"%s\"" % title)

    bar.start()
    client.send_file(
        sendTo,
        filePath,
        progress_callback=progress,
        attributes=[DocumentAttributeAudio(
            duration=int(file.info.time_secs),
            voice=None,
            title=file.tag.title,
            performer=file.tag.artist
        )],
        caption=caption
    )
    bar.finish()

    client.disconnect()
