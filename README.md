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

## **Main Scores** 🛍.ᐟ

### Add to Cart 𖠩

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




