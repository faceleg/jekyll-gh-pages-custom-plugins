# FROM ruby:3.1.4
FROM buildpack-deps:bookworm

# Set default locale for the environment	
ENV LC_ALL C.UTF-8	
ENV LANG en_US.UTF-8	
ENV LANGUAGE en_US.UTF-8	

# Install NodeJS
RUN apt-get update && apt-get install -y ca-certificates curl gnupg && apt-get clean
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
ENV NODE_MAJOR=21
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && apt-get install nodejs -y && apt-get clean

# Install image compressor/manager
RUN apt-get install -y libvips imagemagick libvips-tools && apt-get clean

# Install OpenJDK-11
RUN apt-get install -y default-jre && \
    apt-get clean;
