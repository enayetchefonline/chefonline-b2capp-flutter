
import 'package:chefonline/core/common/common_button.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'name': 'Sheba',
      'orderId': '2284625',
      'date': '06/11/2025',
      'address': 'CM17 9AA',
      'inTime': '09:34 AM',
      'outTime': '04:00 PM',
      'paid': '£20.79',
      'type': 'Collection'
    },
    {
      'name': 'Shish Mahal',
      'orderId': '2284357',
      'date': '05/11/2025',
      'address': 'CM17 9AA',
      'inTime': '11:50 AM',
      'outTime': '06:15 PM',
      'paid': '£35.75',
      'type': 'Collection'
    },
    {
      'name': 'Taste Me UK',
      'orderId': '2284355',
      'date': '05/11/2025',
      'address': 'CM17 9AA',
      'inTime': '11:47 AM',
      'outTime': '06:30 PM',
      'paid': '£25.85',
      'type': 'Collection'
    },
  ];

   OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order History',style: Theme.of(context).textTheme.bodyMedium,),),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Orders: ${orders.length}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                order['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                'ORDER ID - ${order['orderId']}',
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      color: Colors.red, size: 18),
                                  const SizedBox(width: 4),
                                  Text(order['address']!),
                                ],
                              ),
                              Text(order['date']!),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'IN: ${order['inTime']} | OUT: ${order['outTime']}',
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.shopping_bag_outlined,
                                      color: Colors.red, size: 18),
                                  const SizedBox(width: 4),
                                  Text(
                                    order['type']!,
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                'Paid: ${order['paid']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            leftWidget: Icon(Icons.star_border,color: Colors.white,),
                            label: 'REVIEW & RATING',
                            textColor: Colors.white,
                            fontSize: 14,
                            onPressed: (){},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}