import 'package:flutter/material.dart';
import 'package:mypal/theme/AppColor.dart';
import 'package:fl_chart/fl_chart.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.subPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _HeaderSection(),
              SizedBox(height: 16),
              _SpendAnalysisCard(),
              SizedBox(height: 16),
              _ExpectedPaymentCard(),
              SizedBox(height: 16),
            ],
          ),
        )
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 60, 24, 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Appcolor.primary,
            Appcolor.subPrimary
          ],
          stops: [
            0.65,
            1.0
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            '이번달 총 구독료', 
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Appcolor.darkGrey)
          ),
          Text(
            '92,000 ₩',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Appcolor.darkGrey),
          ),
          Text(
            '총 5개 구독 중', 
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Appcolor.middleGrey),
          ),
        ],
      ),
    );
  }
}

class _SpendAnalysisCard extends StatelessWidget {
  const _SpendAnalysisCard();

  @override
  Widget build(BuildContext context) {
    return _CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('지출 분석', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Appcolor.middleGrey)),

          Row(
            children: [
              Expanded(
                flex: 3,
                child: AspectRatio(
                  aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 35,
                        sections: [
                          PieChartSectionData(value: 20, color: Colors.blue),
                          PieChartSectionData(value: 30, color: Colors.red),
                          PieChartSectionData(value: 25, color: Colors.green),
                          PieChartSectionData(value: 15, color: Colors.orange),
                        ]
                      )
                    ),
                  ),
                ),
              Expanded(
                flex: 2,
                child: _LegendList(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _LegendList extends StatelessWidget {
  const _LegendList();

  @override
  Widget build(BuildContext context) {
    final items = [
      ('유튜브 프리미엄', Colors.blue),
      ('어도비', Colors.red),
      ('버블', Colors.orange),
      ('넷플릭스', Colors.green),
      ('왓챠', Colors.redAccent),
    ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: items
      .map(
        (item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration:
                  BoxDecoration(color: item.$2, shape: BoxShape.circle),
                ),
              SizedBox(width: 5),
              Text(item.$1, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Appcolor.darkGrey)),
            ],
          ),
        ),
      )
      .toList(),
    );
  }
}

class _ExpectedPaymentCard extends StatelessWidget {
  const _ExpectedPaymentCard();

  @override
  Widget build(BuildContext context) {
    final items = [
      ('유튜브 프리미엄', '3일 후 결제', '12000₩'),
      ('어도비', '1일 후 결제', '18000₩'),
      ('버블', '13일 후 결제', '4000₩'),
      ('넷플릭스', '21일 후 결제', '6000₩'),
      ('왓챠', '9일 후 결제', '13000₩'),
    ];

    return _CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('예정된 결제', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Appcolor.middleGrey)),
          SizedBox(height: 16),
          ListView.builder( 
            itemCount: items.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              final item = items[index];
              
              return Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.$1, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Appcolor.darkGrey)),
                        Text(item.$2, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Appcolor.middleGrey)),
                      ],
                    ),
                    Text(item.$3, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Appcolor.darkGrey)),
                  ],
                ),
              );
            }
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
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}


