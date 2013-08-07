/usr/local/bin/appledoc \
    --project-name "Silly Snake" \
    --project-company "Weizhong Yang" \
    --company-id "net.zonble" \
    --output "./appledoc" \
    --publish-docset \
    --logformat xcode \
    --keep-undocumented-objects \
    --keep-undocumented-members \
    --keep-intermediate-files \
    --no-repeat-first-par \
    --no-warn-invalid-crossref \
    --ignore "*.m" \
    --index-desc "../README.md" \
    "../SillySnake"
