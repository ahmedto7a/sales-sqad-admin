import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/salesmen.dart';

class SalesmanCard extends StatelessWidget {
  final Salesman salesman;
  final Color backgroundColor;
  final Function onTap;

  const SalesmanCard({
    required this.salesman,
    required this.onTap,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (salesman.target == '0.00' || salesman.target.isEmpty)
        ? 0
        : double.parse(salesman.current) / double.parse(salesman.target);
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(salesman.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 6,
                        ),
                        Text('(${salesman.role})',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('Current: ${double.parse(salesman.current) == 0.0 ? 0 : double.parse(salesman.current).toStringAsFixed(0)}'),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: CircularProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                    ),
                  ),
                  Text('${(progress * 100).toStringAsFixed(0)}%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
