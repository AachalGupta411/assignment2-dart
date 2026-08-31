# Assignment 2 – Dart Async Programming and Null Safety

## Aim

To build a Dart program using null safety, Future, async/await and mock API data. The program also demonstrates handling of null responses and errors.

## Concepts Used

- Null Safety
- Future
- async/await
- Mock API
- Exception Handling
- Nullable Variables
- List and Map
- try-catch

## Program Description

The program simulates fetching data from a mock API using a Future.

The `fetchData()` function uses `async/await` and a delay to simulate an API request. The program handles three different situations:

1. Successful API response
2. Null API response
3. API error/exception

The fetched data is displayed in the terminal.

## Null Safety

Dart null safety is demonstrated using nullable return values.

Example:

```dart
Future<List<User>?> fetchData()