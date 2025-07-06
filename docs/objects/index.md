---
sidebar_position: 6
---

# Objects

Apply these tags onto in-game objects to easily add functionality within your world. Tags can be applied from within the properties panel.

## Animated seats 🪑

Seats that support custom sitting animations, and prompt-to-sit functionality.

| Data        | Value             |
| ----------- | ----------------- |
| `Tag`       | `RR_AnimatedSeat` |
| `ClassName` | `Seat`            |

| Attribute        | Type      | Optional |
| ---------------- | --------- | -------- |
| `RR_PromptToSit` | `boolean` | ✅        |

### Children

- "Animation" - `Animation`

## Item givers 🫴

Prompt parts that give out items.

| Data        | Value          |
| ----------- | -------------- |
| `Tag`       | `RR_ItemGiver` |
| `ClassName` | `BasePart`     |

| Attribute   | Type     | Optional |
| ----------- | -------- | -------- |
| `RR_ItemId` | `string` | ❌        |

### Children

Variant models must be arranged in numerical order.

- "1" - `Model`
- "2" - `Model`
- "..." - `Model`

## Locked zones 🔒

Locked zones are parts that prevent players from being within them based on certain criteria.

| Data        | Value           |
| ----------- | --------------- |
| `Tag`       | `RR_LockedZone` |
| `ClassName` | `BasePart`      |

| Attribute             | Type     | Optional |
| --------------------- | -------- | -------- |
| `LevelRequirement`    | `number` | ✅        |
| `GamepassRequirement` | `number` | ✅        |

## Locked doors 🔒

Locked doors are parts that prevent players from walking through them based on certain criteria.

| Data        | Value           |
| ----------- | --------------- |
| `Tag`       | `RR_LockedDoor` |
| `ClassName` | `BasePart`      |

| Attribute             | Type     | Optional |
| --------------------- | -------- | -------- |
| `LevelRequirement`    | `number` | ✅        |
| `GamepassRequirement` | `number` | ✅        |

## World teleporters 🌐

Parts that prompt teleports to other RoRooms worlds.

| Data        | Value                |
| ----------- | -------------------- |
| `Tag`       | `RR_WorldTeleporter` |
| `ClassName` | `BasePart`           |

| Attribute    | Type     | Optional |
| ------------ | -------- | -------- |
| `RR_PlaceId` | `number` | ❌        |

## Animated items 🔧

Tools that support click-to-cycle animations.

| Data        | Value             |
| ----------- | ----------------- |
| `Tag`       | `RR_AnimatedItem` |
| `ClassName` | `Tool`            |

### Children

Animations must be arranged in numerical order.

- "RR_ItemAnimations" - `Folder`
- - "1" - `Animation`
- - "2" - `Animation`
- - "..." - `Animation`

## Variant cyclers 🔁

Prompt parts that cycle between various models.

| Data        | Value              |
| ----------- | ------------------ |
| `Tag`       | `RR_VariantCycler` |
| `ClassName` | `BasePart`         |