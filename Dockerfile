# docker build -t spideyclick/librarium . && docker run --rm --name librarium -p 8000:8000 spideyclick/librarium

FROM python:3

WORKDIR /usr/src/app
COPY . .

RUN pip install django
RUN pip install pytz
RUN python ./Librarium/manage.py makemigrations
RUN python ./Librarium/manage.py migrate
RUN python ./Librarium/manage.py loaddata ./setup/data.json

STOPSIGNAL SIGTERM

CMD ["python", "./Librarium/manage.py", "runserver", "0.0.0.0:8000"]
