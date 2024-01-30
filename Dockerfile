FROM python:3.8-slim

# Install cron
RUN apt-get update && apt-get -y install cron

# Copy the script into the container
COPY data_ingestion.py /app/
WORKDIR /app

# Install Python dependencies
RUN pip install requests

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/data-ingestion-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/data-ingestion-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log

ADD crontab /etc/cron.d/data-ingestion-cron

