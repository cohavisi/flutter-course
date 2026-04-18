# App Theme System

Central theming for the Flutter Course app. All theme config lives in `lib/shared/utils/app_theme.dart`.

---

## Setup

### 1. Bundled font

Rubik is bundled as local TTF files under `fonts/`. No external package is required.

```
fonts/
├── Rubik-Regular.ttf       (400)
├── Rubik-Italic.ttf        (400 italic)
├── Rubik-Medium.ttf        (500)
├── Rubik-MediumItalic.ttf  (500 italic)
├── Rubik-Bold.ttf          (700)
└── Rubik-BoldItalic.ttf    (700 italic)
```

Declared in `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: Rubik
      fonts:
        - asset: fonts/Rubik-Regular.ttf
          weight: 400
        - asset: fonts/Rubik-Italic.ttf
          weight: 400
          style: italic
        - asset: fonts/Rubik-Medium.ttf
          weight: 500
        - asset: fonts/Rubik-MediumItalic.ttf
          weight: 500
          style: italic
        - asset: fonts/Rubik-Bold.ttf
          weight: 700
        - asset: fonts/Rubik-BoldItalic.ttf
          weight: 700
          style: italic
```

### 2. Wire into MaterialApp

```dart
MaterialApp(
  theme: AppTheme.theme(Brightness.light),
  darkTheme: AppTheme.theme(Brightness.dark),
  themeMode: ThemeMode.system, // follows device setting
)
```

---

## AppTheme

`AppTheme.theme(Brightness brightness)` returns a fully configured `ThemeData`.

| Property | Value |
|---|---|
| Material version | Material 3 |
| Font | Rubik (bundled TTF, `fontFamily: 'Rubik'`) |
| Shadows | Disabled everywhere (transparent shadow color, elevation 0) |
| Color seed | `#8032DA` (purple) |

---

## AppColors

Custom brand colors exposed as a `ThemeExtension`. Access them anywhere you have a `BuildContext`:

```dart
context.appColors.primary   // Color(0xFF8032DA) — purple
context.appColors.success   // Color(0xFF23E01D) — green
context.appColors.error     // Color(0xFFE02C11) — red
context.appColors.warning   // Color(0xFFDAB632) — amber
```

### Color reference

| Token | Hex | Usage |
|---|---|---|
| `primary` | `#8032DA` | Brand / interactive elements |
| `success` | `#23E01D` | Positive feedback, confirmations |
| `error` | `#E02C11` | Errors, destructive actions |
| `warning` | `#DAB632` | Warnings, caution states |

Both light and dark themes share the same brand color values. The Material 3 tonal system generates appropriate surface and container tones automatically.

---

## AppRadii

Border radius design tokens exposed as a `ThemeExtension`:

```dart
context.appRadii.xs    // 4px
context.appRadii.sm    // 8px  ← default for ElevatedButton
context.appRadii.md    // 12px
context.appRadii.lg    // 16px
context.appRadii.xl    // 24px
context.appRadii.full  // 999px (pill / circle)
```

### Usage example

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: context.appRadii.md,
    color: context.appColors.primary,
  ),
)
```

---

## ElevatedButton

Styled globally with `sm` radius (8px) and no elevation. No per-widget setup needed.

```dart
ElevatedButton(
  onPressed: () {},
  child: const Text('Confirm'),
)
```

---

## No Shadows

Shadows are disabled globally. Differentiate containers by color and tonal surface alone. The following are all zeroed out:

- `ThemeData.shadowColor`
- `AppBarTheme` — `elevation: 0`, `scrolledUnderElevation: 0`
- `CardThemeData` — `elevation: 0`
- `DialogThemeData` — `elevation: 0`
- `BottomSheetThemeData` — `elevation: 0`
- `ElevatedButtonThemeData` — `elevation: 0`

---

## File reference

| File | Purpose |
|---|---|
| [`lib/shared/utils/app_theme.dart`](../lib/shared/utils/app_theme.dart) | All theme definitions |
| [`lib/main.dart`](../lib/main.dart) | Theme wired into `MaterialApp` |
| [`pubspec.yaml`](../pubspec.yaml) | Font asset declarations |
| [`fonts/`](../fonts/) | Bundled Rubik TTF files |
