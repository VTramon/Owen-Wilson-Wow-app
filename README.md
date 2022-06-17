# Owen Wilson WOW App

An app tha you can 

## Installation

#### 1º - Clone the repository.

```git
git clone https://github.com/VTramon/Owen-Wilson-Wow-app.git
```

#### 2º - Get the packages
```
flutter pub get
```

#### 3º - Make sure the firebase-tools and flutterfire_cli are installed and configured
```
npm install -g firebase-tools

dart pub global activate flutterfire_cli

flutterfire configure
```


## Usage


check if the app SHA keys are in the firebase console
```
cd android

./gradlew signingReport
```

Run the application
```
flutter run
```

## License
[MIT](https://choosealicense.com/licenses/mit/)