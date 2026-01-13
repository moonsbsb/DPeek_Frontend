import 'package:flutter/material.dart';
import 'package:mypal/theme/AppColor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ManagementDetailScreen.dart';

class ManagementScreen extends StatelessWidget{
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.lightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('내 구독관리', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Appcolor.darkGrey)),
                        Text('총 5개 구독 중', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Appcolor.darkGrey)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ManagemeneDetailScreen()),
                        );
                      },
                      child: Padding( 
                        padding: const EdgeInsets.all(8), 
                        child: SvgPicture.asset(
                          'assets/images/add_btn.svg',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              _CardContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('구독중'),
                    Text('중지됨')
                  ],
                )
              ),

              SizedBox(height: 15),

              _SubscriptionList(),

              SizedBox(height: 15),
            ],
          )
        )
      ),
    );
  }
}

class _SubscriptionList extends StatelessWidget {
  const _SubscriptionList();

  @override
  Widget build(BuildContext context) {
    final items = [
      ('유튜브 프리미엄', '3일 후 결제', '12000₩', '50개월', '12,000,000'),
      ('어도비', '1일 후 결제', '18000₩', '12개월', '100,000'),
      ('버블', '13일 후 결제', '4000₩', '5개월', '420,000'),
      ('넷플릭스', '21일 후 결제', '6000₩', '8개월', '3,050,000'),
      ('왓챠', '9일 후 결제', '13000₩', '26개월', '1,030,000'),
    ];

    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
      final item = items[index];

      return Column(
         children: [
          _CardContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Text(item.$1,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Appcolor.darkGrey),),

                    const SizedBox(height: 6),

                    // 결제 정보
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.$2,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Appcolor.middleGrey),),
                        Text(item.$3,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Appcolor.inactiveNav),),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _StatBox(
                            title: '이용기간',
                            value: item.$4,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatBox(
                            title: '누적지출',
                            value: item.$5,
                          ),
                        ),
                      ],
                    ),
                  ],   
                ),  
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },       
    );
  }
}

class _StatBox extends StatelessWidget {
  final String title;
  final String value;

  const _StatBox({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Appcolor.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Appcolor.middleGrey),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Appcolor.darkGrey),
          ),
        ],
      ),
    );
  }
}
class _CardContainer extends StatelessWidget {
  final Widget child;
  const _CardContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}