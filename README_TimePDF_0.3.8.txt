# Time PDF Export Plugin (v0.3.8)

## Overview
The **Time PDF Export** plugin for Redmine exports the project **Spent time** view as a printable PDF.

It keeps the current query context (filters/grouping/columns), adds a project header with optional logo, and renders grouped totals for reporting.

## Features
- Export current "Spent time" view as PDF
- Optional logo in PDF header
- Group-aware rendering with per-group totals
- Decimal hours format (`7.50`)
- Landscape A4 layout optimized for tables
- Zebra rows and emphasized summary rows
- Opens in a new browser tab

## Compatibility
- Tested with **Redmine 6.0.x**
- Requires **Ruby 3.3+**
- Uses `prawn` and `prawn-table`

## Configuration
1. Go to **Administration → Plugins → Time PDF Export → Configure**.
2. Set `logo_path` (optional), for example:
   `/var/www/html/redmine/plugins/redmine_timepdf/files/logo.png`
3. Ensure the web server user can read the file.

### Permission
Enable **Export spent time PDF** in:
**Administration → Roles and permissions → Projects → Time PDF Export**

## Usage
1. Open **Project → Spent time**.
2. Apply filters/grouping/columns as needed.
3. Export via:
   - Actions menu → **Export PDF**
   - Bottom "Also available in" area → **PDF**
4. The PDF is rendered inline in a new browser tab.

## Behavior notes
- The export uses the active query whenever possible.
- If the query returns no rows, the plugin falls back to entries from the current month for the current project.

## Installation
Run on the Redmine host:

```bash
cd /var/www/html/redmine/plugins
unzip redmine_timepdf-0.3.8.zip
[ -d redmine_timepdf_038 ] && mv redmine_timepdf_038 redmine_timepdf
chown -R www-data:www-data redmine_timepdf

cd /var/www/html/redmine
su -s /bin/bash www-data -c "bundle install"
rm -rf tmp/cache/*
systemctl restart apache2
```

## Verify installation
In Redmine:
**Administration → Plugins**

Expected entry: **Time PDF Export (v0.3.8)**

## Uninstallation
```bash
cd /var/www/html/redmine/plugins
rm -rf redmine_timepdf

cd /var/www/html/redmine
rm -rf tmp/cache/*
systemctl restart apache2
```

## Author
KLu – with AI assistance
(c) 2025 – MIT License
