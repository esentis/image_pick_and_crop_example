# Image pick & crop example

An example showcasing picking image from your gallery and croppinng it. The core of the example is from [image_cropper](https://pub.dev/packages/image_cropper) library.

## Getting Started

Download the `image_cropper` & `image_picker` dependency.

#### Android

Add below code at you `AndroidManifest.xml`

```xml
<activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
```

#### iOS

Add below lines at your `info.plist` file.

```plist
<key>NSMicrophoneUsageDescription</key>
<string>Used from image picker</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Used from image picker</string>
<key>NSCameraUsageDescription</key>
<string>Used from image picker</string>
```

You can now use the code.
