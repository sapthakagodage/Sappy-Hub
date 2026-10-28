# Changelog

## Sappy Hub v1.0.1 / Sappy Pocket v4.0.1 — 2026-10-28
- Auto-update: apps check version.json on every launch and reload themselves when there's a new version
- Settings → "Check for updates" button

## Sappy Hub v1.0.0 / Sappy Pocket v4.0.0 — 2026-10-28
- New Sappy Hub launcher: Sappy Pocket, Sappy Travel (soon), Sappy Fitness (soon)
- Pocket Ledger is now Sappy Pocket, inside the pocket/ folder
- Hub shows this month's spending and balance on the Pocket card
- Home: "Balance now" from the latest SMS of each account
- Fixed: drawers (＋, edit) scroll properly on iPhone, page behind no longer moves
- Fixed: text boxes and dropdowns line up properly on iPhone
- Tab bar hides while typing so the keyboard doesn't cover things
- Grid button (top left) goes back to the Hub

## v3.2.0 — 2026-10-27
- Exact amounts everywhere (no more 49K / 599K)
- Home is now simple: Spent card + Where it went
- Activity: 6-month chart on top, then the payment list
- Simpler filters (All, Spending, Income, Fixed deposit), nothing repeated
- Accounts stay in the Savings tab

## v3.1.0 — 2026-10-27
- New colourful, modern look (dark with lime green, inspired by your reference)
- Lime summary card: spent this month, came in, to FD, left
- Accounts shown as swipeable bank cards
- Spending as colourful category bars plus a donut chart
- Purple 6-month chart card
- Bright category icons everywhere
- Floating dark tab bar with lime ＋ button
- Light mode still available in Settings → Look

## v3.0.0 — 2026-10-27
- New look: clean line icons for every category, smoother cards, sync status dot
- Smarter auto-categories with Sri Lankan shops built in
- New categories: Fuel, Fitness, Education (Transport is now rides, parking, tolls)
- Matching uses only the shop name, so bank warnings in the SMS never confuse it
- Overview: insights (vs last month, daily average, biggest spend) and a 6-month chart
- Tap any category to see its payments and its usual monthly amount
- Category choices you make are saved to the cloud and work on every device
- Removed "Try a sample" so test data can never mix with real records

## v2.4.0 — 2026-10-27
- Reads ComBank card alerts ("Dear Cardholder, Purchase at …"), including USD and AM/PM time
- New Subscriptions category (Apple, Meta, Netflix, Google, Spotify…)
- Clean names: APPLE.COM/BILL SINGAPORE SG → Apple, FACEBK *… → Meta (Facebook)
- Overview shows the month clearly: Came in, Spent, Moved to fixed deposit, Left this month
- Savings shows each account and fixed deposits separately, with a clear total

## v2.3.0 — 2026-10-27
- Fixed deposits come only from SMS ("Tran for funding A/c" = fixed deposit, its own category)
- Removed manual "Add fixed deposit"
- Removed iPhone SMS capture steps and exchange rate settings (rates update silently once a day)
- Removed "Delete all data on this device"

## v2.2.0 — 2026-10-27
- Reads HNB card alerts (Location, Amount(Approx.), Time fields)
- Salary shows as "Salary"; own-account funding shows as "Transfer to ••xx" (not spending)
- Bills show clean names (CEB Electricity, Mobitel, Dialog…)
- AUD credits read with company name cleaned up
- Both HNB formats match the same account
- Marking a transfer as Fixed deposit adds it to Savings
- Pasted chat text like "[date] Name:" is cleaned automatically

## v2.1.0 — 2026-10-27
- Much better SMS reading, tested on HNB format
- No longer skips real transactions that mention "OTP" in the safety warning
- Reads the shop or biller from "Reason:" (e.g. Mobitel bill)
- Finds the bank from its hotline number when the SMS has no bank name
- Reads the exact time, and the account last digits
- Messages it can't read are kept, and re-read automatically after updates
- Old SMS entries are re-read with the new reader (your own edits are kept)
- Edit an entry's name and bank; the bank is remembered for that account

## v2.0.1 — 2026-10-27
- Cloud sync connects more easily: accepts the new publishable key, fixes pasted URLs, shows clear error messages
- SQL file adds access grants for newer Supabase projects

## v2.0.0 — 2026-10-27
- New clean app design with light and dark mode
- Spending pie chart by category (tap a category to focus it)
- Bank balances read from SMS, plus total
- AUD and USD support with live exchange rates
- Fixed deposits section with interest and maturity
- Net worth (banks + deposits)
- Cloud sync with Supabase (free), silent iPhone SMS capture
- Backup download and restore
- Search and filters in Activity

## v1.0.0
- First version on claude.ai
