// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwards_app/features/home/bloc/students_bloc.dart';
import 'package:hogwards_app/features/home/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  int indexOfTryAgain;
  HomeScreen({super.key, required this.indexOfTryAgain});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StudentsBloc _studentsBloc;

  @override
  void initState() {
    super.initState();
    _studentsBloc = StudentsBloc();
    _loadInitialData();
  }

  void _loadInitialData() {
    _studentsBloc.add(LoadStudents());
    if (widget.indexOfTryAgain != -1) {
      _studentsBloc.add(LoadStudentAgain(index: widget.indexOfTryAgain));
      widget.indexOfTryAgain = -1;
    }
  }

  void _handleFacultySelection(String selectedFaculty) {
    _studentsBloc.add(SelectFaculty(selectedFaculty: selectedFaculty));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          TextButton(
            onPressed: () => _studentsBloc.add(ResetAll()),
            child: const Text(
              "Reset",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: BlocListener<StudentsBloc, StudentsState>(
        bloc: _studentsBloc,
        listener: (context, state) {
          if (state is StudentsLoaded && state.isSelectionSuccess != null) {
            _showSnackBar(context, state.isSelectionSuccess!);
          }
        },
        child: BlocBuilder<StudentsBloc, StudentsState>(
          bloc: _studentsBloc,
          builder: (context, state) {
            if (state is StudentsLoaded) {
              return _buildLoadedState(state);
            } else if (state is StudentsLoadingFailure) {
              return const Center(child: Text("ERROR"));
            }
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          },
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, bool isSuccess) {
    final message = isSuccess ? 'Success' : 'Failed';
    final color = isSuccess ? Colors.green : Colors.red;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  Widget _buildLoadedState(StudentsLoaded state) {
    final students = state.students;
    return RefreshIndicator(
      onRefresh: () => _refreshRandomStudent(),
      color: Colors.black,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            AttemptRow(
              success: students[state.randNum].successAttempts,
              failed: students[state.randNum].failedAttempts,
            ),
            const SizedBox(height: 20),
            ImageWidget(
              image: students[state.randNum].image,
              text: students[state.randNum].name,
            ),
            const SizedBox(height: 15),
            FacultyRows(
              onFacultySelected: _handleFacultySelection,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refreshRandomStudent() {
    final completer = Completer();
    _studentsBloc.add(LoadRandomStudent(completer: completer));
    return completer.future;
  }

  @override
  void dispose() {
    _studentsBloc.close();
    super.dispose();
  }
}
