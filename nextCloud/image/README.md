# NextCloud Full Image

La imatge oficial de NextCloud no te totes les dependències que es podrien arribar a necessitar instal·lades. Per tant, algunes característiques del servei com, en el meu cas, la previsualització del vídeos no estarien habilitades. Això significa que sovint haurem de personalitzar aquesta imatge perquè s'ajusti als nostres requisits. Si aquest és el vostre cas a continuació teniu un exemple de com fer-ho.

Abans de començar però cal tenir en compte que tant el `Dockerfile` com el `supervisord.conf` son extrets de la [documentació ofícial](https://github.com/nextcloud/docker/tree/master/.examples). Allà també trobareu altres exemples de imatges que us poden ser d'útilitat. Així que si voleu descarregar-vos algun altre `Dockerfile` diferent sou lliures de fer-ho.

Finalment, si ja tenim el nostre NextCloud desplegat podem procedir de la següent manera:

1. Construïm la imatge

    ```bash
    docker build . -t REGISTRY_NAME/nextcloud:full
    ```

2. Fem _push_ de la imatge

    ```bash
    docker push REGISTRY_NAME/nextcloud:full
    ```

3. Canviem la imatge del _deployment_

    ```bash
    kubectl set image deployment/nextcloud -n nextcloud nextcloud=REGISTRY_NAME/nextcloud:full
    ````

Per activar la previsualització de vídeos cal afegint els següents paràmetres al `config.php` (si també és el vostre cas):

```php  
'enable_previews' => true,
'enabledPreviewProviders' =>
array (
    0 => 'OC\\Preview\\Movie',
    1 => 'OC\\Preview\\PNG',
    2 => 'OC\\Preview\\JPEG',
    3 => 'OC\\Preview\\GIF',
    4 => 'OC\\Preview\\HEIC',
    5 => 'OC\\Preview\\BMP',
    6 => 'OC\\Preview\\XBitmap',
    7 => 'OC\\Preview\\MP3',
    8 => 'OC\\Preview\\TXT',
    9 => 'OC\\Preview\\MarkDown',
    10 => 'OC\\Preview\\MP4',
    11 => 'OC\\Preview\\MKV',
    12 => 'OC\\Preview\\AVI',
),
```
