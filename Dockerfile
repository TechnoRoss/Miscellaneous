FROM python:3.6.5-slim-stretch

COPY index.html /var/html/
WORKDIR /var/html
EXPOSE 80
ENTRYPOINT ["python","-m","http.server","80"]

