import 'package:flutter/material.dart';
import '../cubit/main_state.dart';

Widget? ratingWidget(int index, MainState state){

  if (state.allProducts![index].rating!.rate!.toInt() == 1) {
    return Row(
      children: [
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        Icon(Icons.star, size: 12, color: Colors.grey[350]),
        Icon(Icons.star, size: 12, color: Colors.grey[350]),
        Icon(Icons.star, size: 12, color: Colors.grey[350]),
        Icon(
          Icons.star,
          size: 12,
          color: Colors.grey[350],
        ),
      ],
    );
  } else if (state.allProducts![index].rating!.rate!.toInt() == 2) {
    return Row(
      children: [
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        Icon(Icons.star, size: 12, color: Colors.grey[350]),
        Icon(Icons.star, size: 12, color: Colors.grey[350]),
        Icon(
          Icons.star,
          size: 12,
          color: Colors.grey[350],
        ),
      ],
    );
  } else if (state.allProducts![index].rating!.rate!.toInt() == 3) {
    return Row(
      children: [
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        Icon(Icons.star, size: 12, color: Colors.grey[350]),
        Icon(
          Icons.star,
          size: 12,
          color: Colors.grey[350],
        ),
      ],
    );
  } else if (state.allProducts![index].rating!.rate!.toInt() == 4) {
    return Row(
      children: [
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        const Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        Icon(
          Icons.star,
          size: 12,
          color: Colors.grey[350],
        ),
      ],
    );
  } else if (state.allProducts![index].rating!.rate!.toInt() == 5) {
    return Row(
      children: const [
        Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
        Icon(Icons.star, size: 12, color: Color(0xFFFFA800)),
      ],
    );
  }
}