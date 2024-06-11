#!/bin/bash

# Function to create a new student record
create_student() {
  # Prompt for details and store in variables
  read -p "Enter Student ID: " student_id
  read -p "Enter Student Email: " student_email
  read -p "Enter Student Age: " student_age

  # Append data to students-list.txt
  echo "$student_id,$student_email,$student_age" >> students-list.txt
}

# Function to list all student records
list_students() {
  cat students-list.txt
}

# Function to delete a student record by ID
delete_student() {
  # Prompt for ID to delete
  read -p "Enter Student ID to Delete: " delete_id

  # Filter and save records excluding the deleted ID
  grep -v "^$delete_id," students-list.txt > temp_list.txt
  mv temp_list.txt students-list.txt
}

# Function to update a student record by ID
update_student() {
  # Prompt for ID to update
  read -p "Enter Student ID to Update: " update_id

  # Find the record line
  student_line=$(grep "^$update_id," students-list.txt)

  if [[ -z "$student_line" ]]; then
    echo "Student ID not found!"
    return
  fi

  # Extract details and prompt for updates
  read -p "Update Email:" new_email
  read -p "Update Age:" new_age

  # Update data in the record line
  updated_line="${update_id},${new_email:-$(echo "$student_line" | cut -d ',' -f2)},${new_age:-$(echo "$student_line" | cut -d ',' -f3)}"

  # Replace the record line in the file
  sed -i "/^$update_id,/c $updated_line" students-list.txt
}

# Main menu loop
while true; do
  echo "Student Management System"
  echo "1. Create Student Record"
  echo "2. List Student Records"
  echo "3. Delete Student Record"
  echo "4. Update Student Record"
  echo "5. Exit"
  read -p "Enter your choice: " choice

  case $choice in
    1) create_student ;;
    2) list_students ;;
    3) delete_student ;;
    4) update_student ;;
    5) exit ;;
    *) echo "Invalid choice!" ;;
  esac
done

# Script to extract student email addresses (optional)
grep -P ',\w+@[\w\.]+\w+' students-list.txt > student-emails.txt
