import json
import os
import subprocess


def create_virtualenv(venv_path):
    subprocess.run(["python3", "-m", "venv", venv_path])

    # create pyrightconfi file
    pyrightconfig = {"executionEnviroments": [{"root": "src"}]}

    with open("pyrightconfig.json", "w") as file:
        json.dump(pyrightconfig, file, indent=4)


if __name__ == "__main__":
    venv_name = input("Enter the name of the virtual enviroment: ")
    venv_path = os.path.join(os.getcwd(), venv_name)
    create_virtualenv(venv_path)
    print(
        f"Vritual enviroment {venv_name} and pyrightconfig.json created successfully."
    )
