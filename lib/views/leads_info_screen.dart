import 'package:flutter/material.dart';

import '../models/LeadInfo.dart';

class LeadDetailsPage extends StatelessWidget {
  final LeadInfo lead;

  LeadDetailsPage({required this.lead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lead Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${lead.name}', style: TextStyle(fontSize: 20)),
            Text('Email: ${lead.email ?? 'N/A'}', style: TextStyle(fontSize: 20)),
            Text('Phone: ${lead.phone}', style: TextStyle(fontSize: 20)),
            Text('Value: ${lead.value}', style: TextStyle(fontSize: 20)),
            Text('Status: ${lead.status}', style: TextStyle(fontSize: 20)),
            Text('Sales: ${lead.sales}', style: TextStyle(fontSize: 20)),
            Text('Created At: ${lead.createdAt}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}