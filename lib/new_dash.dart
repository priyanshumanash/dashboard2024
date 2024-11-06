
import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentDashboardApp());
}

class PaymentDashboardApp extends StatelessWidget {
  const PaymentDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unified Payment Dashboard',
      theme: ThemeData(
        primaryColor: const Color(0xFF3A4D6A),
        scaffoldBackgroundColor: const Color(0xFFE8EAF6),
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF00C853),
        ),
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<DashboardItem> items = [
    DashboardItem("Mobile", Icons.mobile_friendly, const Color(0xFF3A4D6A)),
    DashboardItem("DTH", Icons.data_thresholding, const Color(0xFF3A4D6A)),
    DashboardItem("DMT", Icons.money, const Color(0xFF3A4D6A)),
    DashboardItem("AEPS", Icons.insert_drive_file_sharp, const Color(0xFF3A4D6A)),
    DashboardItem("Gas", Icons.gas_meter, const Color(0xFF3A4D6A)),
    DashboardItem("Payments", Icons.payment, const Color(0xFF3A4D6A)),
    DashboardItem("Bill Payments", Icons.receipt, const Color(0xFF3A4D6A)),
    DashboardItem("Recharge", Icons.phone_android, const Color(0xFF3A4D6A)),
    DashboardItem("Shopping", Icons.shopping_cart, const Color(0xFF3A4D6A)),
    DashboardItem("Offers", Icons.local_offer, const Color(0xFF3A4D6A)),
    DashboardItem("Wallet", Icons.account_balance_wallet, const Color(0xFF3A4D6A)),
    DashboardItem("History", Icons.history, const Color(0xFF3A4D6A)),
    DashboardItem("Profile", Icons.person, const Color(0xFF3A4D6A)),
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardHeight = screenWidth < 600 ? 70 : 90;
    double iconSize = screenWidth < 600 ? 24 : 30;
    double textSize = screenWidth < 600 ? 12 : 16;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search, color: Color(0xFFB0BEC5)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth < 600 ? 3 : 7,
                crossAxisSpacing: 14,
                mainAxisSpacing: 16,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return DashboardCard(
                  item: items[index],
                  cardHeight: cardHeight,
                  iconSize: iconSize,
                  textSize: textSize,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: "Wallet"),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner, size: 45), label: "Scanner"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: "Rewards"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatbotScreen()),
          );
        },
        backgroundColor: const Color(0xFF3A4D6A),
        tooltip: "Open Chatbot",
        child: const Icon(Icons.chat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3A4D6A), Color(0xFF1C1C1C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Align(
          alignment: Alignment.center, // Center the AppBar
          child: Container(
            width: 800, // Set your desired width here
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(
                "DASHBOARD",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6.5,
                  color: Colors.white,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Sign in"),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: InputDecoration(hintText: "Email"),
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: "Password"),
                              obscureText: true,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Sign In"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {},
                ),
              ],
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;

  DashboardItem(this.title, this.icon, this.color);
}

class DashboardCard extends StatelessWidget {
  final DashboardItem item;
  final double cardHeight;
  final double iconSize;
  final double textSize;

  const DashboardCard({
    super.key,
    required this.item,
    required this.cardHeight,
    required this.iconSize,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 6,
      shadowColor: item.color.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Container(
          height: cardHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [item.color.withOpacity(0.1), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: iconSize * 0.75,
                backgroundColor: item.color.withOpacity(0.2),
                child: Icon(item.icon, color: item.color, size: iconSize),
              ),
              const SizedBox(height: 10),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Chatbot Screen
class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final List<String> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chatbot"),
        backgroundColor: const Color(0xFF3A4D6A),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}