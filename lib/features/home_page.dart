import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'first_page.dart';

//blueprintt of Comment
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

//blueprint of Post
class Post {
  final String userId;
  final String userName;
  final String userProfilePicture;
  final String textContent;
  final List<String> images;
  final DateTime timestamp;
  int likes;
  List<Comment> comments; // List of comments

  Post({
    required this.userId,
    required this.userName,
    required this.userProfilePicture,
    required this.textContent,
    required this.images,
    required this.timestamp,
    this.likes = 0,
    this.comments = const [],
  });
}

//since there is no yet database
List<Post> posts = []; // store posts

void addPost(BuildContext context) async {
  // Call a function to show a popup for user input
  final postContent = await _showPostInputPopup(context);

  if (postContent != null) {
    // Create a new post with the entered content
    Post newPost = Post(
      userId: 'userId', // temporary data
      userName: 'userName',
      userProfilePicture: 'userProfilePicture',
      textContent: postContent,
      images: [], // Add images if needed
      timestamp: DateTime.now(),
    );

    // Add the new post to the list
    posts.add(newPost);
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
              decoration: InputDecoration(
                hintText: 'Enter your post here...',
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 0,
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
                    child: const Text(
                      'Attach Image',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 75, 75, 77),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
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
                    child: Text(
                      'Attach Video',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 75, 75, 77),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
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

                //create post
                GestureDetector(
                  onTap: () => addPost(context),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Color(0xFF276A7B),
                  ),
                ),

                SizedBox(
                  width: 5,
                ),

                //notifications
                Icon(
                  Icons.notifications,
                  size: 30,
                  color: Color(0xFF276A7B),
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
                      image: const AssetImage('user.png')),
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            ),

            //Feed
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 250,
              margin: const EdgeInsets.all(15),
              child: Container(
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
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Text(
                            "Hana Jane",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur Lo...gyhyfguhugtjugjgy6tugjhgjgujyi87ygkmhhij <3",
                            style: TextStyle(
                              fontSize: 20,
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
                        const LikeButton(
                          size: 35,
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
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 190,
              margin: const EdgeInsets.all(15),
              child: Container(
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
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Text(
                            "Phoebe Castro",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "Loving can hurt, loving can hurt sometimes",
                            style: TextStyle(
                              fontSize: 20,
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
                        const LikeButton(
                          size: 35,
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
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 190,
              margin: const EdgeInsets.all(15),
              child: Container(
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
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Text(
                            "Errol Celis",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "But it's the only thing that I know",
                            style: TextStyle(
                              fontSize: 20,
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
                        const LikeButton(
                          size: 35,
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
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 220,
              margin: const EdgeInsets.all(15),
              child: Container(
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
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Text(
                            "Xavier Santiago",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "When it gets hard, you know it can get hard sometimes",
                            style: TextStyle(
                              fontSize: 20,
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
                        const LikeButton(
                          size: 35,
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
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 190,
              margin: const EdgeInsets.all(15),
              child: Container(
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
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Text(
                            "Miguel Toledana",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "It is the only thing makes us feel alive",
                            style: TextStyle(
                              fontSize: 20,
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
                        const LikeButton(
                          size: 35,
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
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 250,
              margin: const EdgeInsets.all(15),
              child: Container(
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
                          'assets/user.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Text(
                            "Hana Jane",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF276A7B),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur Lo...gyhyfguhugtjugjgy6tugjhgjgujyi87ygkmhhij <3",
                            style: TextStyle(
                              fontSize: 20,
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
                        const LikeButton(
                          size: 35,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
