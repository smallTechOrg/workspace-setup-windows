# Node.js Setup — Windows

## Purpose
Set up your Node.js development environment on a new Windows machine using `nvm-windows` 

## Requirements
- Windows 10 or 11
- [nvm-windows](https://github.com/coreybutler/nvm-windows/releases)
- Visual Studio Code (recommended)

## 1. Download Node.js

Official website:

https://nodejs.org/en/download/

Download 26.x version for the LTS version. This is documented in Sep, 2026.


## 2. Restart the terminal

Close PowerShell and open a new PowerShell window.

## 3. Verify Node.js
Restart git bash and verify the installation
```bash
node --version
```


## 4. Verify npm

```bash
npm --version
```


Both commands should return version numbers.


## 5. Changing node version

nvm can be used to change node version based on the project. You just need to install and use a perticular version.

```bash
npm install <version number>   # for example nvm install 24.10.0
npm use <version number>       # for example nvm use 24.10.0
```