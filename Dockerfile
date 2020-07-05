# Use the official image as a parent image.
FROM anapsix/alpine-java

# Set the working directory in mule image
ENV APP_HOME /opt
WORKDIR $APP_HOME

# Copy local mule to the container image
COPY . /opt

# Run the commands inside your image filesystem.
RUN unzip -o mule.zip
RUN mv /opt/mule-enterprise-standalone-3.9.4-hf1 /opt/mule

# Copy mule apps to the container image
COPY apps /opt/mule/apps

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8080

# Inform Docker that the container is listening on the specified port at runtime.
# Service must listen to $PORT environment variable.
# This default value facilitates local development.
ENV PORT 8080

# Start mule server
CMD exec /opt/mule/bin/mule --bind 0.0.0.0:$PORT 
