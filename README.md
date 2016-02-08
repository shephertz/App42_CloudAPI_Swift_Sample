App42SwiftSample
================
__Integrating App42_iOS_SDK__

As Swift is designed to provide seamless compatibility with Cocoa and Objective-C, you can easily add 3rd party libraries like App42 to your project.
To import an external framework in your Swift project, you have to rely on an Objective-C bridging header to expose the framework’s APIs to Swift. Xcode offers to create this header file when you add an Objective-C file to an existing project.

Steps for integrating App42 SDK in your Swift project are mentioned below.

* Add App42 Framework to Swift Project: Open your project in Xcode, Drag and Drop App42 framework under your project. As you will not find a Framework’s  group here, I recommend you to create a new group and add the framework to it.
* Add SystemConfiguration and CoreTelephony frameworks from the build phases.

* Create Bridging Header:

  1. Add a new Objective-C file as : File -> New -> File -> CocoaTouch Class -> Next
  2. Provide a file name, Choose Objective C as the language and click on Create
  3. Now, when you will be asked to create a bridging header, Click on Yes
  4. Delete the Unused .m and .h file you have created as we only need the bridging header
  5. In the bridging header file that you created above, add the Objective-C import statement for the App42 framework to expose App42’s APIs i.e.
```
#import<Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>
```
Now, you can start using App42 in your Swift project.
