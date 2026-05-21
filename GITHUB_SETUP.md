# Fix GitHub Link — Publish Your Site

The link `https://github.com/josephaikins810-eng/data-communication` returns **404** until you **create the repository** and **push your code**.

## Step 1 — Create the repository on GitHub

1. Sign in at [https://github.com](https://github.com)
2. Open: [Create new repository](https://github.com/new?name=data-communication)
3. Set **Repository name:** `data-communication`
4. Leave it **Public**
5. Do **not** add README, .gitignore, or license (you already have files locally)
6. Click **Create repository**

If your GitHub username is **not** `josephaikins810-eng`, use your real username in all links below.

## Step 2 — Install Git (if needed)

Download: [https://git-scm.com/download/win](https://git-scm.com/download/win)

Close and reopen Cursor/terminal after installing.

## Step 3 — Push your project

Open **PowerShell** or **Git Bash** in your project folder:

```powershell
cd "c:\Users\AB\Desktop\data-communication"

git init
git add .
git commit -m "Data Communication assignment website"
git branch -M main
git remote add origin https://github.com/josephaikins810-eng/data-communication.git
git push -u origin main
```

When asked to sign in, use GitHub login or a [Personal Access Token](https://github.com/settings/tokens).

## Step 4 — Enable GitHub Pages (view site online)

1. On GitHub, open your repo → **Settings** → **Pages**
2. **Source:** Deploy from branch `main`, folder `/ (root)`
3. Save

Your site will be at:

**https://josephaikins810-eng.github.io/data-communication/**

(Replace `josephaikins810-eng` with your username if different.)

## Step 5 — Test links

- Repo: `https://github.com/josephaikins810-eng/data-communication`
- Home: `https://josephaikins810-eng.github.io/data-communication/index.html`
- Video: `https://josephaikins810-eng.github.io/data-communication/resources.html#video`

## Wrong username?

If links still fail, tell your instructor the correct URL after you create the repo under your account, and update all `github.com/...` links in the HTML files to match.
