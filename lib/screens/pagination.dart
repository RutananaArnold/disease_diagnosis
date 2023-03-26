import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_exp/controllers/pagination_controller.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  @override
  void initState() {
    super.initState();
    paginationAuth.scrollController.addListener(paginationAuth.scrollListener);
    paginationAuth.fetchposts();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaginationController>(
        init: PaginationController(),
        builder: (paginate) {
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            controller: paginate.scrollController,
            itemCount: paginate.isLoadingMore
                ? paginate.posts.length + 1
                : paginate.posts.length,
            itemBuilder: (context, index) {
              if (index < paginate.posts.length) {
                final returnPost = paginate.posts[index];
                return Card(
                  child: ListTile(
                      leading: CircleAvatar(child: Text("${index + 1}")),
                      title: Text(returnPost['title']['rendered']),
                      subtitle: Text("Link:-  ${returnPost['shortlink']}")),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        });
  }
}
