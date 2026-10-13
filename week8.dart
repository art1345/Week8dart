class StudentProcessor {
  final String name;
  final int age;
  final double gpa;
  final bool isEnrolled;

  StudentProcessor({required this.name, required this.age, required this.gpa, required this.isEnrolled});

  String generateProgressReport(int semesters) {
    if (semesters < 0 || semesters > 8) throw RangeError('Semesters must be 0-8.');
    
    final log = [
      for (int i = 1; i <= semesters; i++)
        'Semester $i: ${i <= 4 ? 'Foundation' : 'Advanced'} study phase completed.',
      semesters >= 8 ? 'Status: Ready for graduation.' : 'Status: Still in progress.'
    ];

    return '--- Progress Log for $name ---\n${log.join('\n')}';
  }

  void displayReport() {
    print('=== Student Information ===\nName: $name\nAge: $age\nGPA: $gpa');
    try {
      print(generateProgressReport(9));
    } on RangeError catch (e) {
      print('\n[Error Handling] Caught expected error: ${e.message}');
    }
  }
}

void main() {
  StudentProcessor(name: 'Alex Cruz', age: 20, gpa: 3.75, isEnrolled: true).displayReport();
}