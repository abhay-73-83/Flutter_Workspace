import 'package:flutter/material.dart';

class Task26 extends StatefulWidget {
  const Task26({super.key});

  @override
  State<Task26> createState() => _Task26State();
}

class _Task26State extends State<Task26> {
  List<int> items = List.generate(20, (index) => index + 1);
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !isLoading) {
        loadMore();
      }
    });
  }

  void loadMore() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      items.addAll(List.generate(20, (index) => items.length + index + 1));
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Infinite Scrolling List")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: items.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < items.length) {
                  return ListTile(
                    title: Text("Item ${items[index]}"),
                  );
                }
                else
                {
                  return Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
