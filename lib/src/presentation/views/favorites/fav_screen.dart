import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_intern/src/const/constants.dart';
import 'package:movie_intern/src/core/models/movie_details_model.dart';
import 'package:movie_intern/src/const/style.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String myBoxName = "favorite";

  openBox() async {
    // await Hive.openBox(myBoxName);
    Hive.box(myBoxName);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // openBox();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites',style: Style().categoryStyle,),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(myBoxName).listenable(),
        builder: (context, data, child) {
          final keys = data.keys.cast<int>().toList();
          return ListView.builder(
            itemCount: keys.length,
            itemBuilder: (BuildContext context, int index) {
              final MovieDetailsModel details = data.get(keys[index]);
              return Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(
                      
                      imageUrl: '$imageUrl/${details.posterPath}',
                      errorWidget: (context, url, error) => const Placeholder(),
                    ),
                    const SizedBox(width: 10.0,),
                    Expanded(
                      child: Text(
                        details.title.toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        const snackBar = SnackBar(
                          content: Text(
                            "Deleted Successfully",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        await Hive.box(myBoxName)
                            .delete(keys[index])
                            .whenComplete(() {
                          // setState(() {
                          //   details.isFav = false;
                          // });
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
