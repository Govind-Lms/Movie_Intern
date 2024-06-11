import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class ErrorCondition extends StatelessWidget {
  const ErrorCondition({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          const Center(child: CircularProgressIndicator()),
          ShimmerPro.sized(
            light: ShimmerProLight.darker,
            scaffoldBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
            height: 500,
            width: MediaQuery.of(context).size.width,
          ),
          const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

class LoadingCondition extends StatelessWidget {
  const LoadingCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          ShimmerPro.sized(
            light: ShimmerProLight.darker,
            scaffoldBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
            height: 300,
            width: MediaQuery.of(context).size.width,
          ),
          ShimmerPro.text(
            light: ShimmerProLight.darker,
            width: 450,
            scaffoldBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
          ),
          // const Center(
          //   child: CircularProgressIndicator(
          //     color: Colors.blue,
          //   ),
          // )
        ],
      ),
    );
  }
}
