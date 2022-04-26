import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_paraguay/shared/themes/colors.dart';

class AppTextStyles {
  static final TextStyle text14boldW600cinza = GoogleFonts.openSans(
    color: AppColors.cinzaFraco,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle text14boldW600preto = GoogleFonts.openSans(
    color: AppColors.cinzaForte,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle text22boldW600 = GoogleFonts.openSans(
    color: AppColors.preto,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
}
