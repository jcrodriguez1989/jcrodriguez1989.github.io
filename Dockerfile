FROM rocker/r-rmd

RUN apt update
RUN apt --assume-yes install libcurl4-openssl-dev libssl-dev libxml2-dev

ENV NB_USER personal_website
ENV NB_UID 1000
ENV HOME /home/personal_website

RUN mkdir ${HOME}
WORKDIR ${HOME}

COPY . ${HOME}

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

RUN R -e "\
    install.packages(c('remotes', 'vitae')); \
    remotes::install_github('hadley/emo');"
