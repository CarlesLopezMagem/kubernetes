#/bin/sh

if [ -e config/config.cfg ]
 then cp config/config.cfg ./
fi

echo "$@"
$@
# sh /opt/GNGforms/entrypoint.sh "gunicorn" "-c" "/opt/gunicorn_gngforms.py" "GNGforms:app"