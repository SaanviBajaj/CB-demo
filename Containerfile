FROM registry.access.redhat.com/ubi9/nginx-122:latest

# Step 1: Copy your files
# In UBI, the NGINX user (1001) usually has permissions to this folder already
COPY . ./

# Step 2: Fix the filename
# Since we are already the 'default' user, we don't necessarily need 'USER root' 
# unless the files being copied are owned by a different local user.
USER root

RUN mv "/usr/share/nginx/html/index.html" /usr/share/nginx/html/index.html && \
    chown -R 1001:0 /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

# Step 3: Switch back to the standard UBI unprivileged user
USER 1001

# UBI NGINX defaults to port 8080
EXPOSE 8080
