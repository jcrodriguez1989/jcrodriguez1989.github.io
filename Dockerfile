FROM rocker/r-rmd

RUN apt update
RUN apt --assume-yes install libcurl4-openssl-dev libssl-dev libxml2-dev

RUN R -e "\
    install.packages(c('remotes', 'vitae')); \
    remotes::install_github('hadley/emo');"

RUN useradd personal_website \
  && echo "personal_website:personal_website" | chpasswd \
  && mkdir /home/personal_website \
  && chown personal_website:personal_website /home/personal_website
ENV NB_USER personal_website
ENV NB_UID 1000
ENV HOME /home/personal_website

WORKDIR ${HOME}

COPY . ${HOME}

USER root
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}
