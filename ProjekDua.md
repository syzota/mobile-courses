# **Mini Project** ⋆˚꩜｡

A repository made for the Mobile Application Development course in lecturer's class. **Was made by Putri Syafana Afrillia (NIM: 2409116015).**
## **Introduction** ★

Mini Project ini merupakan dokumentasi hasil pembuatan aplikasi sederhana **Mini E-Commerce Shopping Cart** berbasis **Flutter** menggunakan _state management Provider_. Proyek ini dikembangkan sebagai bagian dari pembelajaran pada mata kuliah Mobile Application Development.

---

## **Shopping Cart Hands-On** 🛍.ᐟ

### 🎯 Project Goal
Build Mini E-Commerce Shopping Cart using Provider state management.

## Features Checklist ᯓ★

- [x] Product model
- [x] Cart model with ChangeNotifier
- [x] Product list page
- [x] Add to cart button
- [x] Cart badge showing item count
- [x] Cart page with all items
- [x] Increase/decrease quantity
- [x] Remove item button
- [x] Total price calculation
- [x] Empty cart message

---

## Implemented Features ᯓ★

The features that have been successfully tested and implemented!

- [x] Product model  
- [x] Cart model with ChangeNotifier  
- [x] Product list page  
- [x] Add to cart button  
- [x] Cart badge showing item count  
- [x] Cart page with all items  
- [x] Increase/decrease quantity  
- [x] Remove item button  
- [x] Total price calculation  
- [x] Empty cart message  

---

## Functional Testing ⊹ ࣪ ˖ ✔

The following operations have been tested to ensure application functionality:

- [x] Add product 3x → Quantity should be 3 ✓  
- [x] Add different products → Badge shows correct total count ✓  
- [x] Increase quantity → Total price updates correctly ✓  
- [x] Decrease to 1 → Product remains in cart ✓  
- [x] Decrease to 0 → Product removed automatically ✓  
- [x] Clear all → Empty cart message displayed ✓  
- [x] Navigate back → Cart badge remains accurate ✓

---

## The Scores ⊹ ࣪ ˖ ✔

Below are the instructions that must be implemented and are worth **70 points**.

- [x] Add to cart from product list
- [x] Show cart items dengan quantity
- [x] Update quantity (+/-)
- [x] Remove items from cart
- [x] Display total price correctly

then here is an additional implementation that becomes a bonus value with a score of **30 points**.

- [x] Search/Filter (+10) - Search products by name
- [x] Categories (+10) - Filter products by category
- [x] Checkout Page (+10) - Order summary + form

# **Project Documentations** 🛍.ᐟ

## Library Structure ⊹ ࣪ ˖ ✔

Below is the structure of the **_library_ folder** which contains the main codes that are executed.

```

├── lib/
│   ├── models/                     # Data models dan state management
│   │   ├── cart_item.dart          # Pengaturan item dalam keranjang
│   │   ├── cart_model.dart         # Cart model dengan ChangeNotifier
│   │   └── product.dart            # Model data produk
│   │
│   ├── pages/                      # Halaman utama aplikasi
│   │   ├── cart_page.dart          # Halaman daftar item dalam keranjang
│   │   ├── checkout_page.dart      # Halaman checkout dan ringkasan pesanan
│   │   └── product_list_page.dart  # Halaman daftar produk
│   │
│   └── main.dart                   # Entry point aplikasi

```

## **Main Scores** ୭ ˚. ᵎᵎ .ᐟ

### Add to Cart 𖠩

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/21c3c0e2-a2ae-4664-93ab-282dc3516cde" />

Fitur ini memungkinkan pengguna menambahkan produk (album) ke dalam keranjang belanja. Implementasi dilakukan pada product_list_page.dart melalui pemanggilan method addItem() dari CartModel, yang dikelola menggunakan Provider untuk memperbarui state aplikasi.

``` dart

ElevatedButton(
  onPressed: () {
    context.read<CartModel>().addItem(product);
  },
  child: const Text('Add'),
)
```

Method pada cart_model.dart:

``` dart
void addItem(Product product) {
  final index =
      _items.indexWhere((item) => item.product.id == product.id);

  if (index >= 0) {
    _items[index].quantity++;
  } else {
    _items.add(CartItem(product: product));
  }

  notifyListeners();
}
```
### Show Cart Items with Quantity .✦ ݁˖

Fitur ini menampilkan seluruh produk yang telah ditambahkan ke keranjang beserta jumlah (quantity)-nya. Implementasi berada pada cart_page.dart, dengan memanfaatkan Consumer<CartModel> untuk membaca daftar item.

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
### Update Quantity (+/-) .✦ ݁˖

Fitur ini memungkinkan pengguna menambah atau mengurangi jumlah produk dalam keranjang. Implementasi dilakukan pada cart_page.dart, yang memanggil method increaseQuantity() dan decreaseQuantity() di dalam cart_model.dart.

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/9b205029-1c21-48b9-abab-957fd0c2317f" />

``` dart
IconButton(
  icon: const Icon(Icons.add),
  onPressed: () {
    context.read<CartModel>().increaseQuantity(item.product);
  },
),

IconButton(
  icon: const Icon(Icons.remove),
  onPressed: () {
    context.read<CartModel>().decreaseQuantity(item.product);
  },
),
```

Method di cart_model.dart:

``` dart
void increaseQuantity(Product product) {
  final item =
      _items.firstWhere((item) => item.product.id == product.id);
  item.quantity++;
  notifyListeners();
}

void decreaseQuantity(Product product) {
  final index =
      _items.indexWhere((item) => item.product.id == product.id);

  if (_items[index].quantity > 1) {
    _items[index].quantity--;
  } else {
    _items.removeAt(index);
  }

  notifyListeners();
}
```

### Remove Items from Cart .✦ ݁˖

Fitur ini memungkinkan pengguna menghapus produk secara langsung dari keranjang. Implementasi dilakukan melalui method removeItem() pada cart_model.dart.

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/97384040-71d5-4bf6-95da-d4c05684d7a7" />

``` dart
void removeItem(Product product) {
  _items.removeWhere((item) => item.product.id == product.id);
  notifyListeners();
}
```

Pemanggilan di cart_page.dart:

``` dart
IconButton(
  icon: const Icon(Icons.delete),
  onPressed: () {
    context.read<CartModel>().removeItem(item.product);
  },
),
```

### Display Total Price Correctly .✦ ݁˖

Fitur ini menghitung dan menampilkan total harga seluruh item dalam keranjang. Perhitungan dilakukan pada cart_model.dart menggunakan getter totalPrice

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/80b8a4d2-d7cb-4e13-9721-21b441e7343b" />

``` dart
double get totalPrice {
  return _items.fold(
    0,
    (sum, item) => sum + item.totalPrice,
  );
}
}
```

Pemanggilan di halaman cart atau checkout:

``` dart
Text(
  'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
)
```
## **Bonus Scores ゛⸝⸝.ᐟ⋆

### Search / Filter .✦ ݁˖

Fitur ini memungkinkan pengguna mencari produk berdasarkan nama. Implementasi dilakukan pada product_list_page.dart dengan memanfaatkan TextField untuk menangkap input pencarian dan melakukan filtering pada daftar produk menggunakan method where().

<img width="922" height="1124" alt="image" src="https://github.com/user-attachments/assets/91ba83ec-d2e5-4e65-a1c4-274c6a0f80cf" />

``` dart
TextField(
  decoration: const InputDecoration(
    hintText: 'Search product...',
    prefixIcon: Icon(Icons.search),
  ),
  onChanged: (value) {
    setState(() {
      searchQuery = value;
    });
  },
),
```

Berikut logika filtering-nya.

``` dart
final filteredProducts = products.where((product) {
  final matchesSearch =
      product.name.toLowerCase().contains(searchQuery.toLowerCase());
  return matchesSearch;
}).toList();
```
Fungsi where() menyaring daftar produk berdasarkan kecocokan nama dengan input pengguna. Ketika setState() dipanggil, tampilan akan diperbarui secara otomatis.

### Categories .✦ ݁˖

Fitur ini memungkinkan pengguna memfilter produk berdasarkan kategori tertentu. Implementasi dilakukan menggunakan DropdownButton pada product_list_page.dart, yang akan memperbarui variabel kategori aktif dan memfilter produk sesuai kategori tersebut.

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/16065a70-9d6c-4053-ac74-6184d0a90869" />

``` dart
TextField(
  decoration: const InputDecoration(
    hintText: 'Search product...',
    prefixIcon: Icon(Icons.search),
  ),
  onChanged: (value) {
    setState(() {
      searchQuery = value;
    });
  },
),
```

Berikut logika filtering-nya.

``` dart
final filteredProducts = products.where((product) {
  final matchesSearch =
      product.name.toLowerCase().contains(searchQuery.toLowerCase());
  return matchesSearch;
}).toList();
```

### Checkout Page .✦ ݁˖

Halaman ini memanfaatkan data dari CartModel untuk memastikan total harga dan item tetap sinkron dengan state aplikasi. Fitur ini menyediakan halaman ringkasan pesanan dan formulir sederhana untuk proses checkout. Implementasi berada pada checkout_page.dart, yang menampilkan daftar item, total harga, serta form input data pengguna. Berikut navigasi ke halaman checkout:

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/6a9881d9-1228-48f6-9caa-be9cca88e5cc" />

``` dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CheckoutPage(),
      ),
    );
  },
  child: const Text('Checkout'),
)
```

Berikut untuk menampilkan ringkasan pesanannya.

``` dart
Text(
  'Total: Rp ${cart.totalPrice.toStringAsFixed(0)}',
)
```
Dan form input simpel untuk nama pelanggan.

``` dart
TextField(
  decoration: const InputDecoration(
    labelText: 'Full Name',
  ),
),
```

Berikut tampilan ketika sudah menetapkan orderan.

<img width="1920" height="1200" alt="image" src="https://github.com/user-attachments/assets/6d0d898f-039c-4955-a954-077cf71334d4" />




