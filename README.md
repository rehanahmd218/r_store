# RStore

A comprehensive, full-featured modern E-commerce application built with Flutter, Firebase, and GetX.

## Video Demo

*(Upload your video demo here)*

## 🚀 Key Features

*   **Robust Authentication:** Secure Login and Sign-Up flows including Google Sign-In, Email/Password authentication, and Password Recovery.
*   **Intuitive Onboarding:** Engaging onboarding screens to welcome new users.
*   **Product Discovery:**
    *   Dynamic Home and Store screens with categorized product feeds.
    *   Browse by Subcategories and Brands.
    *   Search and filter through all products.
*   **Rich Product Details:** Detailed product views supporting multiple images, descriptions, variations, and user reviews.
*   **Shopping Cart & Checkout:** Seamless cart management and a smooth, multi-step checkout process.
*   **Order Management:** Track order history and current order status.
*   **User Personalization:**
    *   Manage personal profiles and settings.
    *   Save favorite items to a Wishlist.
    *   Manage multiple shipping Addresses.
*   **Modern UI/UX:** Built with beautiful animations (Lottie), smooth page indicators, skeleton loading screens (Shimmer), and image caching.
*   **State Management:** Highly responsive performance powered by GetX.

## 🛠️ Technologies & Architecture

This project is built using modern mobile development best practices and top-tier dependencies:

*   **Framework:** Flutter (Dart)
*   **Backend as a Service (BaaS):** Firebase
    *   *Firebase Auth:* User authentication & identity.
    *   *Cloud Firestore:* NoSQL database for products, users, and orders.
    *   *Firebase Storage:* Cloud storage for user and product images.
*   **State Management & Routing:** GetX (`get`) for reactive state management, dependency injection, and efficient route navigation.
*   **Local Storage:** `get_storage` for fast, key-value pair local data persistence.
*   **UI Libraries:**
    *   `iconsax`, `cupertino_icons` for premium iconography.
    *   `lottie` for engaging vector animations.
    *   `shimmer` for beautiful skeleton loading effects.
    *   `carousel_slider`, `smooth_page_indicator` for interactive carousels.
    *   `cached_network_image` for optimized image loading and caching.
*   **Device Integrations:** `image_picker` for camera/gallery access, `connectivity_plus` for network state monitoring.

## 📁 Project Structure

The codebase follows a clean, feature-first architectural pattern ensuring scalability and maintainability:

```text
lib/
├── bindings/        # GetX bindings for dependency injection
├── common/          # Shared, reusable widgets and styles
├── data/            # Repositories, API services, and mock data
├── features/        # Core application features
│   ├── authentication/ # Login, Signup, Onboarding, Password Config
│   ├── personalizations/ # Profile, Settings, Addresses
│   └── shop/           # Home, Cart, Checkout, Orders, Products, Wishlist, Reviews
├── localization/    # Language and translation files
└── utils/           # Helper functions, constants, theme, formatters, and device utilities
```

## 🔒 Privacy & Security Notes

*   **Authentication Data:** All user credentials and authentication tokens are securely handled by Firebase Auth.
*   **Database Security:** Cloud Firestore employs security rules to ensure users can only access and modify their own personal data and orders.
*   **Local Data:** Sensitive user preferences are stored securely using GetX local storage mechanisms.
