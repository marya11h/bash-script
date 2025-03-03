#!/bin/bash

Dollar=92655
Api_address="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
Delay=10

while true; do

        bitcoin=$(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd" | jq -r '.bitcoin.usd')

        if [[ -z "$bitcoin" || ! "$bitcoin" =~ ^[0-9]+$ ]]; then
                echo "Error: No bitcoin price recieved."
                sleep "$Delay"
                continue
        fi

        Bitcoin_in_tomon=$(Dollar*bitcoin))"
        current_date=$(date)

        output="Bitcoin Price in Toman: $Bitcoin_in_toman -- $current_date"

        echo "$output"
        echo "$output" >> btc.txt
        sleep "$Delay"
done
