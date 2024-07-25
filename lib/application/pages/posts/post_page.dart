import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/application/core/services/theme_service.dart';
import 'package:myapp/application/pages/posts/post_bloc/bloc/postbloc_bloc.dart';
import 'package:provider/provider.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostblocBloc(),
      child: const PostPage(),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostblocBloc>(context).add(PostRequiestEvent());
  }
  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Page',
          style: themedata.textTheme.labelLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<PostblocBloc>(context).add(PostRequiestEvent());
              },
              icon: const Icon(Icons.refresh)),
          Switch(
              value: Provider.of<ThemeServiceProvider>(context).isDarkMode,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context, listen: false)
                    .toggleTheme();
              })
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All post ",
              style: themedata.textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<PostblocBloc, PostblocState>(
                  builder: (context, state) {
                if (state is PostblocInitial) {
                  return const Text("Post are waiting to loaded");
                } else if (state is Postblocloading) {
                  return const Text("Post are loading");
                } else if (state is Postblocloaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return  Card(
                        child: ListTile(
                          title: Text(state.posts[index].title),
                          subtitle: Text(state.posts[index].body),
                          leading:  CircleAvatar(
                            child: Text(index.toString()),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is Postblocerror) {
                  return Text(state.error);
                } else {
                  return const Text("Something went wrong");
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
