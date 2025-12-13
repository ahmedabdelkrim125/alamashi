import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/core/widgets/responsive_app_bar.dart';
import 'package:egyptian_supermaekat/core/widgets/responsive_button.dart';
import 'package:egyptian_supermaekat/core/widgets/responsive_container.dart';
import 'package:egyptian_supermaekat/core/widgets/responsive_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A sample responsive screen demonstrating the usage of all responsive components
class SampleResponsiveScreen extends StatelessWidget {
  const SampleResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ResponsiveAppBar(title: 'Responsive Sample'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Responsive container with text
                ResponsiveContainer(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  child: const Text(
                    'This is a responsive container that uses MediaQuery for layout '
                    'and ScreenUtil for font sizing.',
                    textAlign: TextAlign.center,
                  ),
                ),

                // Responsive grid example
                ResponsiveGrid(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: List.generate(
                    6,
                    (index) => ResponsiveGridItem(
                      child: Container(
                        color: Colors.green.withOpacity(0.3),
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                // Responsive button example
                ResponsiveButton(
                  onPressed: () {
                    // Handle button press
                  },
                  text: 'Responsive Button',
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                ),

                SizedBox(height: 24),

                // Device info display
                ResponsiveContainer(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(16),
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    children: [
                      Text(
                        'Device Information',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Device Type: ${ResponsiveHelper.deviceType(context)}',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Text(
                        'Screen Width: ${MediaQuery.of(context).size.width.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Text(
                        'Screen Height: ${MediaQuery.of(context).size.height.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
