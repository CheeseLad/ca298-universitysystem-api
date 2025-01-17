FROM python:3.11
ENV PYTHONUNBUFFERED=1
#RUN apt-get update && apt install gcc -y && apt-get install build-essential -y && apt-get install python3-dev -y
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/

RUN python manage.py collectstatic --noinput

RUN python manage.py migrate

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
# expose 8000 port
EXPOSE 8000