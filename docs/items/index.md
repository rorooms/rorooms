---
sidebar_position: 3
---

# Items

![Items menu](menu.png)

## Adding items

### Easy loader

```
[Explorer panel]
└── Rorooms/
    └── EasyLoader/
        └── Config/
            └── Items/
                └── <-- Your items here

[Properties panel]
└── Attributes/
    └── <-- Your properties here
```

### Config

```lua
Rorooms:Configure({
  Systems = {
    Items = {
      MyItem = {
        -- Properties here
      }
    }
  }
})
```

### Properties

| Property              | Type     | Optional              |
| --------------------- | -------- | --------------------- |
| `ItemId`              | `string` | ⚠️ - For manual config |
| `Tool`                | `Tool`   | ⚠️ - For easy loader   |
| `DisplayName`         | `string` | ✅                     |
| `LevelRequirement`    | `number` | ✅                     |
| `GamepassRequirement` | `number` | ✅                     |
| `Category`            | `string` | ✅                     |
| `Color`               | `Color3` | ✅                     |
| `LabelText`           | `string` | ✅                     |
| `LabelIcon`           | `string` | ✅                     |