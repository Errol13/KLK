import 'package:flutter/material.dart';
import 'package:klinikonek_project/model/post_model.dart';

class CommentSectionPage extends StatelessWidget {
  const CommentSectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CommentTile(
                      userName: posts[index].userName,
                      commentText: posts[index].textContent,
                      replies: posts[index].comments.map((comment) {
                        return Reply(
                          userName: comment.userName,
                          replyText: comment.text,
                        );
                      }).toList(),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ],
                );
              },
            ),
          ),
          CommentInput(),
        ],
      ),
    );
  }
}

class CommentTile extends StatefulWidget {
  final String userName;
  final String commentText;
  final List<Reply> replies;

  const CommentTile({
    required this.userName,
    required this.commentText,
    required this.replies,
    Key? key,
  }) : super(key: key);

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  bool _showReplies = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage('assets/user.png'),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userName,
                style: TextStyle(
                  color: Color(0xFF276A7B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(widget.commentText),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.reply),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      for (var reply in widget.replies) ReplyTile(reply: reply),
                      ReplyInput(),
                    ],
                  );
                },
              );
            },
          ),
        ),
        if (_showReplies)
          Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Column(
              children: [
                for (var reply in widget.replies) ReplyTile(reply: reply),
                ReplyInput(),
              ],
            ),
          ),
        if (!_showReplies && widget.replies.isNotEmpty)
          Container(
            margin: EdgeInsets.only(left: 50.0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _showReplies = !_showReplies;
                });
              },
              child: Text(
                _showReplies ? 'Hide Replies' : 'See Replies',
                style: TextStyle(
                  color: Color(0xFF276A7B),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class ReplyTile extends StatelessWidget {
  final Reply reply;

  const ReplyTile({required this.reply, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: AssetImage('assets/user.png'),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reply.userName,
            style: TextStyle(
              color: Color(0xFF276A7B),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(reply.replyText),
        ],
      ),
    );
  }
}

class ReplyInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20.0,
          backgroundImage: AssetImage('assets/user.png'),
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Write a reply...',
            border: InputBorder.none,
          ),
          maxLines: null,
        ),
        trailing: IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class CommentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20.0,
          backgroundImage: AssetImage('assets/user.png'),
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Write a comment...',
            border: InputBorder.none,
          ),
          maxLines: null,
        ),
        trailing: IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            // Handle sending the comment
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentSectionPage(),));
          },
        ),
      ),
    );
  }
}

class Reply {
  final String userName;
  final String replyText;

  Reply({
    required this.userName,
    required this.replyText,
  });
}

List<Post> posts = [
  Post(
    userName: 'Hans Villain',
    userProfilePicture: 'assets/default_profile.png',
    textContent: 'Look who\'s unbothered after freezing the whole Arandelle.',
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
        userProfilePicture: 'assets/default_profile.png',
        text: 'I love jellyfish!',
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
      ),
    ],
  ),
  Post(
    userName: 'Ana Ana',
    userProfilePicture: 'assets/default_profile.png',
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
    userProfilePicture: 'assets/default_profile.png',
    textContent: 'Okay lang po ba gamitin Ambroxol para sa bata?',
    images: [],
    timestamp: DateTime.now().subtract(Duration(days: 2)),
    likes: 5,
    comments: [],
  ),
];
