import 'package:flutter/material.dart';

void main() {
  runApp(CartApp());
}

class CartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Bag"),
        ),
        body: CartPage(),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Initialize the item counts and unit prices for three items
  List<int> itemCounts = [1, 1, 1];
  List<double> unitPrices = [25.00, 30.00, 15.00];

  // Calculate the total price for each item
  double totalPrice(int index) => itemCounts[index] * unitPrices[index];

  // Calculate the grand total for all items
  double get grandTotal {
    double total = 0;
    for (int i = 0; i < itemCounts.length; i++) {
      total += totalPrice(i);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // List of items
        Expanded(
          child: ListView.builder(
            itemCount: itemCounts.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5, // Elevation for the item
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Image Section
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                            'https://www.dartscorner.co.uk/cdn/shop/products/P-DE-TSH-HWT-BK-Parent-1.jpg?v=1695255449&width=160'), // Placeholder for item image
                      ),
                      const SizedBox(width: 10),

                      // T-shirt Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'T-shirt Name ${index + 1}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Text('Size: M'),
                                SizedBox(width: 20),
                                Text('Color: Blue'),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (itemCounts[index] > 1) {
                                        itemCounts[index]--;
                                      }
                                    });
                                  },
                                  child: const Text('-'),
                                ),
                                const SizedBox(width: 10),
                                Text('${itemCounts[index]}'),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      itemCounts[index]++;
                                    });
                                  },
                                  child: const Text('+'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Price and Menu
                      Column(
                        children: [

                          const Icon(Icons.more_vert),
                          const SizedBox(height: 20),
                          Text(
                            '\$${unitPrices[index].toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Total Price Display
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Amount:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${grandTotal.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        // Checkout Button
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Congratulations! You have checked out."),
              ),
            );
          },
          child: const Text('CHECK OUT'),
        ),
        const SizedBox(height: 20), // Adding some space below the button
      ],
    );
  }
}
