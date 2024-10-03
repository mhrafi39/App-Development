import 'package:gstore_official/features/shop/screens/footer/widgets/contact_section.dart';
import 'package:gstore_official/features/shop/screens/footer/widgets/policy_text.dart';
import 'package:gstore_official/features/shop/screens/footer/widgets/section_heading.dart';
import 'package:gstore_official/features/shop/screens/footer/widgets/social_section.dart';
import 'package:flutter/material.dart';

class THomeFooter extends StatelessWidget {
  const THomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeading(
                      title: 'Information',
                      textColor: Colors.white,
                    ),
                    PolicyText(
                        title: 'G-Store', textColor: Colors.white),
                    PolicyText(
                        title: 'Contact for cooperation', textColor: Colors.white),
                    PolicyText(title: 'Facebook', textColor: Colors.white),
                    PolicyText(title: 'Instagram', textColor: Colors.white),
                    PolicyText(title: 'Twitter', textColor: Colors.white),
                    PolicyText(title: 'Tiktok', textColor: Colors.white),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeading(
                      title: 'Policy',
                      textColor: Colors.white,
                    ),
                    PolicyText(
                        title: 'Earn Membership points', textColor: Colors.white),
                    PolicyText(
                        title: 'Delivery & Payments',
                        textColor: Colors.white),
                    PolicyText(
                        title: 'Wholesale & Collaborate Policy',
                        textColor: Colors.white),
                    PolicyText(
                        title: 'Usages Instructions', textColor: Colors.white),
                    PolicyText(
                        title: 'Warranty & Returns', textColor: Colors.white),
                    PolicyText(
                        title: 'KOL & KOC Collaboration', textColor: Colors.white),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: ContactSection()),
              SizedBox(width: 20),
              Expanded(child: SocialSection()),
            ],
          ),
        ],
      ),
    );
  }
}
