#!/bin/bash

# Function to move files to a directory
move_to_directory() {

  # Construct directory name
  student_record_dir="negpod_4-q1"  # Replace with desired naming convention

  # Create directory if it doesn't exist
  mkdir -p "$student_record_dir" || {
    echo "Error: Could not create directory '$student_record_dir'."
    return 1  # Exit function with error code
  }

  # List of student record files (modify as needed)
  files_to_move=(
    "Main.sh"
    "select-emails.sh"
    "students-list_1023.txt"
    "select-emails.txt"
    "student_emails.txt"
    "README.md"
  )

  # Move files with error handling
  for filename in "${files_to_move[@]}"; do
    if [[ ! -f "$filename" ]]; then
      #echo "Warning: File '$filename' not found. Skipping..."
      continue
    fi

    mv "$filename" "$student_record_dir" || {
      echo "Error: Could not move '$filename' to directory '$student_record_dir'."
      return 1  # Exit function with error code
    }
  done

  echo "Files moved successfully to directory: $student_record_dir"
}

# Main function for script execution
main() {
  # Display a welcome message
  echo  "Welcome to the Student Record File Mover!"

  # Call the move_to_directory function
  move_to_directory

  # Display a completion message
  echo "File move process completed."
}

# Execute the main function
main

# Optional: Add functionality for taking arguments (Negpod ID)
#if [[ $# -eq 1 ]]; then
 #  student_id="$1"
  # move_to_directory "$student_id"
#else
 # echo "Usage: $0 <Negpod ID>"
#fi
