<a href="https://flutter.dev/"><img src="https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png" align="right" width="10%"></a>
# Musiclum

## Description
Musiclum is a sleek music application designed to enhance your music discovery experience. Built with Flutter and Dart, it seamlessly showcases artists and their songs, empowering users to explore and select their favorite tunes effortlessly.</br>
Crafted with user-centric principles, Musiclum incorporates a [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) paradigm, merging the [Repository](https://developer.android.com/codelabs/basic-android-kotlin-training-repository-pattern#3) and [Bloc](https://bloclibrary.dev/#/flutterbloccoreconcepts) design patterns. This fusion guarantees streamlined data handling and delivers an instinctive user journey.

## Table of Contents
- [Before you read](#before-you-read)
- [Architecture](#architecture)
- [Features](#features)
- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots and Demo](#screenshots-and-demo)
- [Changelog](#changelog)
- [Used Packages](#used-packages)
- [License](#license)

<a name="before-you-read"/></a>
## Before you read
Musiclum utilizes the [Spotify API](https://developer.spotify.com/documentation/web-api). However, due to limitations on Spotify access tokens, you need to provide your access token (<i>lib/core/sensitive.dart</i>) and manually build this app. You can find detailed instuction in the [installation](#installation) paragraph.

<a name="architecture"/></a>
## Architecture
Musiclum fully embraces the Clean Architecture pattern, incorporating both the Bloc and Repository patterns.</br>
Clean Architecture consists of the following layers: 
1) Data Layer
2) Domain Layer (Business Logic)
3) Presentation Layer (UI) </br></br>

Architecture for <b>API calls</b>:
![Api](https://github.com/tortamque/Musiclum/assets/90132962/f2d33290-b220-477f-9bfd-1e5e8e9866d6)

Architecture for <b>Storage calls</b>:
![Hive](https://github.com/tortamque/Musiclum/assets/90132962/d875b4fa-0015-4a18-aacc-b7ce800ea81c)

<a name="features"/></a>
## Features
- Retrieve real-time information with utmost accuracy through the [Spotify API](https://developer.spotify.com/documentation/web-api) to ensure the most current data.
- Browse a curated list of artists and their songs.
- View detailed information about each artist, including discography.
- Mark favorite artists and songs for quick access.
- Intuitive navigation across three seamlessly integrated screens.
- Sleek and modern user interface with smooth animations.
- Responsive design ensuring optimal performance on various devices.

<a name="supported-platforms"/></a>
## Supported platforms
Musiclum is a cross-platform mobile application that supports both <b>Android</b> and <b>iOS</b> platforms.

<a name="installation"/></a>
## Installation
To run the Musiclum app locally, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have Flutter and Dart installed on your system.
3. Generate your Spotify access token ([Instructions](https://developer.spotify.com/documentation/web-api)).
4. Provide your access token in the <i>lib/core/sensitive.dart</i> file.
5. Navigate to the project directory in your terminal.
6. Run the command `flutter pub get` to install the required dependencies.
7. Connect a device or start an emulator.
8. Run the command `flutter run` to launch the app.

<a name="usage"/></a>
## Usage
1. Launch the Musiclum app .
2. The list of artists will appear on the screen.
3. Utilize the search bar located at the top of the screen to find your favorite artists.
4. Tap on an artist card to access detailed information about the artist.
    * You will view the artist's discography, including albums and tracks.
    * To add a track to your favorites, simply tap on the bookmark button (enjoy the beautiful animation 😃).
    * You can also remove a track by pressing the button again.
5. To view your favorites, navigate to the main menu and select the "Favorites" button.
    * You will see a list of artists and their tracks, sorted first by artist and then by song title.
    * To remove a track from favorites, tap on the bookmark button again.
    * If you accidentally remove a track, simply press the button again.


<a name="screenshots-and-demo"/></a>
## Screenshots and Demo
### Screenshots
<img src="https://github.com/tortamque/Musiclum/assets/90132962/a5b3c2e0-79bc-40f8-9b25-9106464584c1" alt="Screenshot_2" width="200">
<img src="https://github.com/tortamque/Musiclum/assets/90132962/66b71977-f92f-4341-88b4-5006fba2c577" alt="Screenshot_3" width="200">
<img src="https://github.com/tortamque/Musiclum/assets/90132962/0350e52a-464f-4087-98a1-9788210ce29f" alt="Screenshot_4" width="200">
<img src="https://github.com/tortamque/Musiclum/assets/90132962/e71ea6b0-0743-4231-ac70-60e5aec10fc3" alt="Screenshot_5" width="200">
<img src="https://github.com/tortamque/Musiclum/assets/90132962/41b6bc31-5bb9-4ecd-87fb-6ad1c0d76a7e" alt="Screenshot_6" width="200">
<img src="https://github.com/tortamque/Musiclum/assets/90132962/7008cbf8-dcd5-4413-80ad-bce76de6cb04" alt="Screenshot_7" width="200">
<img src="https://github.com/tortamque/Musiclum/assets/90132962/3441c5f1-60ef-455b-aaa9-ad1105770cf6" alt="Screenshot_8" width="200">
<img src="https://github.com/tortamque/Musiclum/assets/90132962/d8b5aad6-912d-486b-a1b2-dff5819e246a" alt="Screenshot_1" width="200">


### Demo
https://github.com/tortamque/Musiclum/assets/90132962/9f7e4328-7c93-4b18-9482-2dfa1fc7a064

<a name="changelog"/></a>
## Changelog
### [1.0] - 10.02.2024
  #### Added
 - Initial release. 🔮

<a name="used-packages"/></a>
## Used Packages
The Musiclum app utilizes the following packages:

| Name              | Version | Link on pub.dev                                  |
|-------------------|---------|--------------------------------------------------|
| flutter_bloc      | 8.1.3   | [Link](https://pub.dev/packages/flutter_bloc)    |
| retrofit          | 4.1.0   | [Link](https://pub.dev/packages/retrofit)        |
| get_it            | 7.6.7   | [Link](https://pub.dev/packages/get_it)          |
| dio               | 5.4.0   | [Link](https://pub.dev/packages/dio)             |
| equatable         | 2.0.5   | [Link](https://pub.dev/packages/equatable)       |
| json_annotation   | 4.8.1   | [Link](https://pub.dev/packages/json_annotation) |
| like_button       | 2.0.5   | [Link](https://pub.dev/packages/like_button)     |
| hive              | 2.2.3   | [Link](https://pub.dev/packages/hive)            |
| hive_flutter      | 1.1.0   | [Link](https://pub.dev/packages/hive_flutter)    |
| collection        | 1.17.2  | [Link](https://pub.dev/packages/collection)      |

<a name="licenses"/></a>
## License
Apache License Version 2.0
