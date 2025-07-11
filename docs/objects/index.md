---
sidebar_position: 6
---

# Objects

Apply these tags onto in-game objects to add no-code functionality throughout your world. Tags and attributes can be applied from within the properties panel.

## Animated seats 🪑

Seats enhanced with animation and prompting, placed in-world as `Seat` instances with the `RR_AnimatedSeat` tag.

| Attribute        | Type      | Required |
| ---------------- | --------- | -------- |
| `RR_PromptToSit` | `boolean` | ❌        |

### Children

- "Animation" - `Animation`

## Item givers 🫴

Prompters that give out items, placed in-world as `BasePart` instances with the `RR_ItemGiver` tag.

| Attribute   | Type     | Required |
| ----------- | -------- | -------- |
| `RR_ItemId` | `string` | ✅        |

## Locked zones 🔒

Parts that conditionally respawn players within their bounds, placed in-world as `BasePart` instances with the `RR_LockedZone` tag.

| Attribute                | Type     | Required |
| ------------------------ | -------- | -------- |
| `RR_LevelRequirement`    | `number` | ❌        |
| `RR_GamepassRequirement` | `number` | ❌        |

## Locked doors 🔒

Parts that conditionally prevent players from walking through them, placed in-world as `BasePart` instances with the `RR_LockedDoor` tag.

| Attribute                | Type     | Required |
| ------------------------ | -------- | -------- |
| `RR_LevelRequirement`    | `number` | ❌        |
| `RR_GamepassRequirement` | `number` | ❌        |

## World teleporters 🌐

 Prompters that teleport the player to other Rorooms worlds, placed in-world as `BasePart` instances with the `RR_WorldTeleporter` tag.

| Attribute    | Type     | Required |
| ------------ | -------- | -------- |
| `RR_PlaceId` | `number` | ✅        |

## Animated items 🔧

Items that play animations, placed in-world as `Tool` instances with the `RR_AnimatedItem` tag.

### Children

Animations must be arranged in numerical order.

- "RR_ItemAnimations" - `Folder`
- - "1" - `Animation`
- - "2" - `Animation`
- - "..." - `Animation`

## Variant cyclers 🔁

Prompters that cycle between various models, placed in-world as `BasePart` instances with the `RR_VariantCycler` tag.

### Children

Variant models must be arranged in numerical order.

- "1" - `Model`
- "2" - `Model`
- "..." - `Model`