import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          final completed = todoProvider.completedTodos.length;
          final pending = todoProvider.pendingTodos.length;
          final total = completed + pending;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: completed.toDouble(),
                          title: 'Completed',
                          radius: 100,
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: pending.toDouble(),
                          title: 'Pending',
                          radius: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _StatItem(
                          title: 'Total Tasks',
                          value: total.toString(),
                          icon: Icons.task_alt,
                        ),
                        const Divider(),
                        _StatItem(
                          title: 'Completed',
                          value: completed.toString(),
                          icon: Icons.check_circle,
                          color: Colors.green,
                        ),
                        const Divider(),
                        _StatItem(
                          title: 'Pending',
                          value: pending.toString(),
                          icon: Icons.pending,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;

  const _StatItem({
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: Text(
        value,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}