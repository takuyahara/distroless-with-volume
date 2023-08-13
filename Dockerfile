FROM gcr.io/distroless/static
LABEL org.opencontainers.image.source https://github.com/takuyahara/distroless-with-volume

ADD app/greeting /app/greeting

ENTRYPOINT [ "/app/greeting" ]
