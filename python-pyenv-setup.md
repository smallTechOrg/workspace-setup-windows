# Python + pyenv-win Setup — Windows

## What are Python and pyenv-win?

Python is a programming language used by Python applications.

`pyenv-win` lets you install and switch between Python versions.

> On Windows, use **pyenv-win** for native Windows setup.

## 1. Install pyenv-win

Official repository:

https://github.com/pyenv-win/pyenv-win

Open the repository and follow its current **Installation** instructions.

After installation, close PowerShell and open a new PowerShell window.

## 2. Verify pyenv

```powershell
pyenv --version
```

A pyenv version should be displayed.

## 3. View available Python versions

```powershell
pyenv install -l
```

## 4. Install the version required by the project

Example:

```powershell
pyenv install 3.10.0
```

Replace `3.10.0` with the version required by your project.

## 5. Set a global Python version

```powershell
pyenv global 3.10.0
```

Verify:

```powershell
python --version
```

## 6. Set a project-specific Python version

This is useful when different projects require different versions.

```powershell
cd path\to\project
pyenv local 3.10.0
```

Then:

```powershell
python --version
```

## 7. Verify pip

```powershell
pip --version
```

## 8. Create a virtual environment when required

Inside the project:

```powershell
python -m venv .venv
```

Activate it:

```powershell
.venv\Scripts\Activate.ps1
```

You should see `(.venv)` in the terminal prompt.

If the project has `requirements.txt`:

```powershell
pip install -r requirements.txt
```

## Troubleshooting

### `pyenv` is not recognized

Close PowerShell and open a new one. If it still fails, check the PATH instructions in the official pyenv-win repository.

### Python version is not changing

Run:

```powershell
pyenv versions
pyenv version
python --version
```

A project-level `.python-version` may override the global version.

## Official links

- pyenv-win: https://github.com/pyenv-win/pyenv-win
- Python downloads: https://www.python.org/downloads/windows/
- Python documentation: https://docs.python.org/3/
