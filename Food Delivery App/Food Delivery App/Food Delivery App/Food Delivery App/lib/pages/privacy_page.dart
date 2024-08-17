import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bảo mật và quyền riêng tư",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPrivacyItem(
            context,
            title: "Chính sách bảo mật",
            icon: Icons.privacy_tip,
            onTap: () {
              _showDetailPage(context, "Chính sách bảo mật", "Nội dung của chính sách bảo mật...");
            },
          ),
          _buildPrivacyItem(
            context,
            title: "Điều khoản sử dụng",
            icon: Icons.description,
            onTap: () {
              _showDetailPage(context, "Điều khoản sử dụng", "Nội dung của điều khoản sử dụng...");
            },
          ),
          _buildPrivacyItem(
            context,
            title: "Quyền truy cập dữ liệu",
            icon: Icons.data_usage,
            onTap: () {
              _showDetailPage(context, "Quyền truy cập dữ liệu", "Nội dung của quyền truy cập dữ liệu...");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyItem(BuildContext context, {required String title, required IconData icon, VoidCallback? onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  void _showDetailPage(BuildContext context, String title, String content) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(title: title, content: content),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String content;

  const DetailPage({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
