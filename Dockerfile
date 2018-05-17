FROM myregistry.democompany.com:5000/python:3.6.5-slim-stretch

COPY index.html /var/html/
WORKDIR /var/html
EXPOSE 8080
ENTRYPOINT ["python","-m","http.server","8080"]

