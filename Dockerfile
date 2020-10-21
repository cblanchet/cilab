FROM rocker/shiny
USER root
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  git \
  && git clone https://github.com/aursiber/Mondrian shinyapp \
  && Rscript shinyapp/inst/MondrianShiny/rinstall.txt \
  && rm -r /srv/shiny-server/* \
  && cp -a shinyapp/inst/MondrianShiny/* /srv/shiny-server
