FROM python:3.12-alpine

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

CMD ["uvicorn", "services.data_loader.main:app"]