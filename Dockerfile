FROM python:3.8.8-alpine3.13

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY ./requirements.txt requirements.txt
RUN pip install --upgrade pip &&\
    pip install --no-cache-dir -r requirements.txt

# copy project
COPY . .

#expose port 5000
EXPOSE 5000

#run gunicorn
CMD ["gunicorn", "-w", "4", "--bind", "0.0.0.0:5000", "app:create_app()"]