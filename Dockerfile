FROM cirrusci/flutter:stable-web

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter build web

# Use any static web server to serve build/web
CMD ["flutter", "run", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"