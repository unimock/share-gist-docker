#!/bin/sh

set -e

# enable debug mode if desired
if [[ "${DEBUG}" == "true" ]]; then 
    set -x
fi

cp -f /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

FI=/etc/nginx/http.d/default.conf
echo "server {"                                                              > $FI
echo "  listen 80 default_server;listen [::]:80 default_server;"            >> $FI
echo "  location / { return 404; }"                                         >> $FI

list=$(ls /httpd)
for i in $list ; do
  echo "  location /$i        { autoindex off ; root /httpd ; }"            >> $FI
  echo "  location /$i/browse { autoindex on  ; root /httpd ; }"            >> $FI
done

echo "  location = /404.html { internal; }"                                 >> $FI
echo "}"                                                                    >> $FI

exec nginx
