import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<_SalesData> data = [
    _SalesData('Sun', 135),
    _SalesData('Mon', 128),
    _SalesData('Tue', 90),
    _SalesData('Wed', 142),
    _SalesData('Thurs', 200),
    _SalesData('Fri', 130),
    _SalesData('Sat', 98)
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Text
            const Row(
              children: [
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile.jpg'),
                  radius: 20,
                ),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning!",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Jayanti Thakur",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),

            // Glucose Level Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Last Reading:",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "520 mg/dl",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            Text(
                              "Glucose level",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 10),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.black54),
                                SizedBox(width: 8),
                                Text(
                                  "Before Lunch",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.check_circle,
                                    color: Colors.teal[800]),
                                const SizedBox(width: 8),
                                Text("On track",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.teal[800])),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FilterButton(label: "Daily"),
                            SizedBox(width: 6),
                            FilterButton(label: "Monthly"),
                            SizedBox(width: 6),
                            FilterButton(label: "Weekly"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                        color: Colors.white,
                        height: size.height * 0.28,
                        child: Container(
                          height: size.height,
                          width: size.width,
                          color: Colors.white,
                          child: SfCartesianChart(
                            backgroundColor: Colors.white,
                            primaryXAxis: CategoryAxis(
                              majorGridLines: MajorGridLines(width: 0),
                              plotBands: [
                                for (int i = 0; i < 7; i++)
                                  PlotBand(
                                    start: i - 0.5,
                                    end: i + 0.5,
                                    color: i % 2 == 0
                                        ? Colors.grey.withOpacity(0.1)
                                        : Colors.transparent,
                                  ),
                              ],
                            ),
                            primaryYAxis: NumericAxis(
                              majorGridLines: MajorGridLines(
                                  width: 0), // Remove y-axis grid lines
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <SplineSeries<_SalesData, String>>[
                              SplineSeries<_SalesData, String>(
                                dataSource: data,
                                xValueMapper: (_SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (_SalesData sales, _) =>
                                    sales.sales,
                                name: 'Glucose',
                                color: Colors
                                    .teal, // Change the color of the spline
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                width: 2, // Set the spline line width
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 7),
            // Upcoming Tests Section
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Upcoming Tests",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_month,
                                      size: 40, color: Colors.teal[800]),
                                  const SizedBox(width: 8),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "After Lunch",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text("8:00 AM"),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 50),
                              Icon(
                                Icons.arrow_circle_right,
                                size: 40,
                                color: Colors.teal[800],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: size.height * 0.165,
                  width: size.width * 0.4,
                  child: Expanded(
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: Text("")),
                      ),
                    ),
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

class FilterButton extends StatelessWidget {
  final String label;

  const FilterButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 4), // Reduced padding
        minimumSize: const Size(50, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: const BorderSide(color: Colors.teal),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(color: Colors.teal[800], fontSize: 12),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
