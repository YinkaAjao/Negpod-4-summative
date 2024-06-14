#!/bin/bash

# Function to creiiate a new student record
create_student() {
  # Prompt for details and store in variables
  read -p "Enter Student ID: " student_id
  read -p "Enter Student Name: " student_name
  read -p "Enter Student Email: " student_email
  read -p "Enter Student Age: " student_age
  read -p "Enter Student Intake: " student_intake

  # Append data to students-list.txt
  echo "$student_id,$student_name,$student_email,$student_age,$student_intake" >> students-list_1023.txt
}

# Function to list all student recordis
list_students() {
  cat students-list_1023.txt
}

# Function to delete a student record by ID
delete_student() {
  # Prompt for ID to delete
  read -p "Enter Student ID to Delete: " delete_id

    # Search for the record in the file
    record=$(grep -i "$student_id" students-list_1023.txt)

    # Check if a record was found
    if [ -n "$record" ]; then
        # Prompt the user to confirm the deletion
        read -p "Are you sure you want to delete the record (y/n) " confirm

        # Delete the record if the user confirms
        if [ "$confirm" = "y" ]; then
            grep -v "$student_id" students-list_1023.txt >temp_file.txt
            mv temp_file.txt students-list_1023.txt
        else
            echo "Deletion cancelled."
        fi
    else
        echo "No record found for '$student_id'."
    fi
}

# Function to update a student record by ID
update_student() {
  # Prompt for ID to update
  read -p "Enter Student ID to Update: " update_id

  # Find the record line
  student_line=$(grep "^$update_id," students-list_1023.txt)

  if [[ -z "$student_line" ]]; then
    echo "Student ID not found!"
    return
  fi

  # Extract details and prompt for updates
  read -p "Update Name:" new_name
  read -p "Update Email:" new_email
  read -p "Update Age:" new_age
  read -p "update Intake:" new_intake

  # Update data in the record line
  updated_line="${update_id},${new_name:-$(echo "$student_line" | cut -d ',' -f2)},${new_email:-$(echo "$student_line" | cut -d ',' -f3)},${new_age:-$(echo "$student_line" | cut -d ',' -f4)},${new_intake:-$(echo "$student_line" | cut -d ',' -f4)}"

  # Replace the record line in the file
  sed -i "/^$update_id,/c $updated_line" students-list_1023.txt
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
grep -P ',\w+@[\w\.]+\w+' students-list_1023.txt > student-emails.txt
