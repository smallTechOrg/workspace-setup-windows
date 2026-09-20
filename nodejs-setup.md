# Node.js Setup — Windows

## What is Node.js?

Node.js lets JavaScript and TypeScript applications and development tools run on your computer. npm is installed with Node.js.

## 1. Download Node.js

Official website:

https://nodejs.org/en/download/

Choose the **LTS** release unless your project specifies another version.

For most Windows PCs, choose the Windows x64 installer.

## 2. Install Node.js

1. Open the downloaded `.msi` file.
2. Click **Next**.
3. Accept the license agreement.
4. Keep the default installation location.
5. Keep the default features.
6. Continue through the installer.
7. Click **Install**.
8. Click **Finish**.

## 3. Restart the terminal

Close PowerShell and open a new PowerShell window.

## 4. Verify Node.js

```powershell
node --version
```

## 5. Verify npm

```powershell
npm --version
```

Both commands should return version numbers.

## 6. Check installation paths

```powershell
where.exe node
where.exe npm
```

## 7. Install project dependencies

Go to the project:

```powershell
cd path\to\project
```

If the project contains `package.json`, normally run:

```powershell
npm install
```

Then follow the project's README for the command used to start the application.

## Troubleshooting

### `node` is not recognized

1. Close PowerShell.
2. Open a new PowerShell window.
3. Run `node --version` again.

If it still fails, reinstall Node.js and ensure it is added to PATH.

### Wrong Node.js version

Check the project's README, `package.json`, `.nvmrc`, or other version configuration before changing versions.

## Official links

- Node.js: https://nodejs.org/en/download/
- npm installation documentation: https://docs.npmjs.com/downloading-and-installing-node-js-and-npm/
