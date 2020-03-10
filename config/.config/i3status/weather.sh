#!/bin/sh

# crawl weather data from wttr.in

DATA=`curl -sfN "wttr.in/Helsinki?T" | head -n 7`

if [[ ! -z "$DATA" ]]
then
  echo -e "$DATA" | tee ~/.weather.cache
fi

