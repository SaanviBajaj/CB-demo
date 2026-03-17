FROM nginxinc/nginx-unprivileged:alpine

# Step 1: Copy everything
COPY . /usr/share/nginx/html/

# Step 2: Switch to root to fix the filename and permissions
USER root

# Rename the file and ensure the nginx user can read everything
RUN mv "/usr/share/nginx/html/CB Demo Web Page.html" /usr/share/nginx/html/index.html && \
    chmod -R 755 /usr/share/nginx/html/

# Step 3: Switch back to the unprivileged user (standard for this image)
USER 101

EXPOSE 8080
