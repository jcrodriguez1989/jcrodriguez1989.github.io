FROM rocker/r-rmd

RUN mkdir /home/personal_website
WORKDIR /home/personal_website

COPY . /home/personal_website

RUN apt update
RUN apt --assume-yes install libcurl4-openssl-dev libssl-dev libxml2-dev

RUN R -e "\
    install.packages(c('remotes', 'curl', 'vitae')); \
    remotes::install_github('hadley/emo');"