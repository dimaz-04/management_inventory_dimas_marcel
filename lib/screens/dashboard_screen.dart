import 'package:flutter/material.dart';
import 'inventory_list_screen.dart';
import 'transaction_history_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white, // Change title text color to white
          ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white, // Change logout icon color to white
            ),
            onPressed: () {
              // Navigate to the login screen
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Aplikasi Manajemen Inventaris',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),

                // Manage Inventory Button
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(Icons.inventory, size: 40, color: Colors.blue),
                    title: Text(
                      "Kelola Stok Barang",
                      style: TextStyle(fontFamily: 'Poppins'), // Set font family to Poppins
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/inventory');
                    },
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Transaction History Button
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(Icons.history, size: 40, color: Colors.blue),
                    title: Text(
                      "Riwayat Transaksi",
                      style: TextStyle(fontFamily: 'Poppins'), // Set font family to Poppins
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/transaction-history');
                    },
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
