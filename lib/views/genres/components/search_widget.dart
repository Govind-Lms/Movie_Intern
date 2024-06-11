import 'package:flutter/material.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/search/search_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const SearchScreen()));
      },
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.amber[50],
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20.0,),
            Text('Search',style: Style().categoryStyle.copyWith(color: Colors.black,fontWeight: FontWeight.normal),),
            const Spacer(),
            const Icon(Icons.search,color: Colors.black,),
            const SizedBox(width: 20.0,),
          ],
        )
      ),
    );
  }
}