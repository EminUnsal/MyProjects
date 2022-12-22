FROM python:alpine
COPY requirements.txt .
RUN pip install -r requirements.txt
WORKDIR /app
COPY . .
CMD ["python", "app.py"]
EXPOSE 80