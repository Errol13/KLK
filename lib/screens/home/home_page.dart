import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:klinikonek_project/model/liked.dart';
import 'package:klinikonek_project/model/post_model.dart';
import 'package:klinikonek_project/model/user_model.dart';
import 'package:klinikonek_project/screens/home/actualnotif_page.dart';
import 'package:klinikonek_project/screens/home/comment_section.dart';
import 'package:like_button/like_button.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Adding post with comments and images to Firestore
  Future<void> addPostToFirestore(Post newPost) async {
    try {
      // Upload images to Firebase Storage and get download URLs
      List<String> imageUrls = await uploadImages(newPost.images);

      // Add download URLs to post map
      newPost.images = imageUrls;

      // Convert Post object to Map
      Map<String, dynamic> postMap = newPost.toJson();

      // Use the user's ID as the document ID for the post
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(widget.user!.uid)
          .collection('posts')
          .doc()
          .set(postMap);

      print('Post added to Firestore successfully!');
    } catch (e) {
      print('Error adding post to Firestore: $e');
    }
  }

// Upload images to Firebase Storage and get download URLs
  Future<List<String>> uploadImages(List<String> imagePaths) async {
    List<String> imageUrls = [];

    for (String imagePath in imagePaths) {
      // Use Firebase Storage API to upload the image
      // Replace 'your_storage_bucket' with your Firebase Storage bucket name
      String storagePath =
          'gs://klinikonek-bb5f7.appspot.com/${DateTime.now().millisecondsSinceEpoch}_${imagePath.split('/').last}';
      final Reference storageReference =
          FirebaseStorage.instance.ref().child(storagePath);
      final UploadTask uploadTask = storageReference.putFile(File(imagePath));

      // Wait for the upload to complete and get download URL
      final TaskSnapshot downloadUrl = await uploadTask;
      final String imageUrl = await downloadUrl.ref.getDownloadURL();

      // Add download URL to the list
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  }

  int selectedOption = 1;

  void _show() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext ctx) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: AlertDialog(
            backgroundColor: Color(0xFFC6DBDC).withOpacity(0.9),
            title: Text(
              'Select a problem ',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF276A7B),
              ),
            ),
            content: SizedBox(
              height: 350,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Spam'),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: selectedOption,
                      activeColor: Color(0xFF276A7B),
                      fillColor: MaterialStateProperty.all(
                        Color(0xFF276A7B),
                      ),
                      splashRadius: 20,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('False Information'),
                    leading: Radio<int>(
                      value: 2,
                      groupValue: selectedOption,
                      activeColor: Color(0xFF276A7B),
                      fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                      splashRadius: 20,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Hate Speech'),
                    leading: Radio<int>(
                      value: 3,
                      groupValue: selectedOption,
                      activeColor: Color(0xFF276A7B),
                      fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                      splashRadius: 20,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Harrasment'),
                    leading: Radio<int>(
                      value: 4,
                      groupValue: selectedOption,
                      activeColor: Color(0xFF276A7B),
                      fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                      splashRadius: 20,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Nudity'),
                    leading: Radio<int>(
                      value: 5,
                      groupValue: selectedOption,
                      activeColor: Color(0xFF276A7B),
                      fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                      splashRadius: 20,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Suicide or self-injury'),
                    leading: Radio<int>(
                      value: 6,
                      groupValue: selectedOption,
                      activeColor: Color(0xFF276A7B),
                      fillColor: MaterialStateProperty.all(Color(0xFF276A7B)),
                      splashRadius: 20,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 130, 130, 131),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Send',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF276A7B),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Post> posts = [
    Post(
      userName: 'Elsa Arandelle',
      userProfilePicture: 'assets/user.png',
      textContent: 'The cold never bothered me anyway.',
      images: [],
      timestamp: DateTime.now(),
      likes: 15,
      comments: [
        Comment(
          userId: '2',
          userName: 'Sam Smith',
          userProfilePicture: 'assets/user.png',
          text: 'Won\'t you stay with me?',
          timestamp: DateTime.now().subtract(Duration(minutes: 30)),
        ),
        Comment(
          userId: '3',
          userName: 'Spongebob SquarePants',
          userProfilePicture: 'assets/user.png',
          text: 'I love jellyfish!',
          timestamp: DateTime.now().subtract(Duration(hours: 2)),
        ),
      ],
    ),
    Post(
      userName: 'Ana Ana',
      userProfilePicture: 'assets/user.png',
      textContent: 'Ano pong gamot sa ubo?',
      images: [],
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      likes: 8,
      comments: [
        Comment(
          userId: '5',
          userName: 'Lavinia Lavinia',
          userProfilePicture: 'assets/user.png',
          text: 'Inggetera!',
          timestamp: DateTime.now().subtract(Duration(days: 1, hours: 5)),
        ),
      ],
    ),
    Post(
      userName: 'Lily Cruz',
      userProfilePicture: 'assets/user.png',
      textContent: 'Okay lang po ba gamitin Ambroxol para sa bata?',
      images: [],
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      likes: 5,
      comments: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/Logo.png', height: 30, width: 30),
            SizedBox(width: 10),
            const Text(
              "Klinikonek",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF276A7B),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<UserModel?>(
        future: readUsers(widget.user!.uid), // Use the current user's ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Color(0xFF276A7B),
            ));
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          UserModel? currentUser = snapshot.data;

          if (currentUser == null) {
            return Text('User not found');
          }

          return CustomScrollView(
            slivers: [
              SliverPinnedHeader(
                child: Container(
                  color: Color(0xFFE6E7E8),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(15),
                        height: 40,
                        width: 40,
                        child: Center(
                          child: Image.asset(
                            'assets/wave.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Hi ${currentUser.firstName}!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF276A7B),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () => addPost(context),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: Color(0xFF276A7B),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ActualNotificationPage())),
                        child: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: Color(0xFF276A7B),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/user.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
              ),

              //Posts
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Post post = posts[index];

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          const Row(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              Image.asset(
                                post.userProfilePicture,
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  post.userName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFF276A7B),
                                  ),
                                ),
                              ),
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  // Handle menu item selection
                                  if (value == 'edit') {
                                    // Handle edit action
                                  } else if (value == 'delete') {
                                    // Handle delete action
                                  } else if (value == 'report') {
                                    _show();
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem<String>(
                                      value: 'edit',
                                      child: Text('Edit'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'report',
                                      child: Text(
                                        'Report',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ];
                                },
                              ),
                            ],
                          ),

                          //Content
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Text(
                                  post.textContent,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF276A7B),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromRGBO(180, 205, 206, 56),
                                  ),
                                  height: 32,
                                  margin: const EdgeInsets.all(15),
                                ),
                              ),
                              Text(
                                '${post.likes}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF276A7B),
                                ),
                              ),
                              LikeButtonWidget(
                                likes: post.likes,
                                isLiked: post.isLiked,
                                onTap: () {
                                  // Toggle the liked status and update the likes count
                                  setState(() {
                                    post.isLiked = !post.isLiked;
                                    if (post.isLiked) {
                                      post.likes++;
                                    } else {
                                      post.likes--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_comment_rounded),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CommentSectionPage()),
                                  );
                                },
                                iconSize: 35,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

//retrieving data from firebase
  Future<UserModel?> readUsers(String uid) async {
    try {
      DocumentSnapshot docUser =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      if (docUser.exists) {
        // Cast the dynamic data to Map<String, dynamic>
        Map<String, dynamic> userData = docUser.data() as Map<String, dynamic>;
        return UserModel.fromJson(userData);
      } else {
        return null;
      }
    } catch (e) {
      print("Error retrieving user data: $e");
      return null;
    }
  }

//adding post
  void addPost(BuildContext context) async {
    final postContent = await _showPostInputPopup(context);

    if (postContent != null) {
      Post newPost = Post(
        userName: 'Admin', //temporary
        userProfilePicture: 'assets/user.png', //temporary
        textContent: postContent,
        images: [],
        timestamp: DateTime.now(),
      );

      // Add the post to Firestore
      await addPostToFirestore(newPost);

      setState(() {
        posts.add(newPost);
      });
    }
  }

  Future<String?> _showPostInputPopup(BuildContext context) async {
    TextEditingController postController = TextEditingController();
    ImagePicker _imagePicker = ImagePicker();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Create a New Post',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: postController,
                maxLines: 3,
                maxLength: 1000,
                decoration: InputDecoration(
                  hintText: 'Enter your post here...',
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10), // Adjust padding
                      ),
                      onPressed: () async {
                        // Open image picker
                        final pickedFile = await _imagePicker.pickImage(
                          source: ImageSource.gallery,
                        );

                        if (pickedFile != null) {
                          // Do something with the selected image
                          print("Image selected: ${pickedFile.path}");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: const Text(
                          'Attach Image',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff1E2F97),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Add some space between the buttons
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10), // Adjust padding
                      ),
                      onPressed: () async {
                        // Open video picker
                        final pickedFile = await _imagePicker.pickVideo(
                          source: ImageSource.gallery,
                        );

                        if (pickedFile != null) {
                          // Do something with the selected video
                          print("Video selected: ${pickedFile.path}");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Attach Video',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff1E2F97),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  shadows: [
                    Shadow(
                      color: Colors.black, // Shadow color
                      offset: Offset(1.0, 1.0), // Shadow offset
                      blurRadius: 0.5, // Shadow blur radius
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(postController.text);
              },
              child: Text(
                'Post',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF276A7B),
                  shadows: [
                    Shadow(
                      color: Colors.black, // Shadow color
                      offset: Offset(1.0, 1.0), // Shadow offset
                      blurRadius: 0.5, // Shadow blur radius
                    ),
                  ],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
