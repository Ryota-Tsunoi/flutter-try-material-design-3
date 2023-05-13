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

## Assumptions

- This project manages the FlutterSDK with FVM.Please install FVM before tinkering with this project.
  ```shell
  dart pub global activate fvm
  # or
  # brew tap leoafarias/fvm
  # brew install fvm
  ```
- Don't forget to add it to your PATH!
  ```shell
  # example
  export PATH="$PATH:$HOME/.pub-cache/bin"
  ```

## Run

1. This project manages the FlutterSDK with FVM.Please execute the following command to install the FlutterSDK for your project.
   ```shell
   fvm install
   ```
2. You can launch the application in any way you like, either from running and debugging VSCode or from the Flutter command.
   ```shell
   fvm flutter run -d <YOUR_TARGET_DEVICE>
   ```

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

## Help

- How to generate freezed/json_serialize model (eg: **.freezed.dart, **.g.dart)
  ```shell
  fvm flutter pub run build_runner build --delete-conflicting-outputs
  ```
