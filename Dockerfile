# Use an official base image. I'm assuming Debian or Ubuntu since the script uses apt.
FROM debian:bullseye-slim

# Set environment variable to prevent questions from APT
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary software
RUN apt-get update -y && \
    apt-get install -y dirmngr wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and install the fr24feed package
RUN wget https://repo-feed.flightradar24.com/linux_x86_64_binaries/fr24feed_1.0.34-0_amd64.deb && \
    dpkg -i fr24feed_1.0.34-0_amd64.deb && \
    rm fr24feed_1.0.34-0_amd64.deb

# Run the software directly when starting the container
CMD ["fr24feed"]
