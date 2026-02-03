import 'dart:async'; // Cần thiết để sử dụng Streams và Futures

// --- KHAI BÁO CÁC CLASS CHO BÀI TẬP 4 ---
// [Exercise 4] Class Car với thuộc tính và phương thức cơ bản
class Car {
  String brand;
  int year;

  // Constructor cơ bản
  Car(this.brand, this.year);

  // [Exercise 4] Named constructor
  Car.named(this.brand) : year = 2024;

  // Phương thức để override
  void drive() {
    print('The $brand car is driving.');
  }
}

// [Exercise 4] Subclass kế thừa và override
class ElectricCar extends Car {
  // Constructor gọi đến constructor của cha (super)
  ElectricCar(String brand, int year) : super(brand, year);

  @override
  void drive() {
    print('The $brand electric car moves silently ⚡.');
  }
}

// --- HÀM MAIN (ENTRY POINT) ---
// Sử dụng async để chờ đợi các tác vụ bất đồng bộ trong Exercise 5
void main() async {
  print('--- START LAB 2 ---\n');

  // ---------------------------------------------------------
  // [Exercise 1] Basic Syntax & Data Types
  // Goal: Practice program structure and variable declarations.
  // ---------------------------------------------------------
  print('--- Exercise 1: Basic Syntax & Data Types ---');

  // Khai báo biến với các kiểu dữ liệu cốt lõi [cite: 80]
  int myAge = 25;
  double piValue = 3.14159;
  String greeting = "Hello Dart";
  bool isFlutterFun = true;

  // Sử dụng String interpolation ($var và ${expr}) [cite: 81]
  print('$greeting! I am $myAge years old.');
  print('Value of PI: $piValue');
  print('Is Flutter fun? ${isFlutterFun ? "Yes, absolutely!" : "No"}');
  print('\n');

  // ---------------------------------------------------------
  // [Exercise 2] Collections & Operators
  // Goal: Work with List, Set, Map and operators.
  // ---------------------------------------------------------
  print('--- Exercise 2: Collections & Operators ---');

  // [List] Tạo danh sách số nguyên [cite: 85]
  List<int> numbers = [10, 20, 30];
  numbers.add(40); // Thêm phần tử
  print('List numbers: $numbers');
  print('First element: ${numbers[0]}'); // Indexing [cite: 88]

  // [Set] Tập hợp các giá trị duy nhất [cite: 87]
  Set<String> uniqueColors = {'Red', 'Green', 'Blue', 'Red'}; // 'Red' bị trùng sẽ bị loại bỏ
  print('Unique Set: $uniqueColors');

  // [Map] Key-value pairs [cite: 87]
  Map<String, int> scores = {
    'Alice': 90,
    'Bob': 85
  };
  scores['Charlie'] = 95; // Thêm mới vào Map
  print('Map Scores: $scores');

  // Toán tử so sánh và logic (&&, ==) [cite: 86]
  bool check = (numbers.length > 3) && (scores['Alice'] == 90);
  print('Check logic (List > 3 AND Alice is 90): $check');
  print('\n');

  // ---------------------------------------------------------
  // [Exercise 3] Control Flow & Functions
  // Goal: Apply if/else, switch, loops, and functions.
  // ---------------------------------------------------------
  print('--- Exercise 3: Control Flow & Functions ---');

  // [If/Else] Kiểm tra điểm số [cite: 92]
  int score = 85;
  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 75) {
    print('Grade: B');
  } else {
    print('Grade: C');
  }

  // [Switch Case] Ngày trong tuần [cite: 93]
  String day = "Monday";
  switch (day) {
    case "Monday":
      print("Start of the work week!");
      break;
    case "Friday":
      print("Weekend is coming!");
      break;
    default:
      print("Just another day.");
  }

  // [Loops] Vòng lặp for-in [cite: 94]
  print('Looping through list:');
  for (var n in numbers) {
    print('Number: $n');
  }

  // [Functions] Hàm thường và Arrow syntax [cite: 95]
  int add(int a, int b) {
    return a + b;
  }

  // Arrow function
  int multiply(int a, int b) => a * b;

  print('Function Add (10+20): ${add(10, 20)}');
  print('Arrow Function Multiply (5*5): ${multiply(5, 5)}');
  print('\n');

  // ---------------------------------------------------------
  // [Exercise 4] Intro to OOP
  // Goal: Practice classes, objects, constructors, inheritance.
  // ---------------------------------------------------------
  print('--- Exercise 4: OOP Basics ---');

  // Khởi tạo Object từ Class Car [cite: 102]
  Car myCar = Car('Toyota', 2020);
  myCar.drive();

  // Sử dụng Named Constructor [cite: 100]
  Car newCar = Car.named('Honda'); // Năm mặc định là 2024
  print('Named Constructor Car: ${newCar.brand}, Year: ${newCar.year}');

  // Sử dụng Subclass và Override [cite: 101]
  ElectricCar tesla = ElectricCar('Tesla', 2023);
  tesla.drive(); // Sẽ in ra dòng override
  print('\n');

  // ---------------------------------------------------------
  // [Exercise 5] Async, Future, Null Safety & Streams
  // Goal: Work with asynchronous features.
  // ---------------------------------------------------------
  print('--- Exercise 5: Async, Future, Null Safety & Streams ---');

  // [Null Safety] Các toán tử ?, ??, ! [cite: 108]
  String? nullableName; // Có thể null
  // nullableName = "DartUser"; // Thử bỏ comment dòng này để xem sự khác biệt

  // Sử dụng ?? để cung cấp giá trị mặc định nếu null
  print('User Name: ${nullableName ?? "Guest"}');

  // [Future] Async/Await mô phỏng tải dữ liệu [cite: 106, 107]
  print('Fetching data...');
  String data = await fetchData(); // Đợi hàm async hoàn thành
  print(data);

  // [Stream] Dòng dữ liệu số nguyên [cite: 109]
  print('Listening to Stream (0 to 3):');
  await for (int value in numberStream()) {
    print('Stream value: $value');
  }

  print('\n--- END LAB 2 ---');
}

// Hàm hỗ trợ cho Exercise 5 (Future)
Future<String> fetchData() async {
  // Mô phỏng độ trễ 2 giây
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded successfully!';
}

// Hàm hỗ trợ cho Exercise 5 (Stream)
Stream<int> numberStream() async* {
  for (int i = 0; i <= 3; i++) {
    await Future.delayed(Duration(milliseconds: 500)); // Delay nhỏ giữa các số
    yield i;
  }
}