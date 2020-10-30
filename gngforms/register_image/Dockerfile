FROM python:3.7-alpine

COPY app /opt/LiberaForms
COPY config.docker.cfg /opt/LiberaForms/config.cfg
COPY entrypoint.sh /opt/LiberaForms/entrypoint.sh
RUN chmod +x /opt/LiberaForms/entrypoint.sh
COPY gunicorn.py /opt/LiberaForms/gunicorn.py

RUN pip install --upgrade setuptools \
    pip install wheel \
    pip install -r /opt/LiberaForms/requirements.txt \
    pip install gunicorn

EXPOSE 5001

ENTRYPOINT ["sh", "/opt/LiberaForms/entrypoint.sh" ]

CMD ["gunicorn", "-c", "/opt/LiberaForms/gunicorn.py", "liberaforms:app"]