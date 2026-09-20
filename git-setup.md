# Git Setup — Windows

## What is Git?

Git is a version-control tool used to download repositories, create branches, commit changes, and push code.

## 1. Download Git

Official website:

https://git-scm.com/install/windows

For most Windows PCs, download the **x64 Setup** installer.

## 2. Install Git

1. Open the downloaded installer.
2. If Windows asks for permission, select **Yes**.
3. Continue through the installer.
4. Keep the recommended/default options.
5. Click **Install**.
6. Click **Finish**.

Git for Windows also installs Git Bash.

## 3. Verify Git

Open a **new** PowerShell window:

```powershell
git --version
```

A Git version should be displayed.

## 4. Configure your Git identity

```powershell
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

Check the configuration:

```powershell
git config --global --list
```

## Troubleshooting

If `git` is not recognized, close PowerShell and open a new window. If it still fails, reinstall Git using the recommended PATH option.

## Official links

- Git for Windows: https://git-scm.com/install/windows
- Git for Windows project: https://gitforwindows.org/
