import 'dart:async';

/// Represents data returned by the mock API.
class User {
  final int id;
  final String name;
  final String? email;

  const User({
    required this.id,
    required this.name,
    this.email,
  });

  @override
  String toString() {
    return 'ID: $id | Name: $name | Email: ${email ?? "Not available"}';
  }
}

/// Simulates an API service using Future and async/await.
class MockApiService {
  Future<List<User>?> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 2));

    // Mock API response.
    return const [
      User(id: 1, name: 'Aarav', email: 'aarav@example.com'),
      User(id: 2, name: 'Diya', email: null),
      User(id: 3, name: 'Kabir', email: 'kabir@example.com'),
    ];
  }

  // Simulates an API returning no data.
  Future<List<User>?> fetchNullData() async {
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }

  // Simulates an API failure.
  Future<List<User>?> fetchWithError() async {
    await Future.delayed(const Duration(seconds: 1));
    throw Exception('Server connection failed');
  }
}

/// Fetches and displays data while handling null and error cases.
Future<void> fetchAndDisplay(
  Future<List<User>?> Function() apiCall,
) async {
  print('Fetching data...');

  try {
    final List<User>? users = await apiCall();

    // Null safety: handle a null API response.
    if (users == null) {
      print('No data received from the API.');
      return;
    }

    // Handle an empty list.
    if (users.isEmpty) {
      print('The API returned an empty list.');
      return;
    }

    print('Data fetched successfully:');
    for (final User user in users) {
      print(user);
    }
  } catch (error) {
    print('An error occurred while fetching data: $error');
  }
}

Future<void> main() async {
  print('========================================');
  print('       DART MOCK API ASSIGNMENT');
  print('========================================');

  print('\n1. SUCCESS CASE');
  await fetchAndDisplay(MockApiService().fetchUsers);

  print('\n2. NULL RESPONSE CASE');
  await fetchAndDisplay(MockApiService().fetchNullData);

  print('\n3. ERROR CASE');
  await fetchAndDisplay(MockApiService().fetchWithError);

  print('\n========================================');
  print('Program completed.');
  print('========================================');
}

