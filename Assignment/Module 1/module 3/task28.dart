import 'package:flutter/material.dart';

class Task28 extends StatelessWidget {
  Task28({super.key});

  final List<Map<String, String>> products = [
    {
      'name': 'Shoes',
      'price': '₹ 895',
      'image':
          'https://redtape.com/cdn/shop/files/RLL0186_1_1324e335-513d-4206-8e5b-afcfa232da72.jpg?v=1756809257',
    },
    {
      'name': 'Watch',
      'price': '₹ 120',
      'image':
          'https://www.sonatawatches.in/dw/image/v2/BKDD_PRD/on/demandware.static/-/Sites-titan-master-catalog/default/dw4bcefb11/images/Sonata/Catalog/77105SM12W_1.jpg?sw=600&sh=600',
    },
    {
      'name': 'Bag',
      'price': '₹ 89',
      'image':
          'https://rukminim3.flixcart.com/image/824/972/xif0q/shopsy-backpack/v/s/4/trending-stylish-casual-attractive-light-weight-pu-leather-girls-original-imah68yyt2u8zypq.jpeg?q=60&crop=false',
    },
    {
      'name': 'Headphones',
      'price': '₹ 99',
      'image':
          'https://cdn.thewirecutter.com/wp-content/media/2023/07/bluetoothheadphones-2048px-0876.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Container(
                width: 180,
                margin: EdgeInsets.only(right: 12),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          product['image']!,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              product['price']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
