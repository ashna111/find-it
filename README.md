## Find It - An internship portal :P

- Allows one to add and view the current internships available
- Firebase Realtime Database

### Set-up Firebase
* Add a new project on [Firebase Console](https://console.firebase.google.com)
* Generate `google-services.json` and `GoogleService-Info.plist`
* Add `google-services.json` to `android/app` folder
* Add `GoogleService-Info.plist` to `ios/Runner` folder
* In project level build.gradle - `android/build.gradle` add the dependencies
```java
dependencies {
        classpath 'com.android.tools.build:gradle:3.2.1'
        classpath 'com.google.gms:google-services:4.0.1'
    }
```
* In android/app/build.gradle add the following plugin
```java 
apply plugin: 'com.google.gms.google-services'
```
* Add the packages to `pubspec.yaml` file
```
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2
  firebase_auth:
  firebase_database:
  firebase_storage:
  url_launcher:
```


<table>
  <tr><td>
    <img src="ss/1.jpeg" width=230px/>
  </td>
  <td>
    <img src="ss/2.jpeg" width=230px/>
  </td>
  <td>
    <img src="ss/3.jpeg" width=230px/>
  </td>
  </tr></table>
  
Made for OSL Lab :)
