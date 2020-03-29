# docker build -t spideyclick/librarium . && docker run --rm --name librarium -p 8000:8000 spideyclick/librarium

FROM python:3

WORKDIR /usr/src/app
COPY . .

RUN echo deb http://archive.ubuntu.com/ubuntu bionic universe >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
RUN apt update
RUN apt install -y tesseract-ocr

RUN pip install django
RUN pip install pytz
RUN pip install pytesseract

RUN python ./Librarium/manage.py makemigrations
RUN python ./Librarium/manage.py migrate
RUN python ./Librarium/manage.py loaddata ./setup/data.json

STOPSIGNAL SIGTERM

CMD ["python", "./Librarium/manage.py", "runserver", "0.0.0.0:8000"]
