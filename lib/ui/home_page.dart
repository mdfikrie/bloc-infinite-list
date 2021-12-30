import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/post_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;
    print(maxScroll);
    print(currentScroll);

    if (currentScroll == maxScroll) {
      context.read<PostBloc>().add(GetAllPost());
    }
  }

  // void _onScroll() {
  //   if (_isBottom) context.read<PostBloc>().add(GetAllPost());
  // }

  // bool get _isBottom {
  //   if (!controller.hasClients) return false;
  //   final maxScroll = controller.position.maxScrollExtent;
  //   final currentScroll = controller.offset;
  //   return currentScroll >= (maxScroll * 0.9);
  // }

  @override
  void initState() {
    controller.addListener(onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(onScroll);
    return Scaffold(
        appBar: AppBar(
          title: Text("Infiite List"),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              PostLoaded postLoaded = state as PostLoaded;
              print(postLoaded.posts!.length);
              return ListView.builder(
                controller: controller,
                itemCount: (postLoaded.hasReachMax!)
                    ? postLoaded.posts!.length
                    : postLoaded.posts!.length + 1,
                itemBuilder: (context, index) {
                  if (index < postLoaded.posts!.length) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 1),
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${postLoaded.posts![index].title}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${postLoaded.posts![index].body}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              );
            }
          },
        ));
  }
}
