# Set the path to the code directory inside analysis
code_dir <- file.path("build", "code")

# List of scripts to run
scripts <- c("download_trade.r", "download_democracy.r", "clean_trade.r", 
             "clean_democracy.r", "merge_trade_democracy.r")

# Loop through each script and source it
for (script in scripts) {
  script_path <- file.path(code_dir, script)
  message("Running: ", script_path)
  source(script_path)
  message("Finished: ", script_path, "\n")
}

message("All scripts completed.")



