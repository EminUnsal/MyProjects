FROM python:alpine
ENV MYSQL_DATABASE_HOST=mysql-service
ENV MYSQL_USER=mehmet
ENV MYSQL_PASSWORD=Mehmet20. 
ENV MYSQL_DATABASE=phonebook
COPY requirements.txt .
RUN pip install -r requirements.txt
WORKDIR /app
COPY . .
CMD ["python", "app.py"]
EXPOSE 80