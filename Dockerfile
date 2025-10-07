# pulling the python base image

FROM python:3.8-alpine

# Copy the requirements file from local to image

COPY ./requirements.tx /app/requirements.txt

# set working directory

WORKDIR /app

# install the dependancies and packages from requirements 

RUN apt update -y && apt install python3-pip -y
RUN apt install -r requirements.txt

# Copy every content from local to image

COPY ./app

# configure the port 5000 and run the application 

EXPOSE 5000

CMD ["python", main.py]


