# Use a lightweight NGINX base image
FROM nginx:alpine

# Remove default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf || true

# Copy your custom NGINX configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Cloud Run 8080 portu bekliyor - bunu degistirme!
EXPOSE 8080

# NGINX foreground'da calistir
CMD ["nginx", "-g", "daemon off;"]
