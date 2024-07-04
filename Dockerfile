FROM python:3-slim AS build-env
COPY . /app
WORKDIR /app

FROM gcr.io/distroless/python3:nonroot-amd64
COPY --from=build-env /app /app
WORKDIR /app
USER nonroot
CMD ["hello.py", "/etc"]
