FROM python:3.12-slim-bookworm AS build-env
# 下のdistrolessとバージョンをあわせる
COPY . /app
WORKDIR /app

FROM gcr.io/distroless/python3-debian12:nonroot-amd64
COPY --from=build-env /app /app
WORKDIR /app
USER nonroot
CMD ["hello.py", "/etc"]
