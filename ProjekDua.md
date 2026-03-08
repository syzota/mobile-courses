# **Mini Project** ⋆˚꩜｡

A repository made for the Mobile Application Development course in lecturer's class. **Was made by Putri Syafana Afrillia (NIM: 2409116015).**

## **Introduction** ★

Mini Project ini merupakan dokumentasi hasil pembuatan aplikasi sederhana **Student Registration App** berbasis **Flutter** menggunakan _state management Provider_. Proyek ini dikembangkan sebagai bagian dari pembelajaran pada mata kuliah Mobile Application Development.

Aplikasi ini memungkinkan pengguna untuk melakukan pendaftaran peserta melalui form interaktif dengan berbagai jenis input, melakukan validasi data secara langsung, serta menampilkan daftar pendaftar yang tersimpan menggunakan Provider sebagai pengelola state aplikasi.

---

# **Student Registration Hands-On** 📝.ᐟ

### 🎯 Project Goal

Build a **Student Registration Application** using **Flutter Form Widgets** and **Provider State Management**.

Aplikasi ini mensimulasikan sistem pendaftaran sederhana yang terdiri dari:

- Form registrasi multi-field
- Validasi input
- Penyimpanan data menggunakan Provider
- Halaman daftar pendaftar
- Halaman detail data pendaftar

---

# **Features Checklist ᯓ★**

- [x] Multi-field registration form
- [x] Real-time input validation
- [x] Various Flutter input widgets
- [x] Provider state management
- [x] Registrant list page
- [x] Registrant detail page

---

# **Implemented Features ᯓ★**

The features that have been successfully tested and implemented!

- [x] Multi-field registration form  
- [x] Real-time validation  
- [x] Various input widgets (TextFormField, Radio, Dropdown, DatePicker, Checkbox)  
- [x] Provider for storing registrants  
- [x] Registrant list page  
- [x] Registrant detail page  

---

# **Functional Testing ⊹ ࣪ ˖ ✔**

The following operations have been tested to ensure application functionality:

- [x] Input name, email, password → Data accepted if valid ✓  
- [x] Invalid email format → Error message displayed ✓  
- [x] Password less than 6 characters → Validation triggered ✓  
- [x] Select gender and study program → Data stored correctly ✓  
- [x] Select date of birth using DatePicker ✓  
- [x] Submit registration form → Data saved in Provider ✓  
- [x] Registrant list page shows all saved participants ✓  
- [x] Tap registrant item → Navigate to detail page ✓  
- [x] Delete registrant → List updates automatically ✓

---

# **The Scores ⊹ ࣪ ˖ ✔**

Below are the instructions that must be implemented and are worth **70 points**.

- [x] Multi-field form (name, email, password, etc)
- [x] Real-time validation
- [x] Various Flutter input widgets
- [x] Provider for state management
- [x] List page displaying registrants
- [x] Detail page for registrant information

then here is an additional implementation that becomes a bonus value with a score of **30 points**.

- [x] Multi-step registration form using Stepper (+10)
- [x] Delete registrant feature (+10)
- [x] Search registrant feature (+10)

---

# **Project Documentations** 📝.ᐟ

## **Library Structure ⊹ ࣪ ˖ ✔**

Below is the structure of the **_library_ folder** which contains the main codes that are executed.


```
lib
 ├── models
 │   └── registrant_model.dart
 │
 ├── pages
 │   ├── date_page.dart
 │   ├── edit_registrant_page.dart
 │   ├── form_validation_page.dart
 │   ├── input_widgets_page.dart
 │   ├── registrant_detail_page.dart
 │   ├── registrant_list_page.dart
 │   └── registration_page.dart
 │
 ├── providers
 │   └── registration_provider.dart
 │
 └── main.dart

```

## **Main Scores** ୭ ˚. ᵎᵎ .ᐟ

Fitur ini menyediakan form registrasi yang terdiri dari beberapa field input seperti **nama, email, password, jenis kelamin, program studi, tanggal lahir, serta persetujuan syarat & ketentuan**. Implementasi dilakukan menggunakan **Form** dan **TextFormField** dengan controller untuk setiap input sehingga data dapat diproses sebelum disimpan ke dalam Provider.

```dart
TextFormField(
  controller: _nameController,
  decoration: const InputDecoration(
    labelText: 'Nama Lengkap',
    prefixIcon: Icon(Icons.person),
  ),
)
```
### Show Cart Items with Quantity .✦ ݁˖

Fitur ini menampilkan seluruh produk yang telah ditambahkan ke keranjang beserta jumlah (quantity)-nya. Implementasi berada pada cart_page.dart, dengan memanfaatkan Consumer<CartModel> untuk membaca daftar item. Form ini menjadi pusat pengumpulan seluruh data sebelum dikirim ke state management.

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/cdc3d369-b966-408e-bb4f-32233e10627c" />

``` dart
Consumer<CartModel>(
  builder: (context, cart, child) {
    return ListView(
      children: cart.itemsList.map(
        (item) => ListTile(
          title: Text(item.product.name),
          subtitle: Text('Qty: ${item.quantity}'),
          trailing: Text(
            'Rp ${item.totalPrice.toStringAsFixed(0)}',
          ),
        ),
      ).toList(),
    );
  },
)
```
### Real-time Validation .✦ ݁˖

Validasi input dilakukan secara langsung menggunakan validator pada setiap field. Mode validasi diatur menggunakan AutovalidateMode.onUserInteraction. Kesalahan input dapat langsung diketahui oleh pengguna tanpa harus menunggu form dikirim.

```dart
TextFormField(
  controller: _emailController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi';
    }

    final emailRegex =
        RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }

    return null;
  },
)
```

### Various Input Widgets .✦ ݁˖

Aplikasi ini memanfaatkan berbagai widget input Flutter untuk meningkatkan pengalaman pengguna dalam mengisi form. Widget yang digunakan antara lain:

- [x] TextFormField → Input teks seperti nama dan email
- [x] RadioListTile → Memilih jenis kelamin
- [x] DropdownButtonFormField → Memilih program studi
- [x] DatePicker → Memilih tanggal lahir
- [x] CheckboxListTile → Persetujuan syarat dan ketentuan

Contoh implementasi Radio Button:

```dart
RadioListTile<String>(
  title: const Text('Laki-laki'),
  value: 'Laki-laki',
  groupValue: _selectedGender,
  onChanged: (value) {
    setState(() {
      _selectedGender = value!;
    });
  },
)
```

### Provider State Management .✦ ݁˖

Provider digunakan untuk menyimpan dan mengelola daftar pendaftar secara global di dalam aplikasi.

``` dart
class RegistrationProvider extends ChangeNotifier {

  final List<Registrant> _registrants = [];

  List<Registrant> get registrants => _registrants;

  void addRegistrant(Registrant registrant) {
    _registrants.add(registrant);
    notifyListeners();
  }
}
```

### Registrant List Page .✦ ݁˖

Halaman ini menampilkan seluruh peserta yang telah melakukan registrasi menggunakan ListView.builder. Data pada halaman ini langsung berasal dari Provider sehingga akan diperbarui secara otomatis ketika ada data baru.

```dart
ListView.builder(
  itemCount: provider.registrants.length,
  itemBuilder: (context, index) {

    final registrant = provider.registrants[index];

    return ListTile(
      title: Text(registrant.name),
      subtitle: Text(registrant.email),
    );
  },
)
```

### Registrant Detail Page .✦ ݁˖ .✦ ݁˖

Halaman detail digunakan untuk menampilkan informasi lengkap dari peserta yang dipilih pada halaman daftar pendaftar. Navigasi ke halaman detail dilakukan dengan mengirimkan ID registrant melalui Navigator, dan halaman detail kemudian mengambil data dari Provider berdasarkan ID tersebut dan menampilkan seluruh informasi yang tersimpan.

```dart
Navigator.pushNamed(
  context,
  '/detail',
  arguments: registrant.id,
);
```

## **Bonus Scores ゛⸝⸝.ᐟ⋆

### Stepper Multi-Step Form .✦ ݁˖

Form registrasi dibagi menjadi beberapa langkah menggunakan widget Stepper untuk meningkatkan pengalaman pengguna. Setiap langkah berisi kelompok input tertentu seperti:

- [x] Data diri
- [x] Informasi akademik
- [x] Konfirmasi data

```dart
Stepper(
  currentStep: _currentStep,
  onStepContinue: () {
    setState(() {
      _currentStep++;
    });
  },
)
```

### Delete Registrant Feature .✦ ݁˖

Pengguna dapat menghapus data peserta langsung dari halaman daftar menggunakan tombol delete. Setelah data dihapus, Provider akan memperbarui daftar secara otomatis.

```dart
IconButton(
  icon: const Icon(Icons.delete),
  onPressed: () {
    provider.removeRegistrant(registrant.id);
  },
)
```

### Search Registrant .✦ ݁˖

Fitur pencarian memungkinkan pengguna menemukan peserta dengan cepat berdasarkan nama.
```dart
TextField(
  decoration: const InputDecoration(
    hintText: 'Search registrant...',
    prefixIcon: Icon(Icons.search),
  ),
  onChanged: (value) {
    setState(() {
      _searchQuery = value;
    });
  },
)
```
Data kemudian difilter menggunakan method where() pada daftar registrant.

```dart
final filtered = registrants.where((r) {
  return r.name
      .toLowerCase()
      .contains(_searchQuery.toLowerCase());
}).toList();
```
Fitur ini membantu pengguna menemukan data dengan lebih cepat ketika jumlah peserta sudah banyak.




