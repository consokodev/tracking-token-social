FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN tracking_token_social create-db
RUN tracking_token_social populate-db
RUN tracking_token_social add-user -u admin -p admin
EXPOSE 5000
CMD ["tracking_token_social", "run"]
