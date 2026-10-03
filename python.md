# Python + pyenv-win Setup — Windows

## Purpose
- Installing the latest stable Python version on Windows using pyenv-win for better version control
- Creating a virtual environment

## 1. Install pyenv-win

Download 3.10.0 for the LTS version. This is documented in Sep, 2026.

Official repository:

https://github.com/pyenv-win/pyenv-win

Open the repository and follow its current **Installation** instructions.


## 2. Verify pyenv
Restart git bash and verify the installation

```bash
pyenv --version
```


A pyenv version should be displayed.

## 3. View available Python versions

```bash
pyenv install --list
```


## 4. Install the version required by the project

Example:
```bash
pyenv install 3.10.0
```


Replace `3.10.0` with the version required by your project.

## 5. Creating virtual environment

To create a virtual environment named "venv", go to git bash and enter
```bash
python -m venv venv
```

To activate the environment

venv\Scripts\activate


## 6. If python is already installed

1. You do not need to uninstall your existing Python version. First, check which version is currently installed:

```bash
python --version
```

2. View available Python versions

```bash
pyenv install --list
```

3. For installing and switching Python versions follow these commands:

```bash
pyenv install <version number>    # Installs a specific Python version 
pyenv versions            # List installed versions
pyenv global <version number>    # Set the default Python version
pyenv local <version number>      # Set the version for the current project
```
