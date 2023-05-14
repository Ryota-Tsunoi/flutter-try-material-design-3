# try_material_design_3

This project was created for the purpose of testing MaterialDesign3 enabled in Flutter 3.10 or later.
It will also implement simple features that may be essential to the Flutter project. (eg:state management, Routing, directory design, etc.)

## Target platforms

- This project supported to below platforms.
  - android
  - ios
  - web
  - windows
  - macos
  - linux

## Directory structure

- We plan to expand it in the future, but for now it consists of the following

```txt
./lib
├── components # Components used for global
│   ├── <Component_name>
│   │   └── <component.dart>
├── features # Separate folders by function
│   └── <feature_name>
│       ├── components # Components used for that function alone
│       │   ├── <Component_name>
│       │   │   └── <component.dart>
│       ├── models # Models used for that function alone
│       │   ├── <model.dart>
│       ├── pages
│       │   └── todo_page.dart
│       └── providers # notifier, provider, etc...
│           └── todo_provider.dart
└── main.dart
```

## Setup

- install fvm

```shell
  dart pub global activate fvm
  # or
  # brew tap leoafarias/fvm
  # brew install fvm
```

- if you needs to add path, please add this.

```shell
  ## add to your enviroment variables.
  export PATH="$PATH:$HOME/.pub-cache/bin"
```

- install [volta](https://volta.sh/)

```shell
curl https://get.volta.sh | bash
```

- install yarm

```shell
volta install yarn
```

- package insall for husky

```shell
yarn install
```

- flutter package install

```shell
fvm flutter pub get
```

## Commands

### Run

```shell
fvm flutter run -d <"target_device">
```

### Build

```shell
fvm flutter build <"target_platform">
```

### Test

```shell
fvm flutter test lib
```

### Format

```shell
fvm dart format lib
```

### Lint

```shell
fvm flutter analyze
```
