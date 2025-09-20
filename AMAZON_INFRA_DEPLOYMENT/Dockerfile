# Use a base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install Apache + Git
RUN apt-get update && \
    apt-get install -y apache2 git && \
    rm -rf /var/lib/apt/lists/*

# Clone your GitHub repository
RUN git clone https://github.com/Ironhack-Archive/online-clone-amazon.git /app

# Move the cloned files to Apache's root directory
RUN cp -r /app/* /var/www/html/

# Expose HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
