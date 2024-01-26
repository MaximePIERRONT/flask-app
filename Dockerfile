# Base image
FROM alpine:latest

# Install python and pip
RUN apk add --update python3 py3-pip

# Create a virtual environment and activate it
RUN python3 -m venv /usr/src/app/venv
ENV PATH="/usr/src/app/venv/bin:$PATH"

# Upgrade pip in the virtual environment
RUN pip install --upgrade pip

# Install Python modules needed by the Python app in the virtual environment
RUN pip install --no-cache-dir Flask

# Copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Tell the port number the container should expose
EXPOSE 80

# Run the application using the virtual environment's Python interpreter
CMD ["python3", "/usr/src/app/app.py"]
