#!/bin/bash

echo "Welcome: "
echo "What do you want to do today?"
echo "Select an option"
echo "What do you want to do today? select an option"
echo "Select an option (1-3):"
read choice
echo "Hello, You have choosen,  $choice!"

function option1 {
  echo "Hello, You have choosen, $choice!"
  echo "Enter the students name"
  read name
  echo "Enter the students age"
  read age
  echo "Enter the students intake"
  read intake
  echo "$name, $age, $intake" >> students-list_1023.txt
  echO "Your record had been added"
}

function option2 {
  echo "You selected option 2."
}

function option3 {
  echo "You selected option 3."
}

function default_option {
  echo "Invalid option selected...Please start again"
}

case $choice in
  1)
    echo "You want to add a new record." ;;
    option1
    ;;
  2)
    echo "You want to list all students." ;;
    option2
    ;;
  3)
    echo "You want to delete a student." ;;
    option3
    ;;
  *)
    echo "Invalid input. Please try again" ;;
esac
    default_option
    ;;
