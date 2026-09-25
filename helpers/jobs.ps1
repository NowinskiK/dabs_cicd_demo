# List all jobs
databricks jobs list

# List jobs with specific output format (JSON for easier parsing)
databricks jobs list --output json

# List jobs and filter by name (using grep/Select-Object)
databricks jobs list | Select-String "Test job"



# Delete a single job by ID
databricks jobs delete --job-id <JOB_ID>

# Delete multiple jobs (by ID)
databricks jobs delete --job-id 123
databricks jobs delete --job-id 456

# Batch Delete Script by job name pattern

# Get job IDs matching a pattern and delete them
$jobs = databricks jobs list --output json | ConvertFrom-Json
$jobs | Where-Object { $_.settings.name -like "*Test job*" } | ForEach-Object {
    Write-Host "Deleting job: $($_.job_id) - $($_.settings.name)"
    databricks jobs delete $_.job_id
}


# Batch Delete Script - all
$jobs = databricks jobs list --output json | ConvertFrom-Json
$jobs | ForEach-Object {
    Write-Host "Deleting job: $($_.job_id) - $($_.settings.name)"
    databricks jobs delete $_.job_id
}


