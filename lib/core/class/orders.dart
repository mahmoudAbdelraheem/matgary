class Orders {
  static String printPaymentMethod(String val) {
    if (val == '0') {
      return "Card Payment";
    } else {
      return "Cash Payment";
    }
  }

  static String printOrderType(String val) {
    if (val == '0') {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  static String printOrderStatus(String val) {
    if (val == '0') {
      return "Pending Approval";
    } else if (val == '1') {
      return "On The Way";
    } else if (val == '2') {
      return "Archived Order";
    } else {
      return "Cancled";
    }
  }
}
