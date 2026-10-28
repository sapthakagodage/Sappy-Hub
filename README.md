# Sappy Hub

My personal records app. One launcher, many apps.

```
Sappy Hub  (main page)
├── Sappy Pocket   → money & expenses   (pocket/)
├── Sappy Travel   → coming soon        (travel/)
└── Sappy Fitness  → coming soon        (fitness/)
```

Free to run: **GitHub Pages** (the apps) + **Supabase** (records) + **iPhone Shortcuts** (bank SMS).

---

## Files

```
index.html          ← Sappy Hub (launcher)
manifest.json       ← Home Screen app info
icon-180.png, icon-512.png
supabase-setup.sql
CHANGELOG.md, README.md
pocket/index.html   ← Sappy Pocket
version.json        ← latest version numbers (the apps check this to update themselves)
```

---

## Part 1 — Upload to GitHub

1. Open your repo on **github.com** on a computer.
2. **Add file** → **Upload files**.
3. Unzip `sappy-hub-v4.0.0.zip`. Open the `sappy-hub` folder and drag **everything inside it** onto the page,
   including the `pocket` folder.
4. Commit message: `v4.0.0 – Sappy Hub` → **Commit changes**.
5. Wait 1–2 minutes. Open your link. You'll see Sappy Hub.

Your old link now opens the Hub. Tap **Sappy Pocket** to get to your expenses.

**Optional — rename the repo to `sappy-hub`:** repo → **Settings** → Repository name.
Your link becomes `https://YOUR-NAME.github.io/sappy-hub/`. Your data stays (same phone, same cloud).
Then delete the old Home Screen icon and add the new link to your Home Screen again.

**Home Screen icon:** open the link in Safari → Share → **Add to Home Screen**. The icon is a green "S".

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
   - Copy the **Publishable key** (starts with `sb_publishable_`) or the legacy **anon** key (starts with `eyJ`). Either works.
   - Never use the **secret** / **service_role** key.
7. Open Sappy Pocket on your phone → **Settings** → **Cloud sync** → **Connect Supabase**.
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
     - Key `apikey` → Value: your key
     - Only if your key starts with `eyJ`: also add Key `Authorization` → Value: `Bearer ` + your key (one space after Bearer)
   - **Request Body**: `JSON`
     - Add new field → **Text** → Key: `raw` → Value: tap it → choose **Shortcut Input**
9. Tap **Done**.

**For AUD SMS too:** make a second automation the same way, but with Message Contains `AUD`.

**Test it:** make a small card payment. Then open the app. You'll see "Added 1 new from your iPhone".

Nothing pops up when an SMS arrives. It goes quietly to the cloud inbox and appears when you open the app.

---

## Adding a new app later (Travel, Fitness, anything)

1. Ask Claude to build it. You'll get a folder, for example `travel/index.html`.
2. Upload the folder to GitHub (same way as Part 1).
3. In the Hub's `index.html`, find the **APP LIST** near the bottom and change that app's `ready:false` to `ready:true`.
   For a brand new app, add one line to the list.

That's it. The Hub shows it automatically.

---

## Updating (new versions)

Your data is never touched by updates. It lives in Supabase, not in the app files.

1. Ask Claude for the change. You get updated files, **always including `version.json`**.
2. GitHub → **Add file** → **Upload files** → drag them in (keep folder names the same).
3. Commit message with the version, e.g. `Pocket v4.1.0`.
4. Wait 1–2 minutes, then open the app. It sees the new number in `version.json` and updates itself.
   Or: Sappy Pocket → Settings → **Check for updates**.

Every version is saved under **Commits**, so you can always go back.

---

## Keep it safe

- Monthly: Sappy Pocket → Settings → **Download backup**. Save to iCloud Drive.
- Never put your Supabase key in GitHub files.
- Supabase free projects pause after 7 days with no activity. Daily SMS keeps it awake.
  If it pauses: log in to supabase.com → **Restore project**.
