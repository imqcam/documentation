FROM python:3.10 as build
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
COPY . /src
RUN cd /src && jupyter-book build --all .

FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /src/_build/* /usr/share/nginx/html/
