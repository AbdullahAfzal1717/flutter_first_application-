class Student {
  const Student({
    required this.name,
    required this.phone,
    required this.email,
  });

  final String name;
  final String phone;
  final String email;
}

const List<Student> sampleStudents = [
  Student(
    name: 'Aarav Sharma',
    phone: '+91 98765 43210',
    email: 'aarav.sharma@example.com',
  ),
  Student(
    name: 'Emily Johnson',
    phone: '+1 202 555 0147',
    email: 'emily.johnson@example.com',
  ),
  Student(
    name: 'Fatima Khan',
    phone: '+91 91234 56789',
    email: 'fatima.khan@example.com',
  ),
  Student(
    name: 'James Wilson',
    phone: '+44 20 7946 0958',
    email: 'james.wilson@example.com',
  ),
  Student(
    name: 'Maya Patel',
    phone: '+91 99887 76655',
    email: 'maya.patel@example.com',
  ),
  Student(
    name: 'Noah Williams',
    phone: '+1 415 555 0182',
    email: 'noah.williams@example.com',
  ),
];
