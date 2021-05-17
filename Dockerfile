FROM python:3.8-alpine

WORKDIR /app

ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN apk add --update \
    build-base libffi-dev openssl-dev \
    xmlsec xmlsec-dev

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev cargo

RUN python -m pip install --upgrade pip

COPY . .

RUN pip install -r requirements.txt

EXPOSE 9000

CMD ["python", "manage.py", "runserver", "9000"]