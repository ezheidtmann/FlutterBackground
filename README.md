# Flutter background project

A simple project to demonstrate flutter never offloads itself, causing memory issues

## Purpose

We use Flutter for the UI, but have a need to do a lot of background tasks. Because of this, we need the app to survive in the background. These background tasks are not done in the Flutter layer, but instead in the Swift side. The Flutter component is only used to show the UI to the end user. We are experiencing a lot of reports of crashing, and this is because Apple is killing our app due to memory (worth noting that our app only runs on iOS devices at the moment and not on Android). Ideally, we would like to offload Flutter somehow when the user puts the app in the background to save memory. However, we cannot seem to do that. We realize there may be a tradeoff of slower startup times each time the user comes to the app, but this is acceptable. The flutter engine does not have a destroy/kill/suicide mechanism and there appears no way to kill it. We have tried setting it to nil in hopes Apple's ARC will destroy it, but that doesn't work either. Any help would be appreciated. 

## Usage

Download the project, set your own team, then profile the app to see memory usage


