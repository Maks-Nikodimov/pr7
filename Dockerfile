FROM python:3 as builder
COPY /srv/app /srv/app
RUN pip3 install --no-cache --user -U flask psycopg2-binary configparser
FROM python:3-slim
COPY --from=builder /root/.local /root/.local
COPY --from=builder /srv/app /srv/app
ENV PATH=/root/.local:$PATH
EXPOSE 5000
CMD ["python", "/srv/app/web.py"]
