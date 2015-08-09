FROM python:2.7
ENV PYTHONUNBUFFERED 1

RUN mkdir /webapp
WORKDIR /webapp/

# Install pip dependencies
COPY requirements.txt requirements.txt
COPY prod-requirements.txt prod-requirements.txt
RUN pip install -r requirements.txt \
    && pip install -r prod-requirements.txt

# Copy the project

COPY . /webapp/

EXPOSE 5000

CMD ["./deploy/deploy_script.sh"]
