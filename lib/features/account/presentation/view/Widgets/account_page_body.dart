// FILE: lib/features/account/account_page_body.dart
import 'package:egyptian_supermaekat/constant.dart';
import 'package:egyptian_supermaekat/core/style.dart';
import 'package:egyptian_supermaekat/core/theme_color.dart';
import 'package:egyptian_supermaekat/core/utils/app_images.dart';
import 'package:egyptian_supermaekat/core/utils/responsive_helper.dart';
import 'package:egyptian_supermaekat/features/account/presentation/view/Widgets/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountPageBody extends StatelessWidget {
  const AccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ProfileListItem(
          svgPicture: Assets.useraccount,
          text: 'تعديل البيانات',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonalDataPage()),
            );
          },
        ),
        ProfileListItem(
          svgPicture: Assets.messages,
          text: 'الرسائل',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddressesPage()),
            );
          },
        ),
        ProfileListItem(
          svgPicture: Assets.favourite,
          text: 'المفضله',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesPage()),
            );
          },
        ),
        ProfileListItem(
          svgPicture: Assets.notification01,
          text: 'الإشعارات',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ),
            );
          },
        ),
        ProfileListItem(
          svgPicture: Assets.helpsquare,
          text: 'المساعده',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpCenterPage()),
            );
          },
        ),
        ProfileListItem(
          svgPicture: Assets.informationdiamond,
          text: 'من نحن',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WhoAreWePage()),
            );
          },
        ),
        ProfileListItem(
          svgPicture: Assets.global,
          text: 'اللغه',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LanguagePage()),
            );
          },
        ),
        ProfileListItem(
          svgPicture: Assets.group,
          text: 'تسجيل الخروج',
          onTap: () {
            showLogoutDialog(context);
          },
        ),
      ],
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.text,
    required this.svgPicture,
    this.onTap,
    this.trailing,
  });

  final String text;
  final String svgPicture;
  final void Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = ResponsiveHelper.isTablet(context);
          final containerHeight = isTablet ? 60.0 : 48.0;
          final borderRadius = isTablet ? 20.0 : 16.0;

          return InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              width: double.infinity,
              height: containerHeight,
              decoration: BoxDecoration(
                color: ThemeColor.lightGreenBackground,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: trailing ?? SvgPicture.asset(Assets.back),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          text,
                          style: Style.textStyle18.copyWith(
                            fontFamily: cairoRegular,
                          ),
                        ),
                        SizedBox(width: 6),
                        Image.asset(svgPicture, width: 24, height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: _buildAppBar(context, 'البيانات الشخصية'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 24),
            _buildTextField(
              label: 'البريد الإلكتروني',
              hint: '',
              enabled: false,
            ),
            SizedBox(height: 24),
            _buildTextField(
              label: 'الإسم',
              hint: '',
              icon: Icons.edit_outlined,
            ),
            SizedBox(height: 24),
            _buildTextField(
              label: 'رقم الهاتف',
              hint: '',
              icon: Icons.edit_outlined,
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'يمكنك استخدام رقم هاتفك لتسجيل الدخول',
                style: Style.textStyle14.copyWith(
                  fontFamily: cairoRegular,
                  color: ThemeColor.charcoal,
                ),
              ),
            ),
            SizedBox(height: 32),
            _buildListTile(
              icon: Icons.person_outline,
              title: 'حذف الحساب',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? icon,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: Style.textStyle16.copyWith(
            fontFamily: cairoMedium,
            color: ThemeColor.charcoalColor,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: enabled ? ThemeColor.white : ThemeColor.lightGrey,
            border: Border.all(color: ThemeColor.lightBorderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    icon,
                    color: ThemeColor.primaryGreenColor,
                    size: 20,
                  ),
                ),
              Expanded(
                child: TextField(
                  enabled: enabled,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  style: Style.textStyle16.copyWith(fontFamily: cairoRegular),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: _buildAppBar(context, 'العنوان'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _AddressCard(
            title: 'المنزل',
            address:
                'المنصورة , ش قناة السويس\nمستشفي الخير , عمارة 7 , الدور الثالث',
            onEdit: () {},
            onDelete: () {},
          ),
          SizedBox(height: 16),
          _AddressCard(
            title: 'العمل',
            address: 'المنصورة , مدينة مبارك\nعمارة 9 , الدور الخامس',
            onEdit: () {},
            onDelete: () {},
          ),
        ],
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _AddressCard({
    required this.title,
    required this.address,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ThemeColor.lightBorderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outline,
                  color: ThemeColor.primaryGreenColor,
                  size: 24,
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                onPressed: onEdit,
                icon: Icon(
                  Icons.edit_outlined,
                  color: ThemeColor.primaryGreenColor,
                  size: 24,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: Style.textStyle18.copyWith(
                    fontFamily: cairoBold,
                    color: ThemeColor.charcoalColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  address,
                  textAlign: TextAlign.right,
                  style: Style.textStyle14.copyWith(
                    fontFamily: cairoRegular,
                    color: ThemeColor.charcoal,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ThemeColor.lightGrey,
            ),
            child: Icon(
              Icons.map_outlined,
              color: ThemeColor.primaryGreenColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: _buildAppBar(context, 'المفضلة'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 2,
        itemBuilder: (context, index) => _FavoriteProductCard(),
      ),
    );
  }
}

class _FavoriteProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ThemeColor.lightBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  color: ThemeColor.lightGrey,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: ThemeColor.white,
                  child: Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: ThemeColor.primaryGreenColor,
                  child: Icon(Icons.add, color: ThemeColor.white, size: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'طماطم 1 كجم',
                  style: Style.textStyle16.copyWith(fontFamily: cairoMedium),
                ),
                SizedBox(height: 4),
                Text(
                  'حوالي 8 - 12 قطعه',
                  style: Style.textStyle12.copyWith(
                    fontFamily: cairoRegular,
                    color: ThemeColor.charcoal,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4.5',
                          style: Style.textStyle14.copyWith(
                            fontFamily: cairoMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '10 ج.م',
                          style: Style.textStyle16.copyWith(
                            fontFamily: cairoBold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '15.34 ج.م',
                          style: Style.textStyle12.copyWith(
                            fontFamily: cairoRegular,
                            color: ThemeColor.charcoal,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ProfileListItem(
                  text: 'الإشعارات',
                  svgPicture: Assets.notification01,
                  trailing: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Switch(
                      value: _notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          _notificationsEnabled = value;
                        });
                      },
                      activeColor: ThemeColor.primaryGreenColor,
                      activeTrackColor: ThemeColor.primaryGreenColor
                          .withOpacity(0.3),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _notificationsEnabled = !_notificationsEnabled;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'الإعدادات',
            style: Style.textStyle20.copyWith(
              fontFamily: cairoBold,
              color: ThemeColor.charcoalColor,
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_forward_ios, size: 24),
          ),
        ],
      ),
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: _buildAppBar(context, 'مركز المساعدة'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExpandableItem('حول التطبيق'),
          SizedBox(height: 16),
          _buildExpandableItem('استخدام بطاقات الائتمان'),
          SizedBox(height: 16),
          _buildExpandableItem('تعديل الشروط والأحكام'),
          SizedBox(height: 32),
          _buildSocialMediaSection(),
        ],
      ),
    );
  }

  Widget _buildExpandableItem(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: ThemeColor.lightGreenBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.keyboard_arrow_down, size: 24),
          Text(
            title,
            style: Style.textStyle16.copyWith(
              fontFamily: cairoMedium,
              color: ThemeColor.charcoalColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(
              'https://www.linkedin.com/in/ahmed-abdelkrim166/',
              Icons.work_outline,
            ),
            SizedBox(width: 24),
            _buildSocialIcon(
              'https://www.instagram.com/ahmed_abdelkarim6/',
              Icons.camera_alt_outlined,
            ),
            SizedBox(width: 24),
            _buildSocialIcon(
              'https://www.facebook.com/ahmed85814A',
              Icons.facebook_outlined,
            ),
            SizedBox(width: 24),
            _buildSocialIcon(
              'https://github.com/ahmedabdelkrim125',
              Icons.code,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String url, IconData icon) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: ThemeColor.charcoalColor,
        child: Icon(icon, color: ThemeColor.white, size: 24),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }
}

class WhoAreWePage extends StatelessWidget {
  const WhoAreWePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: _buildAppBar(context, 'من نحن'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'من نحن',
              style: Style.textStyle20.copyWith(
                fontFamily: cairoBold,
                color: ThemeColor.charcoalColor,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'نحن تطبيق سوبرماركت مصري يهدف إلى توفير أفضل المنتجات بأسعار تنافسية. نسعى دائماً لتقديم خدمة متميزة لعملائنا الكرام.',
              textAlign: TextAlign.right,
              style: Style.textStyle16.copyWith(
                fontFamily: cairoRegular,
                color: ThemeColor.charcoal,
                height: 1.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedLanguage = 'العربية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: _buildAppBar(context, 'اللغة'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildLanguageOption('العربية'),
            SizedBox(height: 16),
            _buildLanguageOption('English'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    final isSelected = _selectedLanguage == language;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? ThemeColor.primaryGreenColor.withOpacity(0.1)
              : ThemeColor.lightGreenBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? ThemeColor.primaryGreenColor
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: ThemeColor.primaryGreenColor,
                size: 24,
              )
            else
              SizedBox(width: 24),
            Text(
              language,
              style: Style.textStyle16.copyWith(
                fontFamily: cairoMedium,
                color: isSelected
                    ? ThemeColor.primaryGreenColor
                    : ThemeColor.charcoalColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginRecordPage extends StatelessWidget {
  const LoginRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: _buildAppBar(context, 'تسجيل الدخول'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.login_outlined,
                size: 80,
                color: ThemeColor.primaryGreenColor,
              ),
              SizedBox(height: 24),
              Text(
                'سجل دخولك',
                style: Style.textStyle20.copyWith(
                  fontFamily: cairoBold,
                  color: ThemeColor.charcoalColor,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'يمكنك تسجيل الدخول باستخدام البريد الإلكتروني أو رقم الهاتف',
                textAlign: TextAlign.center,
                style: Style.textStyle16.copyWith(
                  fontFamily: cairoRegular,
                  color: ThemeColor.charcoal,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: ThemeColor.white,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.arrow_back_ios,
        color: ThemeColor.charcoalColor,
        size: 24,
      ),
    ),
    title: Text(
      title,
      style: Style.textStyle18.copyWith(
        fontFamily: cairoBold,
        color: ThemeColor.charcoalColor,
      ),
    ),
  );
}

Widget _buildListTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: ThemeColor.lightGreenBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_ios, size: 20),
          Row(
            children: [
              Text(
                title,
                style: Style.textStyle16.copyWith(
                  fontFamily: cairoMedium,
                  color: ThemeColor.charcoalColor,
                ),
              ),
              SizedBox(width: 12),
              Icon(icon, size: 24, color: ThemeColor.primaryGreenColor),
            ],
          ),
        ],
      ),
    ),
  );
}
