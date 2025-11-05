# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install Git and any other system dependencies
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install DVC and other dependencies
RUN pip install --no-cache-dir dvc pandas scikit-learn


# Initialize Git and DVC
RUN git init && \
    git config --global user.email "you@example.com" && \
    git config --global user.name "Your Name"
    #dvc init


# Command to run when the container starts
CMD ["tail", "-f", "/dev/null"]