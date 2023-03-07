FROM python:alpine
COPY requirements.txt .
RUN pip install -r requirements.txt
WORKDIR /app
COPY . .
EXPOSE 80
CMD python app.py
