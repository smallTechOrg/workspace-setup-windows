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

4. Install Hermes

For a Bash-based setup, Hermes can be installed through WSL2:

curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash

5. Verify Hermes
Restart git bash and verify the installation

hermes --version

If a version is displayed, Hermes is installed.




