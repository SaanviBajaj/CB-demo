# STEP 1: Choose a Base Image
# We use 'nginx-unprivileged' because OpenShift forbids running as root
FROM nginxinc/nginx-unprivileged:alpine

# STEP 2: Copy your code
# This moves your HTML files from GitHub into the web server's folder
COPY "CB Demo Web Page.html" /usr/share/nginx/html/index.html

# STEP 3: Define the Port
# Unprivileged Nginx uses 8080 instead of the standard port 80
EXPOSE 8080
