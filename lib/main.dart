import 'package:flutter/material.dart';

void main() {
  runApp(const EnglishLearningApp());
}

class EnglishLearningApp extends StatelessWidget {
  const EnglishLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Học Tiếng Anh Chuyên Ngành'),
        actions: [
          // Thống kê Streak và Điểm
          Row(
            children: [
              const Icon(Icons.local_fire_department, color: Colors.orange),
              const Text(' 5 Ngày ', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              const Icon(Icons.stars, color: Colors.amber),
              const Text(' 120 XP ', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 15),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Khung hiển thị Trình độ tương đương
            Card(
              color: Colors.blue.shade50,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.g_translate, size: 40, color: Colors.blue),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Trình độ hiện tại của bạn:', style: TextStyle(fontSize: 14)),
                        Text('Tương đương IELTS 5.0 / TOEIC 600', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Lộ trình chuyên ngành hôm nay:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            // Danh sách bài học
            Expanded(
              child: ListView(
                children: [
                  _buildLessonCard('Bài 1: Từ vựng CNTT - Frontend', 'Mục tiêu: 15 phút / ngày', true),
                  _buildLessonCard('Bài 2: Giao tiếp với Khách hàng', 'Chưa mở khóa', false),
                  _buildLessonCard('Bài 3: Viết Email Báo cáo (Report)', 'Chưa mở khóa', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonCard(String title, String subtitle, bool isUnlocked) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          isUnlocked ? Icons.play_circle_fill : Icons.lock,
          color: isUnlocked ? Colors.green : Colors.grey,
          size: 35,
        ),
        title: Text(title, style: TextStyle(fontWeight: isUnlocked ? FontWeight.bold : FontWeight.normal)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: isUnlocked ? () {} : null,
      ),
    );
  }
}
