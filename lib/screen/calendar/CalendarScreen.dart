import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mypal/screen/home/HomeScreen.dart';
import 'package:mypal/theme/appcolor.dart';

class CalendarScreen extends StatefulWidget{
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalenderScreen();
}

class _CalenderScreen extends State<CalendarScreen>{

  DateTime selectedMonth = DateTime.now();
  DateTime? selectedDate;

  void _onMonthChanged(DateTime month){
    setState(() {
      selectedMonth = month;
      selectedDate = null;
    });
  }

  void _onDateSelected(DateTime date){
    setState(() {
      selectedDate = date;
    });
  }

  void _goPrevMonth(){
    setState(() {
      selectedMonth = DateTime(
        selectedMonth.year,
        selectedMonth.month - 1,  
      );
      selectedDate = null;
    });
  }

  void _goNextMonth(){
    setState(() {
      selectedMonth = DateTime(
        selectedMonth.year,
        selectedMonth.month + 1,
      );
      selectedDate = null;
    });
  }

  Future<void> _pickYear() async{
    final selectedYear = await showDialog<int>(
      context: context,
      builder: (context){
        return Dialog(
          child: SizedBox(
            height: 300,
            child: YearPicker(
              firstDate: DateTime(2000), 
              lastDate: DateTime(2100), 
              selectedDate: selectedMonth, 
              onChanged: (date){
                Navigator.pop(context, date.year);
              },
            ),
          ),
        );
      }
    );
    if(selectedYear != null){
      setState(() {
        selectedMonth = DateTime(
          selectedYear,
          selectedMonth.month
        );
        selectedDate = null;
      });
    }
  }


  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Appcolor.lightGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${selectedMonth.month}월 결제 일정', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Appcolor.middleGrey)),
                    Text('${selectedMonth.year}년', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Appcolor.middleGrey),)
                  ],
                ),
              ),
              
              /** 
                _DatePicker(
                month: selectedMonth,
                onPrevMonth: _goPrevMonth,
                onNextMonth: _goNextMonth,
                onYearTap: _pickYear,
              ),
              **/
              const SizedBox(height: 16),

              _Calendar(
                month: selectedMonth,
                selectedDate: selectedDate,
                onDateSelected: _onDateSelected
              ),
              
              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _RecordByDate(selectedDate: selectedDate,),
              ),

              const SizedBox(height: 16),

              _RecordList(),

              const SizedBox(height: 16),
            ],
          ),
          )
        ),
    );
  }
}

// 년 월 선택하고 선택 완료하면 해당 년 월 보여줌
class _DatePicker extends StatelessWidget{
  final DateTime month;
  final VoidCallback onPrevMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onYearTap;

  const _DatePicker({
    required this.month,
    required this.onPrevMonth,
    required this.onNextMonth,
    required this.onYearTap
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
        onPressed: onPrevMonth,
        icon: const Icon(Icons.chevron_left),
        ),

        GestureDetector(
          onTap: onYearTap,
          child: Text(
          '${month.year}년 ${month.month}월',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        ),

        IconButton(
          onPressed: onNextMonth,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
// 선택한 년 월의 달력 보여줌
class _Calendar extends StatelessWidget{
  final DateTime month;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const _Calendar({
    required this.month,
    required this.selectedDate,
    required this.onDateSelected
  });

  @override
  Widget build(BuildContext context) {
    final int year = month.year;
    final int m = month.month;
    final int daysInMonth = DateTime(year, m+1, 0).day;
    final int firstWeekday = DateTime(year, m, 1).weekday;

    final int leadingEmptyDays = firstWeekday - 1;
    final int totalItems = leadingEmptyDays + daysInMonth;

    return CardContainer(
      child: Column(
        children: [
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalItems,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ), 
            itemBuilder: (context, index){
              if(index < leadingEmptyDays){
                return const SizedBox();
              }

            final day = index - leadingEmptyDays + 1;
            final date = DateTime(year, m, day);

            final bool isSelected = 
              selectedDate != null &&
              selectedDate!.year == year &&
              selectedDate!.month == m &&
              selectedDate!.day == day;

              return GestureDetector(
                 onTap: () => onDateSelected(date),
                child: _DayCell(
                  day: day,
                  isSelected: isSelected
                ),
              );
            }
          ),
          SizedBox(height: 20)
        ],
      )   
    );
  }
}
// 선택한 날짜의 기록 보여주기
class _RecordByDate extends StatelessWidget{

  final DateTime? selectedDate;

  const _RecordByDate({required this.selectedDate});

  @override
    Widget build(BuildContext context) {

      if (selectedDate == null) {
      return const Text('날짜를 선택해주세요');
    }

    return Text('${selectedDate!.day}일의 기록');
  }
}
// 날
class _DayCell extends StatelessWidget{
  final int day;
  final bool isSelected;

  const _DayCell({
    required this.day,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isSelected ? Appcolor.primary : null,
          shape: BoxShape.circle
        ),
        alignment: Alignment.center,
        child: Text(
          '$day',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _RecordList extends StatelessWidget{
  
  const _RecordList({super.key});
    
  @override
  Widget build(BuildContext context) {
    final items = [
      ('유튜브 프리미엄', '3일 후 결제', '12000₩'),
      ('어도비', '1일 후 결제', '18000₩'),
      ('버블', '13일 후 결제', '4000₩'),
      ('넷플릭스', '21일 후 결제', '6000₩'),
      ('왓챠', '9일 후 결제', '13000₩'),
    ];

    return CardContainer(
      child: ListView.builder(
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
      )
    );
  }
}