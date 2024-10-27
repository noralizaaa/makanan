import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/snack_controller.dart';

class SnackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SnackController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders / Snack"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Section
            Obx(() => controller.image.value.isEmpty
                ? GestureDetector(
              onTap: controller.pickImage,
              child: Image.network(
                'https://via.placeholder.com/150', // Placeholder image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
                : GestureDetector(
              onTap: controller.pickImage,
              child: Image.file(
                File(controller.image.value),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ayam Bakar",
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Rp 35.000",
                      style: TextStyle(fontSize: 20, color: Colors.red)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: controller.decreaseQuantity,
                        icon: Icon(Icons.remove_circle),
                      ),
                      Obx(() => Text(controller.quantity.value.toString(),
                          style: TextStyle(fontSize: 20))),
                      IconButton(
                        onPressed: controller.increaseQuantity,
                        icon: Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text("Toppings", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  _buildToppingOption("Sambal", 5000, controller),
                  _buildToppingOption("Kerupuk", 5000, controller),
                  _buildToppingOption("Sayur", 5000, controller),
                  _buildToppingOption("Nasi", 5000, controller),
                  SizedBox(height: 16),
                  Obx(() => Text("Total: Rp ${controller.totalPrice.value}",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Add to Cart"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }

  Widget _buildToppingOption(String topping, int price, SnackController controller) {
    return Obx(() => CheckboxListTile(
      title: Text(topping),
      subtitle: Text("+Rp $price"),
      value: controller.selectedToppings.contains(topping),
      onChanged: (bool? value) {
        controller.toggleTopping(topping, price);
      },
    ));
  }
}
