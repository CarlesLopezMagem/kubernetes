#/bin/sh

if [ -e /opt/LiberaForms/config/config.cfg ]
 then cp /opt/LiberaForms/config/config.cfg /opt/LiberaForms/config.cfg
fi

echo "$@"
$@
# sh /opt/GNGforms/entrypoint.sh "gunicorn" "-c" "/opt/gunicorn_gngforms.py" "GNGforms:app"