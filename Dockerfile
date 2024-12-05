FROM python:3.10 AS build
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
COPY . /src
RUN cd /src && jupyter-book build --all .

FROM nginxinc/nginx-unprivileged:stable-alpine
COPY --from=build /src/_build/* /usr/share/nginx/html/
