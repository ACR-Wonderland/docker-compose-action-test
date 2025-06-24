import os
print("I am the autograder script. Behold my greatness!")
submission_dir = '/submission'

if os.path.exists(submission_dir) and os.path.isdir(submission_dir):
    for filename in os.listdir(submission_dir):
        print(filename)
else:
    print(f"Directory '{submission_dir}' does not exist.")
    
print("That's all, folks!")