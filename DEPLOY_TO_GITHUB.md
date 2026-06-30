# GitHub Deployment Guide

This guide explains how to deploy the PDF Translator project to GitHub for public use.

## 📋 Pre-Deployment Checklist

- ✅ Project files are organized
- ✅ README.md with complete documentation
- ✅ requirements.txt with all dependencies
- ✅ CONTRIBUTING.md for contributors
- ✅ LICENSE file (MIT)
- ✅ GETTING_STARTED.md for new users
- ✅ CHANGELOG.md tracking releases
- ✅ .gitignore properly configured
- ✅ GitHub Actions workflow for CI/CD

## 🚀 Deployment Steps

### Step 1: Verify Git Configuration

```bash
cd /home/few/Projects/translate-pdf
git config --list | grep user
```

If not configured, set your Git identity:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 2: Verify Remote is Set

```bash
git remote -v
# Should show:
# origin  https://github.com/kanomoo/translate-pdf.git (fetch)
# origin  https://github.com/kanomoo/translate-pdf.git (push)
```

### Step 3: Check Status

```bash
git status
# Should show "On branch main" and "nothing to commit"
```

### Step 4: View Commits

```bash
git log --oneline -3
```

### Step 5: Push to GitHub

```bash
git push origin main
```

## 📦 GitHub Repository Configuration

### Repository Settings to Configure

1. **Repository Settings** (https://github.com/kanomoo/translate-pdf/settings)
   - Description: "Translate English PDFs to Thai with AI-powered translation and beautiful UI"
   - Website: (optional) Your project website if available
   - Topics: `pdf`, `translator`, `thai-language`, `flask`, `python`
   - Visibility: **Public** (to share with others)

2. **Branches** (https://github.com/kanomoo/translate-pdf/settings/branches)
   - Default branch: `main`
   - Add protection rules (optional):
     - Require pull request reviews before merging
     - Require status checks to pass before merging
     - Require branches to be up to date before merging

3. **Actions** (https://github.com/kanomoo/translate-pdf/settings/actions)
   - Enable Actions to run CI/CD tests
   - Verify workflow file exists: `.github/workflows/tests.yml`

### Repository Features to Enable

1. **Issues**
   - Enable for bug reports and feature requests
   - Create issue templates (optional):
     - Bug report template
     - Feature request template

2. **Discussions** (Optional)
   - Enable for community conversations
   - Good for Q&A and announcements

3. **Projects** (Optional)
   - Create a project board to track development

## 📝 GitHub Pages (Optional Documentation Site)

To create a documentation site:

1. Go to Repository Settings → Pages
2. Select "main" branch and "/docs" folder
3. Create `docs/` folder in your repository
4. Add markdown files for documentation

## 🔖 Creating Releases

1. Go to Releases tab
2. Click "Create a new release"
3. Set version tag (e.g., `v1.0.0`)
4. Add release notes
5. Publish release

```bash
# Create and push a version tag from command line:
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

## 🎯 Next Steps for Users

Once deployed, users can:

1. **Find your project**: Search for "translate-pdf" on GitHub
2. **Clone**: `git clone https://github.com/kanomoo/translate-pdf.git`
3. **Follow GETTING_STARTED.md** to set up locally
4. **Read README.md** for complete documentation
5. **Contribute**: Follow CONTRIBUTING.md guidelines

## 📊 GitHub Stats You'll Track

- ⭐ Stars — Interest level
- 🍴 Forks — Community contributions
- 👁️ Watchers — Active followers
- 🐛 Issues — Bugs and features
- 🔀 Pull Requests — Community contributions

## 🔒 Security Best Practices

1. **Never commit secrets**:
   - API keys
   - Passwords
   - Database credentials
   - Personal tokens

2. **Use environment variables**:
   ```python
   import os
   API_KEY = os.getenv('GOOGLE_API_KEY')
   ```

3. **Enable branch protection**
   - Require reviews before merge
   - Require status checks
   - Dismiss stale reviews

4. **Keep dependencies updated**:
   ```bash
   pip list --outdated
   pip install --upgrade <package>
   ```

## 📢 Sharing Your Project

After deployment, share with:

- **Social Media**: Tweet, LinkedIn, Reddit
- **Dev Communities**: DEV.to, Hacker News, Product Hunt
- **Forums**: GitHub Discussions, Stack Overflow
- **Documentation**: Include in tech blogs, tutorials
- **Collaborators**: Send to colleagues and team members

## 📞 Support Resources

If users need help:

1. **README.md** — General overview and setup
2. **GETTING_STARTED.md** — Quick start guide
3. **CONTRIBUTING.md** — Development guide
4. **Issues** — Report bugs or request features
5. **Discussions** — Ask questions

## 🚨 Troubleshooting Deployment Issues

### Issue: Permission denied when pushing

```bash
# Check SSH key (if using SSH)
ssh -T git@github.com

# Or use HTTPS with personal access token
git remote set-url origin https://TOKEN@github.com/kanomoo/translate-pdf.git
```

### Issue: Branch diverged

```bash
git pull --rebase origin main
git push origin main
```

### Issue: Forgot to add files before committing

```bash
git add .
git commit --amend --no-edit
git push origin main --force-with-lease
```

## 📚 Additional Resources

- [GitHub Documentation](https://docs.github.com/)
- [GitHub Markdown Guide](https://guides.github.com/features/mastering-markdown/)
- [GitHub Actions](https://github.com/features/actions)
- [GitHub Pages](https://pages.github.com/)
- [GitHub Community Guidelines](https://docs.github.com/en/site-policy/github-terms/github-community-guidelines)

---

**Your project is now ready for public release! 🎉**
