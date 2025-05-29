#!/bin/bash

location="Southampton"

# Get the weather
raw_weather=$(curl -s "wttr.in/$location?format=1")

# Clean up: remove multiple spaces and weird invisible characters
weather=$(echo "$raw_weather" | sed 's/[[:space:]]\+/ /g' | tr -d '\u00A0')

#weather=$(echo "${raw_weather}")

echo "{\"text\": \"$weather\", \"tooltip\": \"Weather for $location\"}"

