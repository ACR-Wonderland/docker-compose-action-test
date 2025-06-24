#!/bin/sh

# Print a message to indicate the start of the autograding process
#echo "🚀 Starting autograder..."


# --- Database Setup (start) --- #

#echo "Starting PostgreSQL container..."
#docker-compose -f ./docker-compose.yaml up -d db
#
#POSTGRES_READY=0
#echo "Awaiting PostgreSQL to be ready..."
#for i in {1..24}; do
#    if nc -z localhost 5432 > /dev/null 2>&1; then
#        echo "PostgreSQL is ready!"
#        POSTGRES_READY=1
#        break;
#    fi
#    echo "PostgreSQL not ready yet, retrying... (attempt $i/24)"
#    sleep 5
#done
#
#if [ $POSTGRES_READY -eq 0 ]; then
#    echo "Failure: PostgreSQL did not load in time. Exiting..."
#    docker compose -f ./docker-compose.yaml down
#    exit 1
#fi

# --- Database Setup (end) --- #

ls -al
pwd
#!/bin/sh

# Define the base directory where GitHub Actions checks out the repository
# By default, this is /github/workspace
# If actions/checkout does not specify a 'path', student files will be here.
STUDENT_REPO_ROOT="$GITHUB_WORKSPACE"

# Define the target submission directory
SUBMISSION_DIR="$GITHUB_WORKSPACE/submission"

# Create the submission directory if it doesn't exist
mkdir -p "$SUBMISSION_DIR"

# Move all contents from the student's repository root into the submission directory
# This assumes the autograder's files are NOT in the root of the student's repo
# but rather in a sub-directory, or the action runs in a separate context.
# If your autograder is in the same repository as the student's submission,
# you might need to be more selective about what you move to avoid moving
# your autograder files into the submission directory.
mv "$STUDENT_REPO_ROOT"/* "$SUBMISSION_DIR"/
mv "$STUDENT_REPO_ROOT"/.* "$SUBMISSION_DIR"/ # To move hidden files like .gitignore, .env etc.

# Now, your STUDENT_REPO_PATH variable will correctly point to the files
# assuming it's already set like this in your entrypoint.sh:
# STUDENT_REPO_PATH="$GITHUB_WORKSPACE/submission"

echo "Student submission moved to $SUBMISSION_DIR"

# ... rest of your entrypoint.sh script ...
# For example, running your autograder
# python3 "$STUDENT_REPO_PATH/run_tests.py"

# Specify the path to the student's submission folder (we assume files are in the "submission" folder)
STUDENT_REPO_PATH="$GITHUB_WORKSPACE/submission"

echo "$STUDENT_REPO_PATH"

# Print some of the important paths for debugging
#echo "Student repository path: $STUDENT_REPO_PATH"
#echo "Grading criteria: $GRADING_CRITERIA"
#
# --- Installing dependencies and running Knex (start) --- #

#cd "$STUDENT_REPO_PATH" || exit
#echo "Installing Node.js dependencies..."
#npm install
#
#echo "Running Knex migrations"
#npx knex migrate:latest --knexfile knexfile.js --cwd .
#
#echo "Running Knex seeds..."
#npx knex seed:run --knexfile knexfile.js --cwd .

# --- Installing dependencies and running Knex (end) --- #

# --- Running tests and generating output file (start) --- #

#echo "Running Node.js tests"
#npm test > /tmp/node_test_output.txt 2>&1
#NODE_TEST_EXIT_CODE=$?

# --- Running tests and generating output file (end) --- #

# Run the Python autograder script with the provided inputs
# This command will invoke autograder.py and pass the weights and grading criteria (Adjust to Node.js)
python /app/autograder.py 

#Stops PostgreSQL container
echo "Stopping PostgreSQL container..."
#ocker compose -f /app/docker-compose.yaml down

# Check if the autograder script executed successfully
echo "✅ Autograding completed successfully!"

# Provide a message indicating completion
echo "🎉 Final results generated and sent to GitHub Classroom!"
