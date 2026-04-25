# Use a lightweight NGINX base image
FROM nginx:alpine

# Remove default NGINX configuration (optional, but good practice to ensure only your config applies)
RUN rm /etc/nginx/conf.d/default.conf || true # Add || true to prevent error if file doesn't exist

# Copy your custom NGINX configuration
# We'll put it in /etc/nginx/conf.d/ to follow NGINX best practices for includes
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose the port your NGINX server listens on (Cloud Run expects 8080 by default)
EXPOSE 8080

# Command to run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
