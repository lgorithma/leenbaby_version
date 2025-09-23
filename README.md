# LeenBaby Version Configuration

This repository contains the version configuration file for the LeenBaby mobile app.

## Files

- `version.json` - Contains current app version information and update settings

## Version Configuration

The `version.json` file controls:

- **current_version**: Latest app version available
- **minimum_version**: Minimum required version (for force updates)
- **update_url_ios**: App Store URL for iOS updates
- **update_url_android**: Play Store URL for Android updates
- **update_message**: English update message
- **update_message_ar**: Arabic update message
- **force_update**: Whether to force users to update

## Usage

1. Update `version.json` when releasing a new app version
2. Commit and push changes
3. App will automatically check for updates and notify users

## Example Update Process

When releasing version 3.2.1:

```json
{
  "current_version": "3.2.1",
  "minimum_version": "3.0.0",
  "update_message": "Bug fixes and performance improvements",
  "update_message_ar": "إصلاحات الأخطاء وتحسينات الأداء",
  "force_update": false
}
```

## Force Update

To require all users to update immediately:

```json
{
  "force_update": true
}
```

Or set a higher minimum version:

```json
{
  "minimum_version": "3.2.0"
}
```