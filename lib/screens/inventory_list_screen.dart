import 'package:flutter/material.dart';
import '../models/inventory_model.dart';

class InventoryListScreen extends StatefulWidget {
  @override
  _InventoryListScreenState createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  List<InventoryItem> inventoryItems = [
    InventoryItem(id: '1', name: 'Barang A', quantity: 10, transactionDate: DateTime.now()),
    InventoryItem(id: '2', name: 'Barang B', quantity: 5, transactionDate: DateTime.now()),
  ];

  void _addNewItem(String name, int quantity) {
    setState(() {
      inventoryItems.add(InventoryItem(
        id: (inventoryItems.length + 1).toString(),
        name: name,
        quantity: quantity,
        transactionDate: DateTime.now(),
      ));
    });
  }

  void _showAddItemDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Tambah Barang"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nama Barang"),
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: "Jumlah"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && quantityController.text.isNotEmpty) {
                  _addNewItem(nameController.text, int.parse(quantityController.text));
                  Navigator.of(context).pop();
                }
              },
              child: Text("Tambah"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Batal"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengelolaan Stok Barang",
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
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0), // Menambahkan jarak dari atas
          child: ListView.builder(
            itemCount: inventoryItems.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 5,
                child: ListTile(
                  title: Text(
                    inventoryItems[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Jumlah: ${inventoryItems[index].quantity}",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        inventoryItems.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog, // Menampilkan dialog untuk menambah barang
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
