
import "dart:typed_data";
import "package:attsys/constants.dart";
import "package:attsys/methods/storage_methods.dart";
import "package:attsys/screens/home_screen.dart";
import "package:flutter/services.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";

class ImageSetup extends StatefulWidget {
  const ImageSetup({super.key});

  @override
  State<ImageSetup> createState() => _ImageSetupState();
}

class _ImageSetupState extends State<ImageSetup> {
  Uint8List? _image;
  String imgUrl = "";
  getImage(ImageSource source)async
  {
    final ImagePicker _picker = ImagePicker();
    XFile? xfile = await _picker.pickImage(source: source,imageQuality:85);
    if(xfile != null)
    {
      return await xfile.readAsBytes();
    }
  }
  void pickImage()async 
  {
    final Uint8List tempImage = await getImage(ImageSource.gallery);
    setState(() {
      _image = tempImage;
    });
    showFlushBar(context, "Uploading", "Please Wait");
    imgUrl = await StorageMethods().uploadImageToStorage(_image!);
    showFlushBar(context, "Success", "Image has been uploaded Successfully");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Setup"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            
            // ignore: prefer_const_constructors
            CircleAvatar(
              radius: 65,
              backgroundImage: _image==null?const AssetImage("assets/profile.jpg"):MemoryImage(_image!) as ImageProvider,
            ),
            TextButton(
              onPressed: ()
              {
                pickImage();
              },
              child: const Text("Select Image"),
      
              ),
              ElevatedButton(
                onPressed: (){
                  moveToNextScreen();
                 }, 
              child: const Text("Continue")),
              ]),
      )
        );
  

    
  }
  void moveToNextScreen()
  {
    StorageMethods().addImageToFirestore(imgUrl);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomeScreen()));
  }
}