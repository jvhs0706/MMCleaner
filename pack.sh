zip -r MMCleaner.zip META-INF action.sh module.prop
git add .

# Get current date and time for commit message
current_time=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "Update MMCleaner - $current_time"
git push origin main