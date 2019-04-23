#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then

  # units/udunits2 dependency:
  sudo apt-get install --yes libudunits2-dev

fi
