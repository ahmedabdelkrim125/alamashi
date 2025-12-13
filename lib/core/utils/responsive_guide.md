# Responsive Design Guide

This guide explains how to implement responsive design in the Egyptian Supermarket app using MediaQuery for layouts and ScreenUtil for fonts.

## Approach

1. **MediaQuery for Layouts**: Use MediaQuery for all layout-related dimensions (width, height, padding, margins, etc.)
2. **ScreenUtil for Fonts**: Use ScreenUtil exclusively for font sizing
3. **ResponsiveHelper Utility**: Use the ResponsiveHelper class for device detection and responsive values

## Implementation Details

### 1. Device Detection

```dart
// Check device type
bool isMobile = ResponsiveHelper.isMobile(context);
bool isTablet = ResponsiveHelper.isTablet(context);
bool isDesktop = ResponsiveHelper.isDesktop(context);

// Get device type as string
String deviceType = ResponsiveHelper.deviceType(context);
```

### 2. Responsive Layouts with MediaQuery

```dart
// Get screen dimensions
double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;

// Use breakpoints for responsive layouts
Widget build(BuildContext context) {
  final isTablet = ResponsiveHelper.isTablet(context);
  
  return Container(
    width: isTablet ? screenWidth * 0.8 : screenWidth * 0.9,
    height: isTablet ? screenHeight * 0.5 : screenHeight * 0.4,
    padding: ResponsiveHelper.getPadding(context),
    child: YourContentWidget(),
  );
}
```

### 3. Font Sizing with ScreenUtil

```dart
// Use ScreenUtil for all font sizes
Text(
  'Your text here',
  style: TextStyle(
    fontSize: 16.sp, // ScreenUtil extension
  ),
)

// For responsive font sizing, combine with multipliers
Text(
  'Your text here',
  style: TextStyle(
    fontSize: 16.sp * (ResponsiveHelper.isTablet(context) ? 1.2 : 1.0),
  ),
)
```

### 4. Using Responsive Components

```dart
// Using the ResponsiveContainer widget
ResponsiveContainer(
  margin: EdgeInsets.all(16.w), // Still using ScreenUtil for specific values
  padding: EdgeInsets.symmetric(vertical: 8.h),
  child: ResponsiveText(
    'Hello World',
    style: TextStyle(
      fontSize: 18.sp, // ScreenUtil for font size
    ),
    fontSizeMultiplier: ResponsiveHelper.isTablet(context) ? 1.2 : 1.0,
  ),
)
```

## Best Practices

1. **Always use MediaQuery for layout dimensions**: width, height, padding, margins, spacing
2. **Always use ScreenUtil for font sizes**: fontSize property in TextStyle
3. **Use ResponsiveHelper for consistent breakpoints**: Don't hardcode breakpoint values
4. **Test on multiple screen sizes**: Verify layouts on mobile, tablet, and desktop
5. **Combine approaches when needed**: Use both MediaQuery and ScreenUtil in the same widget when appropriate

## Example Implementation

```dart
class ProductCard extends StatelessWidget {
  final Product product;
  
  const ProductCard({Key? key, required this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Layout with MediaQuery
    final cardWidth = MediaQuery.of(context).size.width * 0.45;
    final cardHeight = cardWidth * 1.2;
    
    // Font sizing with ScreenUtil
    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.all(8.r), // ScreenUtil for specific spacing values
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        // ... other decoration
      ),
      child: Column(
        children: [
          // Image takes 70% of card height
          Container(
            height: cardHeight * 0.7,
            // ... image widget
          ),
          // Text section
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 16.sp, // ScreenUtil for font size
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h), // ScreenUtil for specific spacing
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 14.sp, // ScreenUtil for font size
                    color: Colors.green,
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
```