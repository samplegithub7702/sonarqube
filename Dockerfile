# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory's contents into the container at /app
COPY . /app

# Install Flask library
RUN pip install Flask

# Expose port 8080 for the Flask app
EXPOSE 8080

# Define the command to run when the container starts
CMD ["python", "app.py"]

