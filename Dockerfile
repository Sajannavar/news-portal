# Use the official PHP image with Apache
FROM php:8.1-apache

# Install PDO MySQL extension
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Copy the project files to the container
COPY . .

# Set permissions for the Apache server
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]

