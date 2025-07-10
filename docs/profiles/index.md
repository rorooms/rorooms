---
sidebar_position: 2
---

# Profiles

A full profiles system supporting nicknames, bios, roles, and leveling! Edit your own profile, or click on players in-game to view theirs.

![Profile menu](menu.png)

## Adding roles

### Easy loader

Roles are added as `Configuration` instances within the Roles folder:

```
[Explorer panel]
└── Rorooms/
    └── EasyLoader/
        └── Config/
            └── Roles/
                └── <-- Your roles here

[Properties panel]
└── Attributes/
    └── <-- Your properties here
```

### Manual config

```lua
Rorooms:Configure({
  Systems = {
    Profiles = {
      Roles = {
        MyRole = {
          -- Properties here
        }
      }
    }
  }
})
```

### Properties

| Attribute             | Type     | Required                |
| --------------------- | -------- | ----------------------- |
| `RoleId`              | `string` | ⚠️ - Only w/ easy loader |
| `Name`                | `string` | ❌                       |
| `Color`               | `Color3` | ❌                       |
| `LayoutOrder`         | `number` | ❌                       |
| `LevelRequirement`    | `number` | ❌                       |
| `GamepassRequirement` | `number` | ❌                       |
