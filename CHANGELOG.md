# Changelog

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
