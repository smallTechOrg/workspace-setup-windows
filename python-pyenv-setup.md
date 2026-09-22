# Python + pyenv-win Setup — Windows

## Purpose
- Installing the latest stable Python version on Windows using pyenv-win for better version control
- Creating a virtual environment

## 1. Install pyenv-win

Official repository:

https://github.com/pyenv-win/pyenv-win

Open the repository and follow its current **Installation** instructions.

After installation, close PowerShell and open a new PowerShell window.

## 2. Verify pyenv


pyenv --version


A pyenv version should be displayed.

## 3. View available Python versions


pyenv install --list


## 4. Install the version required by the project

Example:

pyenv install 3.10.0


Replace `3.10.0` with the version required by your project.

## 5. Creating virtual environment

To create a virtual environment named "venv", go to Windows PowerShell and enter

python -m venv venv

To activate the environment

venv\Scripts\activate
