---
sidebar_position: 4
---

# Emotes

![Emotes menu](menu.png)

## Adding emotes

### Easy loader

```
[Explorer panel]
└── Rorooms/
    └── EasyLoader/
        └── Config/
            └── Emotes/
                └── <-- Your items here

[Properties panel]
└── Attributes/
    └── <-- Your properties here
```

### Config

```lua
Rorooms:Configure({
  Systems = {
    Emotes = {
      Emotes = {
        MyEmote = {
          -- Properties here
        }
      }
    }
  }
})
```

### Properties

| Attribute             | Type        | Optional              |
| --------------------- | ----------- | --------------------- |
| `EmoteId`             | `string`    | ⚠️ - For manual config |
| `Animation`           | `Animation` | ⚠️ - For easy loader   |
| `Emoji`               | `string`    | ✅                     |
| `AllowMovement`       | `boolean`   | ✅                     |
| `DisplayName`         | `string`    | ✅                     |
| `LevelRequirement`    | `number`    | ✅                     |
| `GamepassRequirement` | `number`    | ✅                     |
| `Category`            | `string`    | ✅                     |
| `Color`               | `Color3`    | ✅                     |
| `LabelText`           | `string`    | ✅                     |
| `LabelIcon`           | `string`    | ✅                     |