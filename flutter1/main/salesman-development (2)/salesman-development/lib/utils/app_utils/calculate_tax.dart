import 'package:salesman_app/model/search_products_model/search_products_res_model.dart';


class Calculations {
  static double getPriceWithTotalTax({required searchProducts? item}) {
    int? tax = 0;
    double? regularTaxWithTax = 0;
    int gst = item?.gst ?? 0;
    int igst = item?.igst ?? 0;
    int cgst = item?.cgst ?? 0;
    int sgst = item?.sgst ?? 0;

    tax = gst + igst + cgst + sgst;
    int totalTax = (item?.regularPrice ?? 0) * tax;
    double divideTax = totalTax / 100;
    regularTaxWithTax = (item?.regularPrice ?? 0) + divideTax;

    return regularTaxWithTax;
  }

  static double getPriceWithMarketPrice({required searchProducts? item}) {
    int? tax = 0;
    double? regularTaxWithTax = 0;
    int gst = item?.gst ?? 0;
    int igst = item?.igst ?? 0;
    int cgst = item?.cgst ?? 0;
    int sgst = item?.sgst ?? 0;

    tax = gst + igst + cgst + sgst;
    int totalTax = (item?.marketPrice ?? 0) * tax;
    double divideTax = totalTax / 100;
    regularTaxWithTax = (item?.marketPrice ?? 0) + divideTax;
    return regularTaxWithTax;
  }

  static int getTotalTax({required searchProducts? item}) {
    int? tax = 0;

    int gst = item?.gst ?? 0;
    int igst = item?.igst ?? 0;
    int cgst = item?.cgst ?? 0;
    int sgst = item?.sgst ?? 0;

    tax = gst + igst + cgst + sgst;
    return tax;
  }
}
