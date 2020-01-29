FROM python:3.7-alpine

RUN pip install flask \
    && pip install flask_script \
    && pip install flask_pymongo \
    && pip install Markdown \
    && pip install unidecode \
    && pip install flask_babel \
    && pip install validate_email \
    && pip install password_strength \
    && pip install passlib \
    && pip install gunicorn \
    && pip install flask_wtf

COPY app /opt/GNGforms
COPY config.docker.cfg /opt/GNGforms/config.cfg
COPY entrypoint.sh /opt/GNGforms/entrypoint.sh
RUN chmod +x /opt/GNGforms/entrypoint.sh
COPY gunicorn_gngforms.py /opt/gunicorn_gngforms.py

EXPOSE 5001

ENTRYPOINT ["sh", "/opt/GNGforms/entrypoint.sh" ]

CMD ["gunicorn", "-c", "/opt/gunicorn_gngforms.py", "GNGforms:app"]