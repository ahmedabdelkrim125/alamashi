import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

// ============================================================================
// Models
// ============================================================================

class OrderModel {
  final String id;
  final String price;
  final String paymentStatus;
  final int productsCount;
  final String date;
  final String orderStatus;
  final Color statusColor;

  const OrderModel({
    required this.id,
    required this.price,
    required this.paymentStatus,
    required this.productsCount,
    required this.date,
    required this.orderStatus,
    required this.statusColor,
  });
}

enum OrderFilter {
  showMore('عرض المزيد'),
  thisMonth('هذا الشهر'),
  lastMonth('الشهر الماضي'),
  lastThreeMonths('آخر 3 أشهر');

  final String label;
  const OrderFilter(this.label);
}

// ============================================================================
// Main Page
// ============================================================================

class OrdersPageBody extends StatefulWidget {
  const OrdersPageBody({super.key});

  @override
  State<OrdersPageBody> createState() => _OrdersPageBodyState();
}

class _OrdersPageBodyState extends State<OrdersPageBody> {
  OrderFilter _selectedFilter = OrderFilter.showMore;

  List<OrderModel> get _orders => List.generate(
    10,
    (index) => OrderModel(
      id: '#D836fa3',
      price: '١٨٠ ج.م',
      paymentStatus: 'تم الدفع',
      productsCount: 5,
      date: '٢٧ أغسطس ٢٠٢٥ ،٦:٤٧م',
      orderStatus: index % 3 == 0 ? 'يتم تجهيز' : 'تم الاستلام',
      statusColor: index % 3 == 0
          ? ThemeColor.orangeAccentColor
          : ThemeColor.primaryGreenColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 50)),
        _buildHeader(),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        _buildFilterSection(),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        _buildOrdersList(),
      ],
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الطلبات',
              style: Style.textStyle16.copyWith(
                color: ThemeColor.charcoalColor,
                fontFamily: cairoMedium,
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                Assets.chevronRight,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _FilterDropdown(
              selectedFilter: _selectedFilter,
              onFilterChanged: (filter) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
            ),
            Text(
              'هذا الشهر',
              style: Style.textStyle16.copyWith(
                color: ThemeColor.charcoalColor,
                fontFamily: cairoMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: OrderCard(order: _orders[index]),
          ),
          childCount: _orders.length,
        ),
      ),
    );
  }
}

// ============================================================================
// Filter Dropdown Widget
// ============================================================================

class _FilterDropdown extends StatelessWidget {
  final OrderFilter selectedFilter;
  final ValueChanged<OrderFilter> onFilterChanged;

  const _FilterDropdown({
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<OrderFilter>(
      initialValue: selectedFilter,
      onSelected: onFilterChanged,
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: ThemeColor.white,
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: ThemeColor.lightGreenBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ThemeColor.primaryGreenColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check, color: ThemeColor.primaryGreenColor, size: 20),
            SizedBox(width: 8),
            Text(
              selectedFilter.label,
              style: Style.textStyle14.copyWith(
                color: ThemeColor.primaryGreenColor,
                fontFamily: cairoMedium,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: ThemeColor.primaryGreenColor,
              size: 20,
            ),
          ],
        ),
      ),
      itemBuilder: (context) => OrderFilter.values
          .map(
            (filter) => PopupMenuItem<OrderFilter>(
              value: filter,
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: selectedFilter == filter
                        ? ThemeColor.primaryGreenColor
                        : Colors.transparent,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    filter.label,
                    style: Style.textStyle14.copyWith(
                      color: selectedFilter == filter
                          ? ThemeColor.primaryGreenColor
                          : ThemeColor.charcoalColor,
                      fontFamily: selectedFilter == filter
                          ? cairoSemiBold
                          : cairoMedium,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

// ============================================================================
// Order Card Widget
// ============================================================================

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeColor.lightGreenBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ThemeColor.charcoalColor.withOpacity(.08),
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildOrderHeader(),
          SizedBox(height: 12),
          _buildOrderInfo(),
          SizedBox(height: 16),
          _buildOrderActions(),
        ],
      ),
    );
  }

  Widget _buildOrderHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.price,
              style: Style.textStyle18.copyWith(
                fontFamily: cairoBold,
                color: ThemeColor.charcoalColor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              order.paymentStatus,
              style: Style.textStyle14.copyWith(
                fontFamily: cairoMedium,
                color: ThemeColor.charcoal,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '${order.productsCount} منتجات',
              style: Style.textStyle14.copyWith(
                fontFamily: cairoMedium,
                color: ThemeColor.charcoal,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'رقم الطلب : ${order.id}',
              style: Style.textStyle14.copyWith(
                fontFamily: cairoMedium,
                color: ThemeColor.charcoalColor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'التاريخ : ${order.date}',
              style: Style.textStyle12.copyWith(
                fontFamily: cairoMedium,
                color: ThemeColor.charcoal,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: ThemeColor.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                order.orderStatus,
                style: Style.textStyle14.copyWith(
                  fontFamily: cairoMedium,
                  color: order.statusColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 18,
            color: ThemeColor.charcoal,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'العنوان : المنصور - ش قناة السويس',
              style: Style.textStyle14.copyWith(
                fontFamily: cairoMedium,
                color: ThemeColor.charcoal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderActions() {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            text: 'أضف مراجعة',
            onPressed: () {},
            isOutlined: true,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            text: 'إعادة الطلب',
            onPressed: () {},
            isOutlined: false,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// Action Button Widget
// ============================================================================

class _ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  const _ActionButton({
    required this.text,
    required this.onPressed,
    required this.isOutlined,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);

    if (isOutlined) {
      return Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: Border.all(
                color: ThemeColor.primaryGreenColor,
                width: 1.5,
              ),
              color: Colors.transparent,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: Style.textStyle16.copyWith(
                fontFamily: cairoSemiBold,
                color: ThemeColor.textColor,
              ),
            ),
          ),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ThemeColor.primaryGreenColor, ThemeColor.forestGreenColor],
          ),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: Text(
              text,
              style: Style.textStyle16.copyWith(
                fontFamily: cairoSemiBold,
                color: ThemeColor.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
