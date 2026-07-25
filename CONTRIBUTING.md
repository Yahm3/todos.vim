# Contributing to todos.vim

First off, thank you for considering contributing to todos.vim! It's
people like you that make todos.vim such a great tool.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Style Guide](#style-guide)
- [Community](#community)

## Code of Conduct

This project and everyone participating in it is governed by our
[Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are
expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid
duplicates. When you create a bug report, include as many details as
possible using our [bug report template](.github/ISSUE_TEMPLATE/bug_report.md).

**Great bug reports include:**
- A clear, descriptive title
- Steps to reproduce the behavior
- Expected behavior vs actual behavior
- Screenshots (if applicable)
- Environment details (OS version)

###  Suggesting Features

Feature requests are welcome! Please use our
[feature request template](.github/ISSUE_TEMPLATE/feature_request.md).

**Great feature requests include:**
- Clear problem statement: "I'm frustrated when..."
- Proposed solution
- Alternative solutions you've considered
- Additional context

### Improving Documentation

Documentation improvements are always welcome! This includes:
- Fixing typos
- Adding examples
- Clarifying confusing sections
- Translating documentation

###  Submitting Code

Look for issues labeled `good first issue` or `help wanted` for
great places to start.

## Development Setup

### Prerequisites

- Vim (so obvious)
- Git

### Getting Started

```bash
# 1. Fork the repository on GitHub

# 2. Clone your fork locally
git clone https://github.com/YOUR_USERNAME/todos.vim.git
cd  todos.vim

# 3. Add upstream remote
git remote add upstream https://github.com/Yahm3/todos.vim.git

# 4. Create a branch for your changes
git checkout -b feature/your-feature-name

```

## Pull Request Process

### Before Submitting

1. **Update your branch** with the latest upstream changes:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```
2. **Update documentation** if you've added features.

### Submitting

1. Push your branch to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

2. Open a Pull Request against the `main` branch.

3. Fill out the PR template completely.

4. Wait for review. We aim to respond within 7 days.

### PR Checklist

- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation

## Style Guide

### Commit Messages

We follow [Conventional Commits](https://conventionalcommits.org/):

```
():

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `chore`: Maintenance tasks

**Examples:**
```
feat: added something cool :)
fix: handle null response from payment provider
docs: updated README installation instructions
```

### Code Style

- `set shiftwidth=2` (for all the Vimers out there looking to contribute)
- Write self-documenting code with meaningful variable names

## Recognition

Contributors are added to our [CONTRIBUTORS.md](CONTRIBUTORS.md) file.

---

Thank you for contributing!

This CONTRIBUTING.md file was stolen and modified from: https://rivereditor.com/blogs/write-contribution-guide-open-source-project
