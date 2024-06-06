import 'package:flutter/material.dart';
import 'package:latihan_praktek_m09/data/content.dart';
import 'package:latihan_praktek_m09/widgets/add_modal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexContent = 0;

  void changeScreen(int index) {
    if (mounted) {
      setState(() {
        _indexContent = index;
      });
    }
  }

  void addClickHandler(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const AddModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List data = (content[_indexContent]["contents"] as List).map((e) {
      return e;
    }).toList();

    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${content[_indexContent]["screen"]}"),
          bottom: TabBar(
              tabs: data
                  .map((e) => Tab(
                        text: e["tab"],
                      ))
                  .toList()),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 180,
                color: Colors.purple,
              ),
              const SizedBox(
                height: 80,
              ),
              ListTile(
                leading: Icon(Icons.movie,
                    color: _indexContent == 0 ? Colors.purple : Colors.grey),
                title: Text(
                  'Movie',
                  style: TextStyle(
                      color: _indexContent == 0 ? Colors.purple : Colors.grey),
                ),
                onTap: () {
                  changeScreen(0);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.library_music,
                    color: _indexContent == 1 ? Colors.purple : Colors.grey),
                title: Text(
                  'Music',
                  style: TextStyle(
                      color: _indexContent == 1 ? Colors.purple : Colors.grey),
                ),
                onTap: () {
                  changeScreen(1);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.book,
                    color: _indexContent == 2 ? Colors.purple : Colors.grey),
                title: Text(
                  'Book',
                  style: TextStyle(
                      color: _indexContent == 2 ? Colors.purple : Colors.grey),
                ),
                onTap: () {
                  changeScreen(2);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ...data.map((e) {
            return e['data'].length > 0
                ? Column(
                    children: [
                      ...(e['data'] as List).map((e) => Card(
                            child: ListTile(
                              leading: SizedBox(
                                  height: 80,
                                  width: 40,
                                  child: Image.network(
                                    e['cover'],
                                    fit: BoxFit.cover,
                                  )),
                              title: Text(
                                e['title'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                e['subtitle'],
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ))
                    ],
                  )
                : Center(
                    child: Text(
                      "${content[_indexContent]["screen"]} ${e['tab']} Kosong",
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
          })
        ]),
      ),
    );
  }
}
