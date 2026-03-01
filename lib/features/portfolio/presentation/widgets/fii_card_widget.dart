import 'package:flutter/material.dart';
import '../../domain/entities/fii_entity.dart';

class FiiCardWidget extends StatelessWidget {
  final FiiEntity fii;

  const FiiCardWidget({super.key, required this.fii});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: const Color(0xFF1E1E1E),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(fii.ticker, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('R\$ ${fii.currentPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, color: Colors.white70)),
              ],
            ),
            const Divider(color: Colors.white24, height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Último Div.', style: TextStyle(color: Colors.grey)),
                    Text('R\$ ${fii.lastDividend.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Número Mágico', style: TextStyle(color: Colors.grey)),
                    Text('${fii.magicNumber} cotas', style: const TextStyle(fontSize: 16, color: Colors.blueAccent)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}