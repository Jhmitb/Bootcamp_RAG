# Use official Python 3.11 slim image
FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip setuptools wheel \
    && pip install -r requirements.txt

# Copy all app files to the container
COPY . .

# Run welcome.py when the container starts
CMD ["streamlit", "run", "main.py", "--server.port=8000", "--server.address=0.0.0.0", "--server.enableCORS=false"]