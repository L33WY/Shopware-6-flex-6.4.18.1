#!/usr/bin/env sh

statusDateTime=$(date '+%d-%m-%Y %H:%M:%S')

echo "----------------------------------"
echo "$statusDateTime Run composer install"
echo "----------------------------------"

composer install --no-scripts

. ./bin/read-env-variables.sh

echo "----------------------------------"
echo "$statusDateTime Ensure correct file owner"
echo "----------------------------------"

sudo chown www-data:www-data /var/www/html/public -R


echo "----------------------------------"
echo "$statusDateTime Load .env variables"
echo "----------------------------------"

set -a
. "$APACHE_DOCROOT/../.env"
set +a


echo "APP_ENV: $APP_ENV"
echo "SHOP_LOCALE: $SHOP_LOCALE"
echo "SHOP_CURRENCY: $SHOP_CURRENCY"
echo "DATABASE_URL: $DATABASE_URL"

echo "----------------------------------"
echo "$statusDateTime Install new system"
echo "----------------------------------"

bin/console system:install --basic-setup --shop-name="$SHOP_NAME" --shop-locale="$SHOP_LOCALE"  --shop-currency="$SHOP_CURRENCY" --force


echo "----------------------------------"
echo "$statusDateTime Build Storefront"
echo "----------------------------------"

./bin/build-storefront.sh


echo "----------------------------------"
echo "$statusDateTime Shop set up completed"
echo "----------------------------------"