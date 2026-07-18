import 'package:r_store/features/shop/models/banner_model.dart';
import 'package:r_store/features/shop/models/brand_category_model.dart';
import 'package:r_store/features/shop/models/brand_model.dart';
import 'package:r_store/features/shop/models/category_model.dart';
import 'package:r_store/features/shop/models/product_category_model.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/features/shop/screens/routes/routes.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/features/shop/models/product_attributes.dart';
import 'package:r_store/features/shop/models/product_variation.dart';

enum ProductType { single, variable }

class RDummyData {
  static List<BannerModel> banners = [
    BannerModel(
      imgUrl: RImages.banner1,
      targetScreen: RRoutes.order,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner2,
      targetScreen: RRoutes.cart,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner3,
      targetScreen: RRoutes.favourites,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner4,
      targetScreen: RRoutes.settings,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner5,
      targetScreen: RRoutes.userAddress,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner6,
      targetScreen: RRoutes.checkout,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner7,
      targetScreen: RRoutes.userProfile,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner8,
      targetScreen: RRoutes.store,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner9,
      targetScreen: RRoutes.subCategories,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner10,
      targetScreen: RRoutes.allProducts,
      isActive: true,
    ),
    BannerModel(
      imgUrl: RImages.banner11,
      targetScreen: RRoutes.allProducts,
      isActive: true,
    ),
  ];

  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      imageUrl: RImages.sportIcon,
      name: 'Sports',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      imageUrl: RImages.furnitureIcon,
      name: 'Furniture',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      imageUrl: RImages.electronicsIcon,
      name: 'Electronics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      imageUrl: RImages.clothIcon,
      name: 'Clothes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      imageUrl: RImages.animalIcon,
      name: 'Animals',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      imageUrl: RImages.shoeIcon,
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      imageUrl: RImages.cosmeticsIcon,
      name: 'Cosmetics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '14',
      imageUrl: RImages.jeweleryIcon,
      name: 'Jewelery',
      isFeatured: true,
    ),

    ///subcategories
    CategoryModel(
      id: '8',
      imageUrl: RImages.sportIcon,
      name: 'Sport Shoes',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '9',
      imageUrl: RImages.sportIcon,
      name: 'Track suits',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      imageUrl: RImages.sportIcon,
      name: 'Sports Equipments',
      parentId: '1',
      isFeatured: false,
    ),
    //furniture
    CategoryModel(
      id: '11',
      imageUrl: RImages.furnitureIcon,
      name: 'Bedroom furniture',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      imageUrl: RImages.furnitureIcon,
      name: 'Kitchen furniture',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      imageUrl: RImages.furnitureIcon,
      name: 'Office furniture',
      parentId: '5',
      isFeatured: false,
    ),
    //electronics
    CategoryModel(
      id: '14',
      imageUrl: RImages.electronicsIcon,
      name: 'Laptop',
      parentId: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '15',
      imageUrl: RImages.electronicsIcon,
      name: 'Mobile',
      parentId: '2',
      isFeatured: false,
    ),

    CategoryModel(
      id: '16',
      imageUrl: RImages.clothIcon,
      name: 'Shirts',
      parentId: '3',
      isFeatured: false,
    ),
  ];


/// -- List of all Products
static final List<ProductModel> products = [
  ProductModel(
    id: '001',
    title: 'Green Nike sports shoe',
    stockQuantity: 15,
    price: 135,
    isFeatured: true,
    thumbnail: RImages.productImage46,
    description: 'Green Nike sports shoe',
    brand: BrandModel(
      id: '1',
      image: RImages.nikeLogo,
      name: 'Nike',
      productsCount: 265,
      isFeatured: true,
    ),
    images: [
      RImages.productImage46,
      RImages.productImage39,
      RImages.productImage44,
      RImages.productImage38,
    ],
    salePrice: 30,
    sku: 'ABR4568',
    categoryId: '1',
    attributes: [
      ProductAttributesModel(
        name: 'Color',
        values: ['Green', 'Black', 'Red'],
      ),
      ProductAttributesModel(
        name: 'Size',
        values: ['EU 30', 'EU 32', 'EU 34'],
      ),
    ],
    variations: [
      ProductVariationModel(
        id: '1',
        stockQuantity: 34,
        price: 134,
        salePrice: 122.6,
        image: RImages.productImage46,
        description:
            'This is a Product description for Green Nike sports shoe.',
        attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '2',
        stockQuantity: 15,
        price: 132,
        image: RImages.productImage39,
        attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '3',
        stockQuantity: 0,
        price: 234,
        image: RImages.productImage39,
        attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '4',
        stockQuantity: 222,
        price: 232,
        image: RImages.productImage46,
        attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '5',
        stockQuantity: 0,
        price: 334,
        image: RImages.productImage44,
        attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '6',
        stockQuantity: 11,
        price: 332,
        image: RImages.productImage44,
        attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
      ),
    ],
    productType: ProductType.variable.name,
  ),
  ProductModel(
    id: '002',
    title: 'Blue T-shirt for all ages',
    stockQuantity: 15,
    price: 35,
    isFeatured: true,
    thumbnail: RImages.productImage75,
    description:
        'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '6', image: RImages.zaraLogo, name: 'ZARA'),
    images: [
      RImages.productImage75,
      RImages.productImage76,
      RImages.productImage77,
    ],
    salePrice: 30,
    sku: 'ABR4568',
    categoryId: '16',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '003',
    title: 'Leather brown Jacket',
    stockQuantity: 15,
    price: 38000,
    isFeatured: false,
    thumbnail: RImages.productImage34,
    description:
        'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '6', image: RImages.zaraLogo, name: 'ZARA'),
    images: [
      RImages.productImage34,
      RImages.productImage35,
      RImages.productImage36,
      RImages.productImage37,
    ],
    salePrice: 30,
    sku: 'ABR4568',
    categoryId: '16',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '004',
    title: '4 Color collar t-shirt dry fit',
    stockQuantity: 15,
    price: 135,
    isFeatured: false,
    thumbnail: RImages.productImage79,
    description:
        'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
    brand: BrandModel(id: '6', image: RImages.zaraLogo, name: 'ZARA'),
    images: [
      RImages.productImage79,
      RImages.productImage80,
      RImages.productImage78,
      RImages.productImage75,
    ],
    salePrice: 30,
    sku: 'ABR4568',
    categoryId: '16',
    attributes: [
      ProductAttributesModel(
        name: 'Color',
        values: ['Red', 'Yellow', 'Green', 'Blue'],
      ),
      ProductAttributesModel(
        name: 'Size',
        values: ['EU 30', 'EU 32', 'EU 34'],
      ),
    ],
    variations: [
      ProductVariationModel(
        id: '1',
        stockQuantity: 34,
        price: 134,
        salePrice: 122.6,
        image: RImages.productImage79,
        description:
            'This is a Product description for 4 Color collar t-shirt dry fit',
        attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '2',
        stockQuantity: 15,
        price: 132,
        image: RImages.productImage79,
        attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '3',
        stockQuantity: 0,
        price: 234,
        image: RImages.productImage80,
        attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '4',
        stockQuantity: 222,
        price: 232,
        image: RImages.productImage80,
        attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '5',
        stockQuantity: 0,
        price: 334,
        image: RImages.productImage78,
        attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '6',
        stockQuantity: 11,
        price: 332,
        image: RImages.productImage78,
        attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
      ),
      ProductVariationModel(
        id: '7',
        stockQuantity: 0,
        price: 334,
        image: RImages.productImage75,
        attributeValues: {'Color': 'Blue', 'Size': 'EU 30'},
      ),
      ProductVariationModel(
        id: '8',
        stockQuantity: 11,
        price: 332,
        image: RImages.productImage75,
        attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
      ),
    ],
    productType: ProductType.variable.name,
  ),

  ///Products after banner
  ProductModel(
    id: '005',
    title: 'Nike Air Jordon Shoes',
    stockQuantity: 15,
    price: 35,
    isFeatured: false,
    thumbnail: RImages.productImage39,
    description:
        'Nike Air Jordon Shoes for running. Quality product, Long Lasting',
    brand: BrandModel(
      id: '1',
      image: RImages.nikeLogo,
      name: 'Nike',
      productsCount: 265,
      isFeatured: true,
    ),
    images: [
      RImages.productImage39,
      RImages.productImage40,
      RImages.productImage41,
      RImages.productImage42,
    ],
    salePrice: 30,
    sku: 'ABR4568',
    categoryId: '8',
    attributes: [
      ProductAttributesModel(
        name: 'Color',
        values: ['Orange', 'Black', 'Brown'],
      ),
      ProductAttributesModel(
        name: 'Size',
        values: ['EU 30', 'EU 32', 'EU 34'],
      ),
    ],
    variations: [
      ProductVariationModel(
        id: '1',
        stockQuantity: 16,
        price: 36,
        salePrice: 12.6,
        image: RImages.productImage40,
        description:
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
        attributeValues: {'Color': 'Orange', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '2',
        stockQuantity: 15,
        price: 35,
        image: RImages.productImage39,
        attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '3',
        stockQuantity: 14,
        price: 34,
        image: RImages.productImage44,
        attributeValues: {'Color': 'Brown', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '4',
        stockQuantity: 13,
        price: 33,
        image: RImages.productImage39,
        attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '5',
        stockQuantity: 12,
        price: 32,
        image: RImages.productImage44,
        attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '6',
        stockQuantity: 11,
        price: 31,
        image: RImages.productImage40,
        attributeValues: {'Color': 'Orange', 'Size': 'EU 32'},
      ),
    ],
    productType: ProductType.variable.name,
  ),
  ProductModel(
    id: '006',
    title: 'SAMSUNG Galaxy S9 (Pink, 64 GB)  (4 GB RAM)',
    stockQuantity: 15,
    price: 750,
    isFeatured: false,
    thumbnail: RImages.productImage62,
    description:
        'SAMSUNG Galaxy S9 (Pink, 64 GB)  (4 GB RAM), Long Battery timing',
    brand: BrandModel(id: '7', image: RImages.appleLogo, name: 'Samsung'),
    images: [
      RImages.productImage62,
      RImages.productImage63,
      RImages.productImage64,
      RImages.productImage62,
    ],
    salePrice: 650,
    sku: 'ABR4568',
    categoryId: '2',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '007',
    title: 'TOMI Dog food',
    stockQuantity: 15,
    price: 20,
    isFeatured: false,
    thumbnail: RImages.productImage70,
    description:
        'This is a Product description for TOMI Dog food. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '7', image: RImages.appleLogo, name: 'Tomi'),
    salePrice: 10,
    sku: 'ABR4568',
    categoryId: '4',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  //008 after 040
  ProductModel(
    id: '009',
    title: 'Nike Air Jordon 19 Blue',
    stockQuantity: 15,
    price: 400,
    isFeatured: false,
    thumbnail: RImages.productImage41,
    description:
        'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage41,
      RImages.productImage45,
      RImages.productImage43,
      RImages.productImage38,
    ],
    salePrice: 200,
    sku: 'ABR4568',
    categoryId: '8',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '010',
    title: 'Nike Air Jordon 6 Orange',
    stockQuantity: 15,
    price: 400,
    thumbnail: RImages.productImage40,
    description:
        'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage40,
      RImages.productImage42,
      RImages.productImage45,
      RImages.productImage38,
    ],
    // salePrice: 200,
    sku: 'ABR4568',
    categoryId: '8',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '011',
    title: 'Nike Air Max Red & Black',
    stockQuantity: 15,
    price: 600,
    isFeatured: true,
    thumbnail: RImages.productImage45,
    description:
        'This is a Product description for Nike Air Max. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage45,
      RImages.productImage39,
      RImages.productImage44,
      RImages.productImage38,
    ],
    salePrice: 400,
    sku: 'ABR4568',
    categoryId: '8',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '012',
    title: 'Nike Basketball shoes Black & Green',
    stockQuantity: 15,
    price: 600,
    isFeatured: false,
    thumbnail: RImages.productImage46,
    description:
        'This is a Product description for Nike Basketball shoes. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage46,
      RImages.productImage39,
      RImages.productImage45,
      RImages.productImage38,
    ],
    salePrice: 400,
    sku: 'ABR4568',
    categoryId: '8',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '013',
    title: 'Nike wild horse shoes',
    stockQuantity: 15,
    price: 600,
    isFeatured: false,
    thumbnail: RImages.productImage47,
    description:
        'This is a Product description for Nike wild horse shoes. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage47,
      RImages.productImage45,
      RImages.productImage46,
      RImages.productImage38,
    ],
    salePrice: 400,
    sku: 'ABR4568',
    categoryId: '8',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  //Track suits
  ProductModel(
    id: '014',
    title: 'Nike Track suit red',
    stockQuantity: 15,
    price: 500,
    isFeatured: true,
    thumbnail: RImages.productImage73,
    description:
        'This is a Product description for Nike Track suit red. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage73,
      RImages.productImage71,
      RImages.productImage72,
      RImages.productImage74,
    ],
    // salePrice: 400,
    sku: 'ABR4568',
    categoryId: '9',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '015',
    title: 'Nike Track suit Black',
    stockQuantity: 15,
    price: 200,
    thumbnail: RImages.productImage71,
    description:
        'This is a Product description for Nike Track suit Black. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage71,
      RImages.productImage73,
      RImages.productImage72,
      RImages.productImage74,
    ],
    // salePrice: 400,
    sku: 'ABR4568',
    categoryId: '9',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '016',
    title: 'Nike Track suit Blue',
    stockQuantity: 15,
    price: 100,
    thumbnail: RImages.productImage72,
    description:
        'This is a Product description for Nike Track suit Blue. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage72,
      RImages.productImage71,
      RImages.productImage73,
      RImages.productImage74,
    ],
    // salePrice: 400,
    sku: 'ABR4568',
    categoryId: '9',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '017',
    title: 'Nike Track suit Parrot Green',
    stockQuantity: 15,
    price: 350,
    thumbnail: RImages.productImage74,
    description:
        'This is a Product description for Nike Track suit Parrot Green. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike'),
    images: [
      RImages.productImage74,
      RImages.productImage71,
      RImages.productImage72,
      RImages.productImage73,
    ],
    // salePrice: 400,
    sku: 'ABR4568',
    categoryId: '9',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  //Sports Equipments
  ProductModel(
    id: '018',
    title: 'Adidas Football',
    stockQuantity: 15,
    price: 40,
    isFeatured: true,
    thumbnail: RImages.productImage9,
    description:
        'This is a Product description for Football. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '2', image: RImages.adidasLogo, name: 'Adidas'),
    images: [
      RImages.productImage9,
      RImages.productImage10,
      RImages.productImage19,
      RImages.productImage69,
    ],
    // salePrice: 400,
    sku: 'ABR4568',
    categoryId: '10',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '019',
    title: 'Baseball Bat',
    stockQuantity: 15,
    price: 30,
    thumbnail: RImages.productImage10,
    description:
        'This is a Product description for Baseball Bat. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '2', image: RImages.adidasLogo, name: 'Adidas'),
    images: [
      RImages.productImage10,
      RImages.productImage9,
      RImages.productImage19,
      RImages.productImage69,
    ],
    // salePrice: 400,
    sku: 'ABR4568',
    categoryId: '10',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '020',
    title: 'Cricket Bat',
    stockQuantity: 15,
    price: 25,
    thumbnail: RImages.productImage19,
    description:
        'This is a Product description for Cricket Bat. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '2', image: RImages.adidasLogo, name: 'Adidas'),
    images: [
      RImages.productImage19,
      RImages.productImage10,
      RImages.productImage9,
      RImages.productImage69,
    ],
    // salePrice: 400,
    sku: 'ABR4568',
    categoryId: '10',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '021',
    title: 'Tennis Racket',
    stockQuantity: 15,
    price: 54,
    thumbnail: RImages.productImage69,
    description:
        'This is a Product description for Tennis Racket. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '2', image: RImages.adidasLogo, name: 'Adidas'),
    images: [
      RImages.productImage69,
      RImages.productImage10,
      RImages.productImage19,
      RImages.productImage9,
    ],
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '10',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),

  ///Furniture
  //bedroom
  ProductModel(
    id: '022',
    title: 'Pure Wooden Bed',
    stockQuantity: 15,
    price: 950,
    isFeatured: true,
    thumbnail: RImages.productImage14,
    description:
        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
    brand: BrandModel(id: '8', image: RImages.kenwoodLogo, name: 'Kenwood'),
    images: [
      RImages.productImage14,
      RImages.productImage12,
      RImages.productImage13,
      RImages.productImage11,
    ],
    salePrice: 600,
    sku: 'ABR4568',
    categoryId: '11',
    attributes: [
      ProductAttributesModel(
        name: 'Color',
        values: ['Black', 'Grey', 'Brown'],
      ),
      ProductAttributesModel(
        name: 'Size',
        values: ['EU 30', 'EU 32', 'EU 34'],
      ),
    ],
    variations: [
      ProductVariationModel(
        id: '1',
        stockQuantity: 16,
        price: 36,
        salePrice: 12.6,
        image: RImages.productImage14,
        description:
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
        attributeValues: {'Color': 'Brown', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '2',
        stockQuantity: 15,
        price: 35,
        image: RImages.productImage14,
        attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '3',
        stockQuantity: 14,
        price: 34,
        image: RImages.productImage14,
        attributeValues: {'Color': 'Brown', 'Size': 'EU 30'},
      ),
      ProductVariationModel(
        id: '4',
        stockQuantity: 13,
        price: 33,
        image: RImages.productImage12,
        attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '5',
        stockQuantity: 12,
        price: 32,
        image: RImages.productImage12,
        attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '6',
        stockQuantity: 11,
        price: 31,
        image: RImages.productImage13,
        attributeValues: {'Color': 'Grey', 'Size': 'EU 32'},
      ),
    ],
    productType: ProductType.variable.name,
  ),
  ProductModel(
    id: '023',
    title: 'Side Table Lamp',
    stockQuantity: 15,
    price: 25,
    thumbnail: RImages.productImage16,
    description:
        'This is a Product description for Side Table Lamp. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '8', image: RImages.kenwoodLogo, name: 'Kenwood'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '11',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '024',
    title: 'Bedroom Sofa',
    stockQuantity: 15,
    price: 25,
    thumbnail: RImages.productImage17,
    description:
        'This is a Product description for Bedroom Sofa. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '8', image: RImages.kenwoodLogo, name: 'Kenwood'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '11',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '025',
    title: 'Wardrobe for Bedroom',
    stockQuantity: 15,
    price: 56,
    thumbnail: RImages.productImage18,
    description:
        'This is a Product description for Bedroom Wardrobe. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '8', image: RImages.kenwoodLogo, name: 'Kenwood'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '11',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  //Kitchen
  ProductModel(
    id: '026',
    title: 'Kitchen Counter',
    stockQuantity: 15,
    price: 1012,
    thumbnail: RImages.productImage31,
    description:
        'This is a Product description for Kitchen Counter. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '2', image: RImages.adidasLogo, name: 'Adidas'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '12',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '027',
    title: 'Dinning Table',
    stockQuantity: 15,
    price: 1012,
    thumbnail: RImages.productImage32,
    description:
        'This is a Product description for Dinning Table. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '2', image: RImages.adidasLogo, name: 'Adidas'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '12',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '028',
    title: 'Refrigerator',
    stockQuantity: 15,
    price: 987,
    thumbnail: RImages.productImage33,
    description:
        'This is a Product description for Refrigerator. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '2', image: RImages.adidasLogo, name: 'Adidas'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '12',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  //Office
  ProductModel(
    id: '029',
    title: 'Office Chair Red',
    stockQuantity: 15,
    price: 150,
    thumbnail: RImages.productImage48,
    description:
        'This is a Product description for Office Chair. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '9', image: RImages.ikeaLogo, name: 'IKEA'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '13',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '030',
    title: 'Office Chair White',
    stockQuantity: 15,
    price: 140,
    thumbnail: RImages.productImage49,
    description:
        'This is a Product description for Office Chair. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '9', image: RImages.ikeaLogo, name: 'IKEA'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '13',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '031',
    title: 'Office Desk Red',
    stockQuantity: 15,
    price: 360,
    thumbnail: RImages.productImage50,
    description:
        'This is a Product description for Office Desk. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '9', image: RImages.ikeaLogo, name: 'IKEA'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '13',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '032',
    title: 'Office Desk brown',
    stockQuantity: 15,
    price: 400,
    thumbnail: RImages.productImage51,
    description:
        'This is a Product description for Office Desk. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '9', image: RImages.ikeaLogo, name: 'IKEA'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '13',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),

  ///Electronics
  //Laptops
  ProductModel(
    id: '033',
    title: 'Acer Laptop RAM 8gb to 16gb 512gb to 2tb',
    stockQuantity: 15,
    price: 950,
    isFeatured: true,
    thumbnail: RImages.productImage1,
    description:
        'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '10', image: RImages.acerLogo, name: 'Acer'),
    images: [
      RImages.productImage1,
      RImages.productImage2,
      RImages.productImage3,
      RImages.productImage4,
    ],
    salePrice: 800,
    sku: 'ABR4568',
    categoryId: '14',
    attributes: [
      ProductAttributesModel(name: 'Ram', values: ['6', '8', '16']),
      ProductAttributesModel(name: 'SSD', values: ['512', '1 tb', '2 tb']),
    ],
    variations: [
      ProductVariationModel(
        id: '1',
        stockQuantity: 16,
        price: 400,
        salePrice: 350,
        image: RImages.productImage1,
        description:
            'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
        attributeValues: {'Ram': '6', 'hard': '512'},
      ),
      ProductVariationModel(
        id: '2',
        stockQuantity: 15,
        price: 450,
        image: RImages.productImage2,
        attributeValues: {'Ram': '8', 'hard': '512'},
      ),
      ProductVariationModel(
        id: '3',
        stockQuantity: 14,
        price: 470,
        image: RImages.productImage3,
        attributeValues: {'Ram': '8', 'hard': '1 tb'},
      ),
      ProductVariationModel(
        id: '4',
        stockQuantity: 13,
        price: 500,
        image: RImages.productImage4,
        attributeValues: {'Ram': '16', 'hard': '512'},
      ),
      ProductVariationModel(
        id: '5',
        stockQuantity: 12,
        price: 650,
        image: RImages.productImage5,
        attributeValues: {'Ram': '16', 'hard': '1 tb'},
      ),
      ProductVariationModel(
        id: '6',
        stockQuantity: 11,
        price: 800,
        image: RImages.productImage6,
        attributeValues: {'Ram': '16', 'hard': '2 tb'},
      ),
    ],
    productType: ProductType.variable.name,
  ),
  ProductModel(
    id: '034',
    title: 'Acer Laptop 6gb 1tb',
    stockQuantity: 15,
    price: 400,
    thumbnail: RImages.productImage7,
    description:
        'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '10', image: RImages.acerLogo, name: 'Acer'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '14',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '035',
    title: 'Acer Laptop 6gb 500Gb',
    stockQuantity: 15,
    price: 400,
    thumbnail: RImages.productImage8,
    description:
        'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '10', image: RImages.acerLogo, name: 'Acer'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '14',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '036',
    title: 'Acer Laptop 4gb 500Gb',
    stockQuantity: 15,
    price: 400,
    thumbnail: RImages.productImage5,
    description:
        'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '10', image: RImages.acerLogo, name: 'Acer'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '14',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  //Mobiles
  ProductModel(
    id: '037',
    title: 'Iphone 13 pro 512gb',
    stockQuantity: 15,
    price: 999,
    thumbnail: RImages.productImage28,
    description:
        'This is a Product description for Iphone. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '5', image: RImages.appleLogo, name: 'Apple'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '15',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '038',
    title: 'Iphone 14 pro 512gb',
    stockQuantity: 15,
    price: 999,
    thumbnail: RImages.productImage29,
    description:
        'This is a Product description for Iphone. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '5', image: RImages.appleLogo, name: 'Apple'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '15',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '039',
    title: 'Iphone 14 white 512gb',
    stockQuantity: 15,
    price: 999,
    thumbnail: RImages.productImage30,
    description:
        'This is a Product description for Iphone. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '5', image: RImages.appleLogo, name: 'Apple'),
    // salePrice: 400,1
    sku: 'ABR4568',
    categoryId: '15',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
  ProductModel(
    id: '040',
    title: 'Iphone 12, 4 Colors 128gb and 256gb',
    stockQuantity: 15,
    price: 950,
    isFeatured: true,
    thumbnail: RImages.productImage24,
    description:
        'This is a Product description for Iphone 12. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '5', image: RImages.appleLogo, name: 'Apple'),
    images: [
      RImages.productImage24,
      RImages.productImage25,
      RImages.productImage26,
      RImages.productImage27,
    ],
    salePrice: 800,
    sku: 'ABR4568',
    categoryId: '15',
    attributes: [
      ProductAttributesModel(
        name: 'Color',
        values: ['Green', 'Red', 'Blue', 'Black'],
      ),
      ProductAttributesModel(name: 'Storage', values: ['128 gb', '256 gb']),
    ],
    variations: [
      ProductVariationModel(
        id: '1',
        stockQuantity: 16,
        price: 400,
        salePrice: 350,
        image: RImages.productImage27,
        description:
            'This is a Product description for Iphone 12. There are more things that can be added but i am just practicing and nothing else.',
        attributeValues: {'Color': 'Red', 'Storage': '128 gb'},
      ),
      ProductVariationModel(
        id: '2',
        stockQuantity: 15,
        price: 450,
        image: RImages.productImage27,
        attributeValues: {'Color': 'Red', 'Storage': '256 gb'},
      ),
      ProductVariationModel(
        id: '3',
        stockQuantity: 14,
        price: 470,
        image: RImages.productImage25,
        attributeValues: {'Color': 'Blue', 'Storage': '128 gb'},
      ),
      ProductVariationModel(
        id: '4',
        stockQuantity: 13,
        price: 500,
        image: RImages.productImage25,
        attributeValues: {'Color': 'Blue', 'Storage': '256 gb'},
      ),
      ProductVariationModel(
        id: '5',
        stockQuantity: 12,
        price: 650,
        image: RImages.productImage26,
        attributeValues: {'Color': 'Green', 'Storage': '128 gb'},
      ),
      ProductVariationModel(
        id: '6',
        stockQuantity: 12,
        price: 650,
        image: RImages.productImage26,
        attributeValues: {'Color': 'Green', 'Storage': '256 gb'},
      ),
      ProductVariationModel(
        id: '7',
        stockQuantity: 11,
        price: 800,
        image: RImages.productImage24,
        attributeValues: {'Color': 'Black', 'Storage': '128 gb'},
      ),
      ProductVariationModel(
        id: '8',
        stockQuantity: 11,
        price: 800,
        image: RImages.productImage24,
        attributeValues: {'Color': 'Black', 'Storage': '256 gb'},
      ),
    ],
    productType: ProductType.variable.name,
  ),
  ProductModel(
    id: '008',
    title: 'APPLE iPhone 8 (Black, 64 GB)',
    stockQuantity: 15,
    price: 480,
    isFeatured: true,
    thumbnail: RImages.productImage20,
    description:
        'This is a Product description for iphone 8. There are more things that can be added but i am just practicing and nothing else.',
    brand: BrandModel(id: '5', image: RImages.appleLogo, name: 'iphone 8'),
    images: [
      RImages.productImage20,
      RImages.productImage21,
      RImages.productImage22,
      RImages.productImage23,
    ],
    salePrice: 380,
    sku: 'ABR4568',
    categoryId: '4',
    attributes: [
      ProductAttributesModel(name: 'Size', values: ['EU34', 'EU32']),
      ProductAttributesModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
    ],
    productType: ProductType.single.name,
  ),
];

  /// -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: RImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    BrandModel(id: '2', image: RImages.adidasLogo, name: 'Adidas', productsCount: 95, isFeatured: true),
    BrandModel(id: '8', image: RImages.kenwoodLogo, name: 'Kenwood', productsCount: 36, isFeatured: false),
    BrandModel(id: '9', image: RImages.ikeaLogo, name: 'IKEA', productsCount: 36, isFeatured: false),
    BrandModel(id: '5', image: RImages.appleLogo, name: 'Apple', productsCount: 16, isFeatured: true),
    BrandModel(id: '10', image: RImages.acerLogo, name: 'Acer', productsCount: 36, isFeatured: false),
    BrandModel(id: '3', image: RImages.jordanLogo, name: 'Jordan', productsCount: 36, isFeatured: true),
    BrandModel(id: '4', image: RImages.pumaLogo, name: 'Puma', productsCount: 65, isFeatured: true),
    BrandModel(id: '6', image: RImages.zaraLogo, name: 'ZARA', productsCount: 36, isFeatured: true),
    BrandModel(id: '7', image: RImages.electronicsIcon, name: 'Samsung', productsCount: 36, isFeatured: false),
  ];


  /// -- List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),

    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),

    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),

    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),

    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),

    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),

    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),

    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),

    //040 after product 005
    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];

}

