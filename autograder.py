import os

workspace = os.environ.get("GITHUB_WORKSPACE")
if not workspace:
    print("GITHUB_WORKSPACE environment variable is not set.")
else:
    submission_dir = os.path.join(workspace, "submission")
    if not os.path.isdir(submission_dir):
        print(f"Directory '{submission_dir}' does not exist.")
    else:
        for filename in os.listdir(submission_dir):
            print(filename)