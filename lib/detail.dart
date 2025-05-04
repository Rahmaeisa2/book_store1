import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  final String image;
  final String title;
  final String author;
  final double price;
  final double oldPrice;
  final double rating;
  final String description;

  const BookDetailsScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.description,
  }) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book details"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.remove, size: 16),
                  SizedBox(width: 8),
                  Text("1"),
                  SizedBox(width: 8),
                  Icon(Icons.add, size: 16),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Add to cart", style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Book image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(widget.image, height: 250, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),

          // Title, Rating
          Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(widget.rating.toString(), style: TextStyle(fontSize: 14)),
              const Text(" (180)"), // ممكن تغير الرقم لاحقًا
            ],
          ),
          const SizedBox(height: 12),

          // Description
          Text(widget.description,
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 12),

          // Price
          Row(
            children: [
              Text("\$${widget.price}",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              Text("\$${widget.oldPrice}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text("In Stock",
                    style: TextStyle(color: Colors.green)),
              )
            ],
          ),
          const SizedBox(height: 12),

          // Discount and Shipping
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text("Discount code: Ne212"),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text("Free Shipping Today"),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Book details section
          const Divider(),
          const Text("Book Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          buildDetailRow("Author", widget.author),
          buildDetailRow("Language", "English"),
          buildDetailRow("Pages", "336"),
          buildDetailRow("Format", "Hard Cover"),
          buildDetailRow("Best Seller Rank", "#3"),
        ],
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$title: ",
              style: const TextStyle(fontWeight: FontWeight.w500)),
          Expanded(child: Text(value, style: const TextStyle(color: Colors.black87))),
        ],
      ),
    );
  }
}
