# Set the path to the code directory inside analysis
code_dir <- file.path("analysis", "code")

# List of scripts to run
scripts <- c("figure_1.r", "figure_2.r", "figure_3.r")

# Loop through each script and source it
for (script in scripts) {
  script_path <- file.path(code_dir, script)
  message("Running: ", script_path)
  source(script_path)
  message("Finished: ", script_path, "\n")
}

message("All scripts completed.")