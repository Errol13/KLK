import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:klinikonek_project/screens/actualnotif_page.dart';
import 'package:like_button/like_button.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:sliver_tools/sliver_tools.dart';

class Comment {
  final String userId;
  final String userName;
  final String userProfilePicture;
  final String text;
  final DateTime timestamp;

  Comment({
    required this.userId,
    required this.userName,
    required this.userProfilePicture,
    required this.text,
    required this.timestamp,
  });
}

class Post {
  final String userId;
  final String userName;
  final String userProfilePicture;
  final String textContent;
  final List<String> images;
  final DateTime timestamp;
  int likes;
  int commentCount;
  List<Comment> comments;

  Post({
    required this.userId,
    required this.userName,
    required this.userProfilePicture,
    required this.textContent,
    required this.images,
    required this.timestamp,
    this.likes = 0,
    this.commentCount = 0,
    this.comments = const [],
  });
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [
    Post(
      userId: '1',
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
      userId: '4',
      userName: 'Ana Ana',
      userProfilePicture: 'assets/user.png',
      textContent: 'Prinsesa?',
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
      userId: '6',
      userName: 'Red Horse',
      userProfilePicture: 'assets/user.png',
      textContent: 'Okay pa ba? Kaya pa?',
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
      body: CustomScrollView(
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
                  const Expanded(
                    child: Text(
                      "Hi Julia!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF276A7B),
                      ),
                    ),
                  ),
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
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onTap: () {},
                    splashColor: Colors.white10,
                    child: Ink.image(
                        fit: BoxFit.cover,
                        width: 45,
                        height: 45,
                        image: const AssetImage('assets/Logo.png')),
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
          ),
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
                        ],
                      ),
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
                                color: const Color.fromRGBO(180, 205, 206, 56),
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
                          GestureDetector(
                            onTap: () {
                              //temporary
                            },
                            child: LikeButton(
                              size: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_comment_rounded),
                            onPressed: () {},
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
      ),
    );
  }

//adding post
  void addPost(BuildContext context) async {
    final postContent = await _showPostInputPopup(context);

    if (postContent != null) {
      Post newPost = Post(
        userId: 'userId',
        userName: 'Admin', //temporary
        userProfilePicture: 'assets/user.png', //temporary
        textContent: postContent,
        images: [],
        timestamp: DateTime.now(),
      );

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
          title: Text('Create a New Post'),
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
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
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
                Navigator.of(context).pop(postController.text);
              },
              child: Text(
                'Post',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF276A7B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF276A7B),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
