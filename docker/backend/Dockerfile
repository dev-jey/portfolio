# pull official base image
# Multistep dockerfile
FROM python:3.7-slim as build

# set work directory
WORKDIR /portfolio

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip

COPY ./Pipfile .
COPY ./Pipfile.lock .
RUN pip install --user pipenv
RUN python -m pipenv install

FROM python:3.7-slim as app

WORKDIR /portfolio

# Default user arguments
ARG USER_ID=1000
ARG GROUP_ID=1000

# Define the name of the user
ARG APP_USER=portfoliouser
ARG GROUP_USER=portfoliogroup

# Create user and group
RUN groupadd -g ${GROUP_ID} ${GROUP_USER} && useradd -u ${USER_ID} -g ${GROUP_USER} -s /bin/sh ${APP_USER}

# Install ca certificates
RUN apt-get update \
    && apt-get install ca-certificates -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /root /root
RUN chown -R ${APP_USER}:${GROUP_USER} /root
# Give user permissions to dependecies
RUN chmod 755 /root

# Copy project
COPY . .

# Give user permissions to working directory
RUN chown -R ${APP_USER}:${GROUP_USER} /portfolio
RUN chmod 755 /portfolio

USER ${APP_USER}
