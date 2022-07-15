import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/categorie_model.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
          Text(
            "Flutter",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          Text(
            "News",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ]),
        elevation: 0,
      ),
      body: Container(
        child: Column(children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                //print(index);
                return CategoryTile(
                  imageUrl: categories[index].imageUrl,
                  categoryName: categories[index].categoryName,
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({required this.categoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  BlogTile({required this.imageUrl, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [Image.network(imageUrl), Text(title), Text(desc)],
    ));
  }
}
