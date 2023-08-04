FROM python:3.9


COPY requirements.txt ./tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN useradd --create-home appuser
USER appuser
WORKDIR /home/appuser
COPY . .

CMD [ "python", "./prometheus_data_generator/main.py" ]
