FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/
RUN python setup.py install
RUN django-admin startproject testproject . 
RUN cp -f settings.py testproject/settings.py
