import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final paginationAuth = Get.put(PaginationController());

class PaginationController extends GetxController {
  // page number
  int page = 1;

  // to store all response from the API
  List posts = [];

  // to fetch data from API
  Future<void> fetchposts() async {
    final url =
        "https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=10&page=$page";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as List;
      posts = posts + jsonResponse;
      update();
    }
  }

  // boolean to know if we are fetching more data
  bool isLoadingMore = false;

  // scroll controller to determine how far we have scrolled
  final scrollController = ScrollController();

  // scroll listener to keep listening for scrolling changes on the page
  Future<void> scrollListener() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadingMore = true;
      page = page + 1;
      await fetchposts();
      isLoadingMore = false;
      update();
    }
  }
}
