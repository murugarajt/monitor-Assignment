FROM python:3.8-slim-buster

ENV PYTHONDONTWRITEBYTECODE 1 
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt --quiet

COPY . .
EXPOSE 8000

ENTRYPOINT ["sh","entrypoint.sh"]
