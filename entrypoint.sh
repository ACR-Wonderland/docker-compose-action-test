#!/bin/sh


STUDENT_REPO_ROOT="$GITHUB_WORKSPACE"

echo "Preparing to print entire GitHub workspace contents..."
ls -l /app
echo "__________________________________________________________________"

echo "Preparing to print github workspace contents..."
ls -l "$STUDENT_REPO_ROOT"
echo "_________________________________________________"


STUDENT_REPO_PATH="$GITHUB_WORKSPACE/submission"

echo "$STUDENT_REPO_PATH"

echo "Preparing to print the contents of the student repository..."
ls -l "$STUDENT_REPO_PATH"
echo "_________________________________________________________________"


python /app/autograder.py 
python $STUDENT_REPO_PATH/test.py

echo "Stopping PostgreSQL container..."


echo "✅ Autograding completed successfully!"

Preparing to print the contents of the student repository...
10
total 20
echo "🎉 Final results generated and sent to GitHub Classroom!"
