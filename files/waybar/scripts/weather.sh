#!/bin/bash

curl -s 'https://api.openweathermap.org/data/2.5/weather?q=YOUR_CITY,uk&appid=YOUR_API_KEY' -o weather.json

temp=$(jq '.main.temp' weather.json)
temp_c=$(echo "$temp - 273.15" | bc -l)
temp_c=$(printf "%.0f" "$temp_c")

conditions=$(jq -r '.weather[0].description' weather.json)

case "$conditions" in
  "clear sky") output="☀️" ;;
  "few clouds") output="🌤️" ;;
  "scattered clouds") output="🌥️" ;;
  "broken clouds") output="☁️" ;;
  "shower rain") output="🌧️" ;;
  "rain") output="🌦️" ;;
  "thunderstorm") output="🌩️" ;;
  "snow") output="❄️" ;;
  "mist") output="🌫️" ;;
  *) output="❓" ;;  # fallback for unknown conditions
esac

echo "$output $temp_c°C"

