# Use the official Apache HTTP Server image as the base image
FROM httpd:alpine

# Set the working directory to /usr/local/apache2/htdocs/
WORKDIR /usr/local/apache2/htdocs/

# Copy the current directory contents into the container at /usr/local/apache2/htdocs/
COPY . .

# Expose port 80 to the outside world
EXPOSE 8000

# Start Apache2 when the container launches
CMD ["httpd-foreground"]
