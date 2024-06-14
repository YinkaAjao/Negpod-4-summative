#!/bin/bash

# Extract emails from the student.txt file
cut -d',' -f5 students-list_1023.txt > student_emails.txt

echo "Emails extracted and saved to student_emails.txt"
