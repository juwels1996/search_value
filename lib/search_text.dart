import 'package:flutter/material.dart';
import 'package:value_search/model_class.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  static List<MovieClass> main_movie_list = [
    MovieClass(
        "Shawank Redemption",
        2022,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        9.3),
    MovieClass(
        "ghost Rider",
        1965,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        8.4),
    MovieClass(
        "Green Land",
        1989,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        6.3),
    MovieClass(
        "friends",
        1996,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        6.83),
    MovieClass(
        "Loves",
        2016,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        8.75),
    MovieClass(
        "Forgiven",
        1965,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        9.12),
    MovieClass(
        "No Mercy",
        2005,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        8.65),
    MovieClass(
        "Squid Game",
        2019,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        7.03),
    MovieClass(
        "Affectionate",
        2012,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        8.13),
    MovieClass(
        "Pathan",
        1985,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        8.43),
    MovieClass(
        "Big Boss",
        1999,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        7.49),
    MovieClass(
        "No Love For U",
        1994,
        "https://mir-s3-cdn-cf.behance.net/projects/404/6958593.546f58141d41f.jpg",
        8.5),
  ];
  List<MovieClass> display_list = List.from(main_movie_list);
  void updateList(String value) {
    setState(() {
      display_list = main_movie_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text("Search for movie"),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff302360),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    hintText: "eg: The Dark Knight",
                    prefixIcon: Icon(Icons.search)),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: display_list.length == 0
                      ? Center(
                          child: Text("No Result Found",
                            style: TextStyle(
                                color: Colors.tealAccent, fontSize: 17),

                          ),
                        )
                      : ListView.builder(
                          itemCount: display_list.length,
                          itemBuilder: (context, index) => ListTile(
                                title: Text(
                                  display_list[index].movie_title!,
                                  style: TextStyle(
                                      color: Colors.tealAccent, fontSize: 17),
                                ),
                                subtitle: Text(
                                  display_list[index]
                                      .movie_release_year
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.tealAccent, fontSize: 17),
                                ),
                                trailing: Text(
                                  "${display_list[index].rating!}",
                                  style: TextStyle(
                                      color: Colors.tealAccent, fontSize: 17),
                                ),
                                leading: Image.network(
                                  display_list[index]
                                      .movie_poster_url
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              )))
            ],
          ),
        ));
  }
}
