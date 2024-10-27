import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SnackController extends GetxController {
  var quantity = 1.obs;
  var image = ''.obs;
  var selectedToppings = <String>[].obs;
  var totalPrice = 35000.obs;

  final ImagePicker picker = ImagePicker();

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  void pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = pickedFile.path;
    }
  }

  void toggleTopping(String topping, int price) {
    if (selectedToppings.contains(topping)) {
      selectedToppings.remove(topping);
      totalPrice -= price;
    } else {
      selectedToppings.add(topping);
      totalPrice += price;
    }
  }
}
