#!/bin/sh


STUDENT_REPO_ROOT="$GITHUB_WORKSPACE"

echo "Preparing to print github workspace contents..."
ls -l "$STUDENT_REPO_ROOT"



STUDENT_REPO_PATH="$GITHUB_WORKSPACE/submission"

echo "$STUDENT_REPO_PATH"

echo "Preparing to print the contents of the student repository..."
ls -l "$STUDENT_REPO_PATH"


python /app/autograder.py 
python $STUDENT_REPO_PATH/test.py

echo "Stopping PostgreSQL container..."


echo "✅ Autograding completed successfully!"


echo "🎉 Final results generated and sent to GitHub Classroom!"
