class RPricingCalculator {
  // Calculate Price based on tax and shipping

  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shipping = getShippingCostForLocation(location);

    double totalPrice = productPrice + taxAmount + shipping;

    return totalPrice;
  }

  // Calculate Shipping Cost

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCostForLocation(location);
    if (shippingCost == 0) {
      return 'Free Shipping';
    } else {
      return shippingCost.toStringAsFixed(2);
    }
  }

  // Calculate Tax

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxForLocation(String location) {
    // Example tax rates based on location
    // ! Later get The tax rates from a database or API
    switch (location.toLowerCase()) {
      case 'california':
        return 0.075; // 7.5% tax
      case 'new york':
        return 0.088; // 8.8% tax
      case 'texas':
        return 0.0625; // 6.25% tax
      default:
        return 0.05; // Default tax rate of 5%
    }
  }

  static double getShippingCostForLocation(String location) {
    // Example shipping costs based on location
    // ! Later get The shipping costs from a database or API
    switch (location.toLowerCase()) {
      case 'california':
        return 5.99; // $5.99 shipping
      case 'new york':
        return 7.99; // $7.99 shipping
      case 'texas':
        return 4.99; // $4.99 shipping
      default:
        return 9.99; // Default shipping cost of $9.99
    }
  }

  /// Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   double total = 0.0;
  //   for (var item in cart.items) {
  //     total += item.price * item.quantity;
  //   }
  //   return total;
  // }
}
