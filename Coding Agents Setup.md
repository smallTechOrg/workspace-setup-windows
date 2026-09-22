Coding agent setup


1. Requirements

Download and install Git for Windows, which includes Git Bash.
* [Git Setup](git-setup.md)
After installation, open Git Bash and verify:

git --version

2. Install Claude Code

From Git Bash:

npm install -g @anthropic-ai/claude-code

3. Verify Claude Code
Restart git bash and verify the installation

claude --version
claude doctor

If a version is displayed, Claude Code is installed.

4. To use Claude Code directly in VS Code:

1. Open VS Code.
2. Open Extensions (Ctrl + Shift + X).
3. Search for Claude Code.
4. Install the official Claude Code extension.
5. Open your project in VS Code.
6. Open the Claude Code panel from the VS Code sidebar.

5. Install Hermes

Its CLI installer uses PowerShell:

iex (irm https://hermes-agent.nousresearch.com/install.ps1)


6. Verify Hermes
Restart git bash and verify the installation

hermes --version

If a version is displayed, Hermes is installed.

7. Hermes for Desktop

https://hermes-agent.nousresearch.com/desktop
Download and install Hermes Desktop for Windows, then launch the application.

The Desktop app and Hermes CLI can be used together and share the same Hermes installation and data



