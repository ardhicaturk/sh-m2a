# Testing

find ./ -type f -name "*.md" \
    -exec pandoc \
    --atx-headers \
    --verbose \
    --wrap=none \
    --toc \
    --reference-links \
    -s \
    -t asciidoc {} -o ascii/{}.asc\;