#!/usr/bin/env sh

statusDateTime=$(date '+%d-%m-%Y %H:%M:%S')

echo "----------------------------------"
echo "$statusDateTime Load .env variables"
echo "----------------------------------"


echo "APP_ENV: $APP_ENV"
echo "SHOP_LOCALE: $SHOP_LOCALE"
echo "SHOP_CURRENCY: $SHOP_CURRENCY"
echo "DATABASE_URL: $DATABASE_URL"