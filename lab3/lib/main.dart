import 'dart:async';
import 'dart:convert'; // Dùng cho bài tập JSON

// ==========================================
// Exercise 1: Product Model & Repository
// ==========================================
class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() => 'Product(id: $id, name: $name, price: \$$price)';
}

class ProductRepository {
  // StreamController broadcast để nhiều listener có thể lắng nghe cùng lúc
  final _controller = StreamController<Product>.broadcast();

  // Danh sách sản phẩm giả lập
  final List<Product> _products = [
    Product(id: 1, name: 'Laptop', price: 1200.0),
    Product(id: 2, name: 'Phone', price: 800.0),
  ];

  // Future: Lấy toàn bộ danh sách (giả lập delay mạng)
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));
    return _products;
  }

  // Stream: Lắng nghe sản phẩm mới được thêm vào
  Stream<Product> get liveAdded => _controller.stream;

  // Hàm thêm sản phẩm và đẩy vào Stream
  void addNewProduct(Product p) {
    _products.add(p);
    _controller.sink.add(p); // Phát sự kiện
  }

  // Đóng stream khi không dùng
  void dispose() {
    _controller.close();
  }
}

// ==========================================
// Exercise 2: User Repository with JSON
// ==========================================
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Named constructor: Chuyển đổi từ Map (JSON) sang Object
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  @override
  String toString() => 'User(name: $name, email: $email)';
}

Future<void> runExercise2() async {
  print('\n--- Exercise 2: User Repository with JSON ---');

  // Giả lập chuỗi JSON từ API trả về
  String jsonString = '''
    [
      {"name": "Alice", "email": "alice@example.com"},
      {"name": "Bob", "email": "bob@example.com"},
      {"name": "Charlie", "email": "charlie@example.com"}
    ]
  ''';

  // Giả lập việc fetch data mất thời gian
  await Future.delayed(Duration(milliseconds: 500));

  // Parse JSON
  List<dynamic> parsedList = jsonDecode(jsonString);

  // Map từng phần tử JSON sang Object User
  List<User> users = parsedList.map((json) => User.fromJson(json)).toList();

  print('Parsed Users:');
  users.forEach((u) => print(u));
}

// ==========================================
// Exercise 3: Async + Microtask Debugging
// ==========================================
void runExercise3() {
  print('\n--- Exercise 3: Async + Microtask Debugging ---');
  print('1. Main Start');

  // Future: Được đưa vào Event Queue (chạy sau Microtask)
  Future(() => print('4. Future Completed'));

  // Microtask: Được đưa vào Microtask Queue (ưu tiên chạy ngay sau khi Main kết thúc)
  scheduleMicrotask(() => print('3. Microtask Executed'));

  print('2. Main End');

  // Giải thích:
  // Dart Event Loop ưu tiên Microtask Queue hơn Event Queue.
  // Do đó, sau khi hàm main() chạy xong dòng 'Main End', nó sẽ kiểm tra Microtask Queue trước.
  // Vì vậy '3. Microtask Executed' in ra trước '4. Future Completed'.
}

// ==========================================
// Exercise 4: Stream Transformation
// ==========================================
Future<void> runExercise4() async {
  print('\n--- Exercise 4: Stream Transformation ---');

  // Tạo stream phát ra các số từ 1 đến 5
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  print('Processing stream (Square numbers & Filter evens)...');

  // Sử dụng map() để bình phương và where() để lọc số chẵn
  await numberStream
      .map((n) => n * n)        // 1, 4, 9, 16, 25
      .where((n) => n % 2 == 0) // Lọc số chẵn: 4, 16
      .listen((result) {
    print('Received: $result');
  }).asFuture(); // Chờ stream xử lý xong
}

// ==========================================
// Exercise 5: Factory Constructors & Cache
// ==========================================
class Settings {
  // Biến static để lưu trữ instance duy nhất (Singleton)
  static final Settings _instance = Settings._internal();

  String theme = 'Light';

  // Private constructor: Ngăn không cho tạo instance mới từ bên ngoài
  Settings._internal();

  // Factory constructor: Luôn trả về instance đã có sẵn
  factory Settings() {
    return _instance;
  }
}

void runExercise5() {
  print('\n--- Exercise 5: Factory Constructors & Cache ---');

  // Tạo 2 biến tham chiếu đến Settings
  var s1 = Settings();
  var s2 = Settings();

  // Thay đổi giá trị ở s1
  s1.theme = 'Dark';

  print('s1 theme: ${s1.theme}');
  print('s2 theme: ${s2.theme}');

  // Kiểm tra xem 2 biến có trỏ cùng về 1 vùng nhớ không
  bool isSame = identical(s1, s2);
  print('Are s1 and s2 the same object? $isSame'); // Expected: true
}

// ==========================================
// MAIN FUNCTION
// ==========================================
void main() async {
  // --- Chạy Exercise 1 ---
  print('--- Exercise 1: Product Model & Repository ---');
  final repo = ProductRepository();

  // 1. Lắng nghe stream (real-time updates)
  print('Listening for new products...');
  repo.liveAdded.listen((p) {
    print('[Stream] New product added: ${p.name}');
  });

  // 2. Lấy danh sách ban đầu (Future)
  var initialProducts = await repo.getAll();
  print('Initial products: $initialProducts');

  // 3. Thêm sản phẩm mới để kích hoạt Stream
  repo.addNewProduct(Product(id: 3, name: 'Tablet', price: 450.0));

  // Đợi một chút để Stream kịp in ra console
  await Future.delayed(Duration(milliseconds: 100));
  repo.dispose();

  // --- Chạy các bài tập còn lại ---
  await runExercise2();

  // Bài 3 không dùng await vì mục đích test log thứ tự,
  // nhưng ta đặt delay nhỏ để tách biệt log với bài 4.
  runExercise3();
  await Future.delayed(Duration(milliseconds: 100));

  await runExercise4();

  runExercise5();

  print('\n=== ALL EXERCISES COMPLETED ===');
}