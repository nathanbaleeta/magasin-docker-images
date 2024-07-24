**Edit the gunicorn server config file `run-server.sh` to reflect below**

```
gunicorn \
    --bind "${SUPERSET_BIND_ADDRESS:-0.0.0.0}:${SUPERSET_PORT:-8088}" \
    --access-logfile "${ACCESS_LOG_FILE:-$HYPHEN_SYMBOL}" \
    --error-logfile "${ERROR_LOG_FILE:-$HYPHEN_SYMBOL}" \
    --workers ${SERVER_WORKER_AMOUNT:-10} \
    --worker-class ${SERVER_WORKER_CLASS:-gthread} \
    --threads ${SERVER_THREADS_AMOUNT:-20} \
    --timeout ${GUNICORN_TIMEOUT:-300} \
    --keep-alive ${GUNICORN_KEEPALIVE:-2} \
    --max-requests ${WORKER_MAX_REQUESTS:-1000} \
    --max-requests-jitter ${WORKER_MAX_REQUESTS_JITTER:-0} \
    --limit-request-line ${SERVER_LIMIT_REQUEST_LINE:-0} \
    --limit-request-field_size ${SERVER_LIMIT_REQUEST_FIELD_SIZE:-0} \
    "${FLASK_APP}"
```

#### Build docker image and push to Azure container registry from docker-compose yaml file
``` export DOCKER_DEFAULT_PLATFORM=linux/amd64```
```
 docker buildx build -f docker-compose-non-dev.yml --platform linux/amd64 -t magasinacrdev.azurecr.io/superset:3.1.0 --push .
```
