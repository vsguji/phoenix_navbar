/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-21 16:12:54
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-11 23:08:47
 * @FilePath: /phoenix_navbar/lib/extension/appbar_default_config_utils.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix_base/phoenix.dart';

import '../appbar_theme.dart' as phoenix;
import '../config/appbar_config.dart';
import 'nav_assets.dart';

extension BaseAppBarConfigUtils on BaseDefaultConfigUtils {
  /// 导航栏配置
  static AppBarConfig defaultAppBarConfig = AppBarConfig(
    backgroundColor: Colors.white,
    appBarHeight: phoenix.AppBarTheme.appBarHeight,
    leadIconBuilder: () => Image.asset(
      NavBar.iconBackBlack,
      package: 'phoenix_navbar', //BaseStrings.flutterPackageName,
      width: phoenix.AppBarTheme.iconSize,
      height: phoenix.AppBarTheme.iconSize,
      fit: BoxFit.fitHeight,
    ),
    titleStyle: BaseTextStyle(
      fontSize: phoenix.AppBarTheme.titleFontSize,
      fontWeight: FontWeight.w600,
      color: phoenix.AppBarTheme.lightTextColor,
    ),
    actionsStyle: BaseTextStyle(
      color: phoenix.AppBarTheme.lightTextColor,
      fontSize: phoenix.AppBarTheme.actionFontSize,
      fontWeight: FontWeight.w600,
    ),
    titleMaxLength: phoenix.AppBarTheme.maxLength,
    leftAndRightPadding: 20.0,
    itemSpacing: phoenix.AppBarTheme.iconMargin,
    titlePadding: EdgeInsets.zero,
    iconSize: phoenix.AppBarTheme.iconSize,
    configId: PHOENIX_CONFIG_ID,
    systemUiOverlayStyle: SystemUiOverlayStyle.dark,
    showDefaultBottom: false,
  );
}
