FROM python:3

WORKDIR /app
ADD    ./requirements.txt   /app/
RUN    pip install -r requirements.txt

ADD    ./djangosample   /app/djangosample/
ADD    ./gunicorn       /app/gunicorn/
ADD    ./manage.py      /app/

RUN    sed -i 's/\r//' /app/manage.py

CMD ["gunicorn", "djangosample.wsgi", "-c", "gunicorn/prod.py"]
