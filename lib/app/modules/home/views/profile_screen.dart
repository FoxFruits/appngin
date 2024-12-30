import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/about_us_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:io' as io; 
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  final AuthController _authController = Get.put(AuthController());
 
  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFFA52A2A),
      ),
      body: Container(
        color: Colors.pink[50],
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _profileImage != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(_profileImage!),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
                        ),
                  SizedBox(width: 20), // Jarak antara Circle Avatar dan tombol
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Update Profile Picture', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA52A2A), // Button color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Nama User',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
            
              ListTile(
                title: Text('Tentang Kami', style: TextStyle(color: Colors.black)),
                onTap: () {
                
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                },
              ),
              ListTile(
                title: Text('History Pembayaran', style: TextStyle(color: Colors.black)),
                onTap: () {
                  
                },
              ),
              ListTile(
                title: Text('Keluar', style: TextStyle(color: Colors.black)),
                onTap: () {
                 
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Konfirmasi Keluar'),
                        content: Text('Apakah Anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              _authController.logout();
                            },
                            child: Text('Keluar'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
