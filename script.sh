git add .
RETRY_COUNT=0
while [ $RETRY_COUNT -lt 5 ]; do
    git commit -m "test"
    git push origin master
    
    if [ $? -eq 0 ]; then
        echo "Image version updated"
        exit 0
    else
        echo "Push failed, retrying in $RETRY_DELAY seconds..."
        sleep 5
        RETRY_COUNT=$((RETRY_COUNT + 1))
        git reset --soft HEAD~1
        git pull origin master
    fi
done