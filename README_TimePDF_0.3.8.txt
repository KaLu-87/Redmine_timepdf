# Time PDF Export Plugin (v0.3.8)

## Overview
This plugin exports Redmine's **Spent time** view to a PDF and keeps filters/grouping from the current query.

## Important installation note (fix for PluginNotFound)
Redmine identifies plugins by folder name and plugin identifier.

- Canonical plugin identifier: `redmine_timepdf`
- Recommended folder: `/var/www/html/redmine/plugins/redmine_timepdf`

To avoid startup issues, use the canonical folder name whenever possible:

```bash
cd /var/www/html/redmine/plugins
[ -d Redmine_timepdf ] && mv Redmine_timepdf redmine_timepdf
```

This plugin now also supports non-canonical folder casing by registering with the actual folder identifier at runtime, but canonical naming is still recommended.

## Installation
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

## Permission
Enable **Export spent time PDF** in:

Administration → Roles and permissions → Projects → Time PDF Export

## Usage
Project → Spent time → Export PDF

## Troubleshooting
If Redmine shows:
`Plugin not found. The directory for plugin redmine_timepdf should be ...`

check folder name and restart:

```bash
cd /var/www/html/redmine/plugins
mv Redmine_timepdf redmine_timepdf
cd /var/www/html/redmine
rm -rf tmp/cache/*
systemctl restart apache2
```
