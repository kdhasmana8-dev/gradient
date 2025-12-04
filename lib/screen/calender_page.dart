import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAvailableDatePage extends StatefulWidget {
  final String priceText;
  final String initialRangeText;

  const BookAvailableDatePage({
    super.key,
    required this.priceText,
    required this.initialRangeText,
  });

  @override
  State<BookAvailableDatePage> createState() => _BookAvailableDatePageState();
}

class _BookAvailableDatePageState extends State<BookAvailableDatePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;

  @override
  void initState() {
    super.initState();
    _rangeStart = DateTime.now();
    _rangeEnd = DateTime.now().add(const Duration(days: 1));
    _rangeSelectionMode = RangeSelectionMode.toggledOn;
  }

  // Glass Effect Decoration
  BoxDecoration glassDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF0F1528),
          Color(0xFF101A36),
          Color(0xFF12264E),
          Color(0xFF153566),
          Color(0xFF1C4E93),
          Color(0xFF2E6DE8), // bright glow bottom
        ],
        stops: [0.0, 0.15, 0.35, 0.55, 0.75, 1.0],
      ),
        borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white.withOpacity(0.06)),
    );
  }

  // Header Bar
  Widget headerBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Row(children: [
              Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.white),
              SizedBox(width: 4),
              Text("Back", style: TextStyle(color: Colors.white, fontSize: 14)),
            ]),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _rangeStart = null;
                _rangeEnd = null;
                _rangeSelectionMode = RangeSelectionMode.toggledOff;
              });
            },
            child: const Text(
              "Cancel date",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Week Day Row
  Widget weekDayRow() {
    final days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days
            .map((d) => Text(
          d,
          style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ))
            .toList(),
      ),
    );
  }

  // Custom Day Tile
// Custom Day Tile — Square Curved Modern Style
  Widget dayBuilder(BuildContext context, DateTime day, DateTime focusedDay) {
    final bool isWithinRange = (_rangeStart != null &&
        _rangeEnd != null &&
        day.isAfter(_rangeStart!.subtract(const Duration(days: 1))) &&
        day.isBefore(_rangeEnd!.add(const Duration(days: 1))));

    final bool isStart = isSameDay(day, _rangeStart);
    final bool isEnd = isSameDay(day, _rangeEnd);

    bool isToday = isSameDay(day, DateTime.now());

    Color textColor = Colors.white.withOpacity(0.85);

    // Hide days from previous/next month
    if (day.month != _focusedDay.month) {
      return const SizedBox.shrink();
    }

    // 🔵 START / END DATE (Gradient Square-Round)
    if (isStart || isEnd) {
      return Container(
        alignment: Alignment.center,
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Color(0xFF3AA0FF), Color(0xFF7B66FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          "${day.day}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    // 🔹 RANGE MIDDLE (Glass Square)
    if (isWithinRange) {
      return Container(
        alignment: Alignment.center,
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.06),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Text(
          "${day.day}",
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
      );
    }

    // 🔸 TODAY (Highlight Border)
    if (isToday) {
      return Container(
        alignment: Alignment.center,
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.cyanAccent.withOpacity(0.4), width: 1.8),
        ),
        child: Text(
          "${day.day}",
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    // Default – simple square curved
    return Container(
      alignment: Alignment.center,
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text("${day.day}", style: TextStyle(color: textColor)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1220),
      body: SafeArea(
        child: Stack(
          children: [
            // Background Glow
            Positioned(
              top: -100,
              right: -40,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF3E5BFF).withOpacity(0.35),
                      const Color(0xFF1C56C5).withOpacity(0.10),
                      Colors.transparent,
                    ],
                    radius: 0.85,
                  ),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerBar(),

                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("2-night stay",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text("Mon, Oct 24 - Wed, Oct 26",
                          style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                weekDayRow(),
                const SizedBox(height: 8),

                // Calendar Container
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: glassDecoration(),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  "${_focusedDay.monthName} ${_focusedDay.year}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              Expanded(
                                child: TableCalendar(
                                  headerVisible: false,
                                  firstDay: DateTime.utc(2020, 1, 1),
                                  lastDay: DateTime.utc(2030, 12, 31),
                                  focusedDay: _focusedDay,
                                  calendarFormat: CalendarFormat.month,

                                  // IMPORTANT FIX ✔
                                  selectedDayPredicate: (day) =>
                                  isSameDay(day, _rangeStart) ||
                                      isSameDay(day, _rangeEnd),

                                  rangeStartDay: _rangeStart,
                                  rangeEndDay: _rangeEnd,
                                  rangeSelectionMode: _rangeSelectionMode,

                                  calendarStyle: const CalendarStyle(
                                    outsideDaysVisible: false,
                                  ),

                                  // USER TAPS A SINGLE DATE
                                  onDaySelected: (selectedDay, focusedDay) {
                                    setState(() {
                                      _focusedDay = focusedDay;

                                      if (_rangeStart == null || _rangeEnd != null) {
                                        // Start new range
                                        _rangeStart = selectedDay;
                                        _rangeEnd = null;
                                        _rangeSelectionMode =
                                            RangeSelectionMode.toggledOn;
                                      } else {
                                        // Finish range
                                        if (selectedDay.isAfter(_rangeStart!)) {
                                          _rangeEnd = selectedDay;
                                        } else {
                                          // If tapped before start, swap
                                          _rangeEnd = _rangeStart;
                                          _rangeStart = selectedDay;
                                        }
                                      }
                                    });
                                  },

                                  // USER DRAGS ACROSS DAYS
                                  onRangeSelected: (start, end, focusedDay) {
                                    setState(() {
                                      _rangeStart = start;
                                      _rangeEnd = end;
                                      _focusedDay = focusedDay;
                                      _rangeSelectionMode =
                                          RangeSelectionMode.toggledOn;
                                    });
                                  },

                                  calendarBuilders: CalendarBuilders(
                                    defaultBuilder: dayBuilder,
                                    todayBuilder: (context, day, focusedDay) => Container(
                                      alignment: Alignment.center,
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white24),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text("${day.day}",
                                          style: const TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),



                              // Month Switch Buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _focusedDay =
                                            DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
                                      });
                                    },
                                    child: const Icon(Icons.chevron_left,
                                        color: Colors.white, size: 28),
                                  ),
                                  const SizedBox(width: 40),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _focusedDay =
                                            DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
                                      });
                                    },
                                    child: const Icon(Icons.chevron_right,
                                        color: Colors.white, size: 28),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Bottom Bar
                Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.45),
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(22)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.priceText,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    size: 14, color: Colors.cyanAccent),
                                const SizedBox(width: 8),
                                Text(
                                  _rangeStart != null && _rangeEnd != null
                                      ? "${_rangeStart!.monthName} ${_rangeStart!.day} - ${_rangeEnd!.monthName} ${_rangeEnd!.day}"
                                      : widget.initialRangeText,
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF3AA0FF),
                                Color(0xFF7B66FF)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.arrow_forward,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Month Name Extension
extension DateTimeHelpers on DateTime {
  String get monthName {
    const mn = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return mn[month];
  }
}
