# Pocket Ledger

Personal expense tracker that reads bank SMS (ComBank, Sampath, HNB) automatically.
Free to run: **GitHub Pages** (the app) + **Supabase** (your records) + **iPhone Shortcuts** (SMS capture).

```
Bank SMS ──► iPhone Shortcut ──► Supabase (cloud inbox) ──► Pocket Ledger app
```

Total setup time: about 25 minutes, once.

---

## Part 1 — Put the app on GitHub (10 min)

1. Go to **github.com** → **+** (top right) → **New repository**.
2. Name: `pocket-ledger`. Choose **Public** (free GitHub Pages needs public).
   Your money data is NOT in the repo. Only the app code is.
3. Click **Create repository**.
4. Click **uploading an existing file**. Drag in all files from this folder:
   `index.html`, `manifest.json`, `icon-180.png`, `icon-512.png`, `CHANGELOG.md`, `README.md`, `supabase-setup.sql`
5. Commit message: `v2.0.0` → **Commit changes**.
6. Go to **Settings** → **Pages** (left menu).
7. Source: **Deploy from a branch**. Branch: **main**, folder **/ (root)** → **Save**.
8. Wait 1–2 minutes. Your app link is:
   `https://YOUR-GITHUB-NAME.github.io/pocket-ledger/`
9. Open it on your iPhone in **Safari** → Share → **Add to Home Screen**.
   Now it opens like a real app.

---

## Part 2 — Set up the free cloud database (10 min)

This keeps every record safe forever, on any device.

1. Go to **supabase.com** → **Start your project** → sign in with GitHub.
2. **New project**
   - Name: `pocket-ledger`
   - Region: **Singapore** (closest to Sri Lanka)
   - Set a database password and save it somewhere.
3. Wait about 2 minutes for it to finish.
4. Left menu → **SQL Editor** → **New query**.
5. Open `supabase-setup.sql`, copy everything, paste it in, click **Run**.
   You should see "Success".
6. Left menu → **Project Settings** → **API Keys**.
   - Copy the **Project URL** (looks like `https://abcd1234.supabase.co`).
     If it's not on that page, it's under **Project Settings → Data API**.
   - Copy the **anon** key that starts with `eyJ…`.
     If you see "Publishable key" first, open the **Legacy API keys** tab and copy **anon** from there.
7. Open Pocket Ledger on your phone → **Settings** → **Cloud sync** → **Connect Supabase**.
   Paste the URL and key → **Connect**. Status should turn **On**.

> Keep the key private. Never put it in a GitHub file. It only goes in the app settings and the Shortcut.

---

## Part 3 — iPhone Shortcut for automatic SMS (5 min)

1. Open the **Shortcuts** app → **Automation** tab → **+** (or **New Automation**).
2. Choose **Message**.
3. Tap **Message Contains** → type `LKR` → Done.
4. Choose **Run Immediately**. Turn **off** "Notify When Run". Tap **Next**.
5. Tap **New Blank Automation**.
6. **Add Action** → search **Get Contents of URL** → add it.
7. Tap the URL and type:
   `https://YOUR-PROJECT.supabase.co/rest/v1/inbox`
8. Tap the **›** arrow on the action to expand it:
   - **Method**: `POST`
   - **Headers** → Add new header:
     - Key `apikey` → Value: your anon key
     - Key `Authorization` → Value: `Bearer ` + your anon key (one space after Bearer)
   - **Request Body**: `JSON`
     - Add new field → **Text** → Key: `raw` → Value: tap it → choose **Shortcut Input**
9. Tap **Done**.

**For AUD SMS too:** make a second automation the same way, but with Message Contains `AUD`.

**Test it:** make a small card payment. Then open the app. You'll see "Added 1 new from your iPhone".

Nothing pops up when an SMS arrives. It goes quietly to the cloud inbox and appears when you open the app.

---

## How to use

- **Overview**: pie chart of spending. Tap a category to highlight it. Bank balances from the latest SMS.
- **Activity**: every entry. Search and filter. Tap any entry to change category or add a note.
  Tick "Always use this for…" and that shop is sorted the same way next time.
- **＋ button**: add things with no SMS — AUD salary, cash, fixed deposits.
- **Savings**: fixed deposits with interest and maturity date, plus your net worth.
- **Settings**: cloud sync, exchange rates, backup, light/dark.

Transfers and fixed deposits are not counted as spending.

---

## Part 4 — Updating the app (new versions)

Your data is never touched by updates. It lives in Supabase.

1. Tell Claude what you want changed. You'll get a new `index.html` (and a `CHANGELOG.md` line).
2. Go to your repo on GitHub → **Add file** → **Upload files**.
3. Drag in the new `index.html` (and `CHANGELOG.md`). It replaces the old ones.
4. Commit message: the new version, e.g. `v2.1.0 – budget alerts` → **Commit changes**.
5. Wait 1–2 minutes. Open the app → pull down to refresh.
   If you still see the old one, close the app fully and open it again.
6. Check **Settings** → bottom of the page shows the version number.

**Version history:** every upload is saved under **Commits** in your repo.
**Go back to an old version:** open that commit → open `index.html` → **Download raw file** → upload it again.
**Optional:** on the repo page, **Releases** → **Create a new release** → tag `v2.0.0`. Gives a clean list of versions.

---

## Keep it rock solid

- **Monthly backup:** Settings → **Download backup**. Save it to iCloud Drive.
- **Supabase free tier** pauses if unused for 7 days. Your daily SMS keeps it awake.
  If it ever pauses: log in to supabase.com and click **Restore project**.
- **New phone?** Open the app link → Settings → connect Supabase again. Everything comes back.
- **An SMS read wrong?** Tap it, fix the category, and send Claude the SMS text (hide account numbers) to improve the reader.

## Free limits (more than enough)

| Service | Free limit | Your use |
|---|---|---|
| GitHub Pages | 1 GB site, 100 GB/month | ~50 KB |
| Supabase | 500 MB database | ~5 MB per 10 years of SMS |
