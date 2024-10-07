import 'package:flutter/material.dart';
import 'transaction_detail_screen.dart';

class TransactionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat Transaksi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10),
          children: [
            TransactionTile(
              title: "Transaksi A",
              subtitle: "Barang: Barang A, Jumlah: 10",
              date: DateTime.now().subtract(Duration(days: 1)),
              details: "Deskripsi lengkap tentang Transaksi A.",
            ),
            TransactionTile(
              title: "Transaksi B",
              subtitle: "Barang: Barang B, Jumlah: 5",
              date: DateTime.now().subtract(Duration(days: 2)),
              details: "Deskripsi lengkap tentang Transaksi B.",
            ),
            // Add more transactions here
          ],
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime date;
  final String details; // Detail information about the transaction

  const TransactionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.details, // Pass the transaction details to the tile
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              "Tanggal: ${date.day}/${date.month}/${date.year}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
        onTap: () {
          // Navigasi ke layar detail transaksi
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionDetailScreen(
                title: title,
                subtitle: subtitle,
                date: date,
                details: details,
              ),
            ),
          );
        },
      ),
    );
  }
}
