import 'package:flutter/material.dart';
import '../models/job.dart';
import '../widgets/job_card.dart';
import 'add_job_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Job> jobs = [];

  void _addJob(Job job) {
    setState(() {
      jobs.add(job);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Listings')),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) => JobCard(job: jobs[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddJobScreen()),
          );
          if (result != null && result is Job) {
            _addJob(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
