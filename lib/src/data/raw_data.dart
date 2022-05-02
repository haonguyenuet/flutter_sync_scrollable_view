import 'package:sync_scrollable_list_tabs/src/models/category_model.dart';
import 'package:sync_scrollable_list_tabs/src/models/product_model.dart';

const bannerImage = "assets/images/cover.jpeg";

const rawCategories = [
  CategoryModel(
    name: "Đồ uống",
    products: [
      ProductModel(
        name: "Cafe Sữa",
        price: 40000,
        image: "assets/images/nuoc_uong/cafe_sua.jpeg",
      ),
      ProductModel(
        name: "Cafe Đen",
        price: 44000,
        image: "assets/images/nuoc_uong/cafe_den.jpeg",
      ),
      ProductModel(
        name: "Cafe Mocha",
        price: 45000,
        image: "assets/images/nuoc_uong/cafe_mocha.jpeg",
      ),
      ProductModel(
        name: "Cafe Americano",
        price: 50000,
        image: "assets/images/nuoc_uong/cafe_americano.jpeg",
      ),
      ProductModel(
        name: "Capuchino",
        price: 30000,
        image: "assets/images/nuoc_uong/capuchino.jpeg",
      ),
      ProductModel(
        name: "Caramel",
        price: 450000,
        image: "assets/images/nuoc_uong/caramel.jpeg",
      ),
    ],
  ),
  CategoryModel(
    name: "Bánh hoa quả",
    products: [
      ProductModel(
        name: "Bánh Nho",
        price: 40000,
        image: "assets/images/banh/banh_cuon_nho.jpeg",
      ),
      ProductModel(
        name: "Bánh Dứa",
        price: 40000,
        image: "assets/images/banh/banh_dua.jpeg",
      ),
      ProductModel(
        name: "Bánh Hạnh Nhân",
        price: 40000,
        image: "assets/images/banh/banh_hanh_nhan.jpeg",
      ),
      ProductModel(
        name: "Bánh Táo",
        price: 40000,
        image: "assets/images/banh/banh_nhan_thit.jpeg",
      ),
    ],
  ),
  CategoryModel(
    name: "Bánh ngọt",
    products: [
      ProductModel(
        name: "Bánh Ngọt Chocolate",
        price: 50000,
        image: "assets/images/banh_ngot/banh_ngot_chocolate.jpeg",
      ),
      ProductModel(
        name: "Bánh Ngọt Coffee",
        price: 50000,
        image: "assets/images/banh_ngot/banh_ngot_coffee.jpeg",
      ),
      ProductModel(
        name: "Bánh Phô Mai Nướng",
        price: 50000,
        image: "assets/images/banh_ngot/banh_pho_mai_nuong.jpeg",
      ),
    ],
  ),
  CategoryModel(
    name: "Bánh quy",
    products: [
      ProductModel(
        name: "Bánh Quy Socola",
        price: 360000,
        image: "assets/images/banh_quy/banh_quy_socola.jpeg",
      ),
      ProductModel(
        name: "Bánh Quy Phô Mai",
        price: 350000,
        image: "assets/images/banh_quy/banh_quy_phomai.jpeg",
      ),
    ],
  ),
];
