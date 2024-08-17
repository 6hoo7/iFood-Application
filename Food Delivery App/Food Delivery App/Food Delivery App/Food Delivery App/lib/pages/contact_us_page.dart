import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Liên hệ với chúng tôi",
          style: TextStyle(
            fontSize: 20, // Tăng kích thước chữ
            fontWeight: FontWeight.bold, // Làm chữ đậm
          ),
         ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Liên hệ giao đồ ăn",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              "Nếu có thắc mắc trong quá trình sử dụng dịch vụ của IFood, vui lòng liên hệ:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24.0),
            _buildContactInfo(
              context,
              "Đường dây nóng chăm sóc khách hàng giao đồ ăn",
              "Hotline: 1900.638.058",
              "minh.vcm1999@gmail.com",
              "https://www.facebook.com/profile.php?id=100050154407860&mibextid=ZbWKwL",
            ),
            const SizedBox(height: 24.0),
            _buildContactInfo(
              context,
              "Đường dây nóng hỗ trợ của IFood",
              "Hotline: 1900.633.070",
            ),
            const SizedBox(height: 24.0),
            _buildContactInfo(
              context,
              "Đường dây nóng hỗ trợ đối tác cửa hàng",
              "Hotline: 1900.636.075",
            ),
            const SizedBox(height: 32.0),
            Center(
              child: Column(
                children: [
                  Text(
                    "IFood rất hân hạnh được phục vụ quý khách.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "IFood biết bạn có nhiều lựa chọn. Cảm ơn bạn đã lựa chọn IFood của chúng tôi!",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(
      BuildContext context, String title, String hotline,
      [String? email, String? facebookUrl]) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8.0),
                Text(
                  hotline,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            if (email != null) ...[
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.email, color: Colors.blue),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => _launchUrl('mailto:$email'),
                    child: Text(
                      email,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
            if (facebookUrl != null) ...[
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.facebook, color: Colors.blue),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => _launchUrl(facebookUrl),
                    child: Text(
                      "Facebook",
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
