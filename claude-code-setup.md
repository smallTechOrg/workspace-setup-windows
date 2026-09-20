# Claude Code Setup — Windows

## What is Claude Code?

Claude Code is Anthropic's command-line coding assistant. It can inspect repositories, explain code, help make changes, and assist with development tasks.

## 1. Requirements

For native Windows setup, install Git for Windows first:

https://git-scm.com/install/windows

## 2. Install Claude Code

Use Anthropic's official Windows PowerShell installer:

```powershell
irm https://claude.ai/install.ps1 | iex
```

Only use installation commands from Anthropic's official Claude Code documentation.

## 3. Restart PowerShell

Close the current PowerShell window and open a new one.

## 4. Verify

```powershell
claude --version
```

If a version is displayed, Claude Code is installed.

## 5. Start Claude Code

Go to your repository:

```powershell
cd path\to\project
```

Run:

```powershell
claude
```

Follow the authentication instructions shown in the terminal/browser.

## 6. Diagnose installation issues

Run:

```powershell
claude doctor
```

This can identify installation and configuration issues.

## 7. First use

After Claude Code starts, you can ask:

```text
Explain the structure of this repository and identify the main entry point.
```

Do not provide passwords, API keys, tokens, or other secrets unless your organization's policy explicitly permits it.

## Troubleshooting

### `claude` is not recognized

Close PowerShell and open a new terminal, then run:

```powershell
claude --version
```

If it still fails, check the official troubleshooting documentation.

### Authentication fails

Run:

```powershell
claude
```

and follow the browser login flow. For organization-managed accounts, follow your organization's authentication instructions.

## Official links

- Claude Code overview: https://code.claude.com/docs/en/overview
- Claude Code setup: https://code.claude.com/docs/en/setup
- Claude Code troubleshooting: https://support.claude.com/en/articles/14552646-troubleshoot-claude-code-installation-and-authentication
- Claude: https://claude.ai/
