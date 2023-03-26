// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pagination_exp/screens/display_screen.dart';
import 'package:pagination_exp/widgets/photo_capture.dart';
import 'package:torch_light/torch_light.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription camera;
  const CameraPage({super.key, required this.camera});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isVideo = false;
  bool isRecording = false;

  late CameraController cameraController;
  late Future<void> initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    initializeControllerFuture = cameraController.initialize();
  }

  bool isTorchOn = false;
  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        // camera part
        Positioned.fill(
          child: FutureBuilder<void>(
            future: initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return CameraPreview(cameraController);
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),

        // options part for capturing , file picker and filters and flash icon
        // Positioned(
        //   top: 50,
        //   left: 360,
        //   right: 10,
        //   child: Material(
        //     color: Colors.transparent,
        //     child: IconButton(
        //         onPressed: () {
        //           if (isTorchOn) {
        //             setState(() {
        //               FlashMode.torch;
        //               isTorchOn = false;
        //             });
        //           } else {
        //             setState(() {
        //               FlashMode.off;
        //               isTorchOn = true;
        //             });
        //           }
        //         },
        //         icon: Icon(
        //           isTorchOn ? Icons.flash_on : Icons.flash_off,
        //           size: 30,
        //           color: Colors.white,
        //         )),
        //   ),
        // ),
        Positioned(
          top: 50,
          left: 360,
          right: 10,
          child: FutureBuilder<bool>(
            future: isTorchAvailable(context),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData && snapshot.data!) {
                return Material(
                  color: Colors.transparent,
                  child: IconButton(
                      onPressed: () {
                        if (isTorchOn) {
                          setState(() {
                            enableTorch(context);
                            isTorchOn = false;
                          });
                        } else {
                          setState(() {
                            disableTorch(context);
                            isTorchOn = true;
                          });
                        }
                      },
                      icon: Icon(
                        isTorchOn ? Icons.flash_on : Icons.flash_off,
                        size: 30,
                        color: Colors.white,
                      )),
                );
              } else if (snapshot.hasData) {
                return const Center(
                  child: Text('No torch available.'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Positioned(
          bottom: size.height * 0.07,
          left: size.width * 0.2,
          right: size.width * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Card(
                  elevation: 3,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.photo_library_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                // Provide an onPressed callback.
                onPressed: () async {
                  if (isVideo) {
                    // recording logic
                    try {
                      if (isRecording) {
                        final file =
                            await cameraController.stopVideoRecording();
                        setState(() {
                          isRecording = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => DisplayPictureScreen(
                                      imagePath: " ",
                                      filePath: file.path,
                                    ))));
                      } else {
                        await cameraController.prepareForVideoRecording();
                        await cameraController.startVideoRecording();
                        setState(() {
                          isRecording = true;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    // Take the Picture in a try / catch block. If anything goes wrong,
                    // catch the error.
                    try {
                      // Ensure that the camera is initialized.
                      await initializeControllerFuture;

                      // Attempt to take a picture and get the file `image`
                      // where it was saved.
                      final image = await cameraController.takePicture();

                      if (!mounted) return;

                      // If the picture was taken, display it on a new screen.
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DisplayPictureScreen(
                            // Pass the automatically generated path to
                            // the DisplayPictureScreen widget.
                            imagePath: image.path, filePath: '',
                          ),
                        ),
                      );
                    } catch (e) {
                      // If an error occurs, log the error to the console.
                      print(e);
                    }
                  }
                },
                child: isVideo
                    // record video button
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(179, 241, 237, 237),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: isRecording
                              ? const Icon(
                                  Icons.stop,
                                  color: Colors.red,
                                )
                              : const CircleAvatar(
                                  backgroundColor: Color(0xffFECE00),
                                ),
                        ))
                    : const PhotoCapture(),
              ),
              GestureDetector(
                child: Card(
                  elevation: 3,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.pages_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        Positioned(
            bottom: size.height * 0.01,
            left: size.width * 0.2,
            right: size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isVideo ? Colors.white : Colors.transparent),
                    onPressed: () {
                      setState(() {
                        isVideo = true;
                      });
                    },
                    child: Text(
                      "Video",
                      style: TextStyle(
                          color: isVideo ? Colors.black : Colors.white),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isVideo ? Colors.transparent : Colors.white),
                    onPressed: () {
                      setState(() {
                        isVideo = false;
                      });
                    },
                    child: Text(
                      "Photo",
                      style: TextStyle(
                          color: isVideo ? Colors.white : Colors.black),
                    )),
              ],
            )),

        Positioned(
          top: 50,
          left: 5,
          child: Material(
            color: Colors.transparent,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }

  Future<bool> isTorchAvailable(BuildContext context) async {
    try {
      return await TorchLight.isTorchAvailable();
    } on Exception catch (_) {
      _showMessage(
        'Could not check if the device has an available torch',
        context,
      );
      rethrow;
    }
  }

  Future<void> enableTorch(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showMessage('Could not enable torch', context);
    }
  }

  Future<void> disableTorch(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showMessage('Could not disable torch', context);
    }
  }

  void _showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
