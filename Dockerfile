FROM alpine:3.11.3

RUN apk upgrade --update && apk add --no-cache python3 && pip3 install --upgrade pip

COPY requirements.txt /requirements.txt

RUN pip3 install -r requirements.txt

COPY main.py /main.py

ENTRYPOINT [ "python3", "/main.py" ]
