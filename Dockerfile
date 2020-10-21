FROM rocker/shiny
USER root
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  git libudunits2-dev libxml2-dev libssl-dev libpng-dev libtiff5-dev libjpeg-dev libv8-dev \
  && git clone https://github.com/aursiber/DRomics shinyapp \
  && Rscript shinyapp/inst/DRomics-shiny/rinstall.txt \
  && rm -r /srv/shiny-server/* \
  && cp -a shinyapp/inst/DRomics-shiny/* /srv/shiny-server
