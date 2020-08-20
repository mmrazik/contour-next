while read line; do
    if echo $line | grep '^R' > /dev/null; then
        value=$(echo $line | cut -d'|' -f 4)
        timestamp=$(echo $line | cut -d'|' -f 9 | sed -e "s/\(....\)\(..\)\(..\)\(..\)\(..\)\(..\)/\1-\2-\3 \4:\5:\6+02/")

        echo "INSERT INTO contour_next VALUES ('$timestamp', $value);"
    fi
done
