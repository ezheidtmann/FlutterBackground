# Flutter background project

A simple project to demonstrate flutter never offloads itself, causing memory issues

## Purpose

We use Flutter for the UI, but have a need to do a lot of background tasks. Because of this, we need the app to survive in the background. These background tasks are not done in the Flutter layer, but instead in the Swift side. The Flutter component is only used to show the UI to the end user. We are experiencing a lot of reports of crashing, and this is because Apple is killing our app due to memory (worth noting that our app only runs on iOS devices at the moment and not on Android). Ideally, we would like to offload Flutter somehow when the user puts the app in the background to save memory. However, we cannot seem to do that. We realize there may be a tradeoff of slower startup times each time the user comes to the app, but this is acceptable. We are calling flutterEngine.destroyContext() when it gets backgrounded and setting it to nil, but that doesn't help as much as we thought. Any help would be appreciated as to what else is still hanging onto memory from the Flutter side. 

## Usage

First, make sure you have `flutter` 2.8.1 installed. Then:
 
    cd my_flutter && flutter pub get && flutter build ios-framework
    cd .. && pod install
 
Open XCode, run Profile (Command-I), choose Allocations in Instruments and watch the memory graph. Tap the home button to move the app to the background; tap the app to bring it back to the foreground.

We see the following measurements on an iPhone 7 Plus:

-   2.3MB before launching Flutter
-   26MB after launching Flutter, in foreground
-   10MB in background
-   27MB after re-foregrounding
-   12MB after re-backgrounding

![image (1)](https://user-images.githubusercontent.com/1178915/151409557-3c53b57e-502a-4a97-9dad-c3affb5a5e89.png)

This behavior is suggestive of a memory leak. Perhaps some plugins are holding on to something?

We're hoping to get back to 2.3MB by destroying Flutter and freeing any associated memory.

