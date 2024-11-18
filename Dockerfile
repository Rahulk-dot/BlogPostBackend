# Use the official PHP image with Apache
FROM php:8.0-apache

# Set the working directory
WORKDIR /var/www/html

# Copy your backend code into the container
COPY . /var/www/html/

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Set Apache ServerName to avoid warnings
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Expose the port the app runs on
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
