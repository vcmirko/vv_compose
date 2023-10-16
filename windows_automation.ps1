# Define the path to your Chrome bookmarks file
$bookmarksFilePath = "C:\Users\Administrator.DEMO\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"

# Read the JSON data from the file
$jsonData = Get-Content $bookmarksFilePath | ConvertFrom-Json

# Define the new bookmark entry
$newBookmark = @{
    "date_added" = (Get-Date).Ticks
    "guid" = [System.Guid]::NewGuid().ToString()
    "id" = [System.Guid]::NewGuid().ToString()
    "name" = "Ansible Forms"
    "type" = "url"
    "url" = "https://awx.demo.netapp.com:8443/#/"
}

# Add the new bookmark to the "bookmark_bar" children
$jsonData.roots.bookmark_bar.children += $newBookmark

# Convert the updated JSON data back to a string
$updatedData = $jsonData | ConvertTo-Json -Depth 5

# Write the updated data back to the bookmarks file
$updatedData | Set-Content $bookmarksFilePath

Write-Host "Bookmark added successfully."

# Define the path to the "preferences" file
$preferencesFilePath = "C:\Users\Administrator.DEMO\AppData\Local\Google\Chrome\User Data\Default\Preferences"

# Read the JSON content from the file
$jsonData = Get-Content $preferencesFilePath | ConvertFrom-Json

# Update the URL in the "startup_urls" array
$jsonData.session.startup_urls[0] = "https://volvo.com"

# Convert the updated JSON data back to a string
$updatedData = $jsonData | ConvertTo-Json -Depth 5

# Write the updated data back to the "preferences" file
$updatedData | Set-Content $preferencesFilePath

Write-Host "URL updated successfully."

powershell -command "Set-WinUserLanguageList -Force 'nl-BE'"