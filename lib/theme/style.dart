import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style{
  TextStyle categoryStyle = GoogleFonts.oswald().copyWith(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

class CarouselStyle{
  TextStyle titleStyle = GoogleFonts.raleway().copyWith(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  TextStyle releaseStyle = GoogleFonts.poppins().copyWith(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontStyle: FontStyle.italic,
  );
   
}

class PopularStyle{
  TextStyle titleStyle = GoogleFonts.raleway().copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  TextStyle releaseDate = GoogleFonts.poppins().copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  TextStyle ratingStyle = GoogleFonts.poppins().copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    fontStyle: FontStyle.italic,
  );
}



class DetailStyle{
  TextStyle titleStyle = GoogleFonts.poppins().copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  TextStyle castStyle = GoogleFonts.oswald().copyWith(
    fontSize: 16.0,
    color: Colors.white,
  );
  TextStyle releaseDate = GoogleFonts.poppins().copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  TextStyle genreStyle = GoogleFonts.poppins().copyWith(
    fontSize: 14.0,
    color: Colors.white,
  );
  TextStyle ratingStyle = GoogleFonts.poppins().copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.amber,
    fontStyle: FontStyle.italic,
  );
}




class CastStyle{
  TextStyle nameStyle = GoogleFonts.poppins().copyWith(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  TextStyle normalStyle = GoogleFonts.poppins().copyWith(
    fontSize: 14.0,
    color: Colors.white,
  );
  TextStyle titleStyle = GoogleFonts.poppins().copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}