import 'package:flutter/material.dart';
import 'package:gravito/screens/LoginScreen.dart';

import 'NotificationPermissionScreen.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<TutorialPageData> _titles = [
    const TutorialPageData(
      imagePath: 'asset/images/image1.png',
      title: 'Welcome to Gravito',
    ),
    const TutorialPageData(
      imagePath: 'asset/images/image1.png',
      title: 'Welcome to Gravito',
    ),
    const TutorialPageData(
      imagePath: 'asset/images/image1.png',
      title: 'Welcome to Gravito',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text("Skip", style: TextStyle(color: Colors.green)),
              ),
            ),
          ),
          const SizedBox(height: 35),

          // PageView
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              children: _titles
                  .map(
                    (title) => Center(
                      child: Column(
                        children: [
                          Image.asset(
                            title.imagePath,
                            width: double.infinity,
                            height: 275,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(height: 60),
                          Text(
                            title.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          // Page indicator or button example
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 40.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous button: visible only if current page > 0
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    child: const Text(
                      "Previous",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                Expanded(child: SizedBox(width: double.infinity)),

                // Next button: visible only if current page < last index
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _titles.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Notificationpermissionscreen(),
                      //   ),
                      // );

                      showModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        enableDrag: true,

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return NotificationPermissionBottomSheet();
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TutorialPageData {
  final String imagePath;
  final String title;

  const TutorialPageData({required this.imagePath, required this.title});
}
