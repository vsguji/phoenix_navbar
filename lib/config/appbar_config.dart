import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_navbar/extension/appbar_total_config.dart';

import '../appbar_theme.dart' as phoenix;
import '../extension/appbar_default_config_utils.dart';
import '../extension/nav_assets.dart';

typedef WidgetBuilder = Widget Function();

/// Appbar主题配置
class AppBarConfig extends BaseConfig {
  /// BrnAppBar 主题配置，遵循外部主题配置
  /// 默认为 [BrnDefaultConfigUtils.defaultAppBarConfig]
  AppBarConfig({
    Color? backgroundColor,
    double? appBarHeight,
    WidgetBuilder? leadIconBuilder,
    BaseTextStyle? titleStyle,
    BaseTextStyle? actionsStyle,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    bool? showDefaultBottom,
    String configId = GLOBAL_CONFIG_ID,
  })  : _backgroundColor = backgroundColor,
        _appBarHeight = appBarHeight,
        _leadIconBuilder = leadIconBuilder,
        _titleStyle = titleStyle,
        _actionsStyle = actionsStyle,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize,
        _systemOverlayStyle = systemUiOverlayStyle,
        _showDefaultBottom = showDefaultBottom,
        super(configId: configId);

  AppBarConfig.dark({
    double? appBarHeight,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    String configId = GLOBAL_CONFIG_ID,
  })  : _appBarHeight = appBarHeight,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize,
        super(configId: configId) {
    _backgroundColor = const Color(0xff2E313B);
    _leadIconBuilder = () => Image.asset(
          NavBar.iconBackWhite,
          package: 'phoenix_navbar',
          width: phoenix.AppBarTheme.iconSize,
          height: phoenix.AppBarTheme.iconSize,
          fit: BoxFit.fitHeight,
        );
    _titleStyle = BaseTextStyle(
      fontSize: phoenix.AppBarTheme.titleFontSize,
      fontWeight: FontWeight.w600,
      color: phoenix.AppBarTheme.darkTextColor,
    );
    _actionsStyle = BaseTextStyle(
      color: phoenix.AppBarTheme.darkTextColor,
      fontSize: phoenix.AppBarTheme.actionFontSize,
      fontWeight: FontWeight.w600,
    );
    _systemOverlayStyle = SystemUiOverlayStyle.light;
  }

  AppBarConfig.light({
    double? appBarHeight,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    String configId = GLOBAL_CONFIG_ID,
  })  : _appBarHeight = appBarHeight,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize,
        super(configId: configId) {
    _backgroundColor = Colors.white;
    _leadIconBuilder = () => Image.asset(
          NavBar.iconBackBlack,
          package: 'phoenix_navbar',
          width: phoenix.AppBarTheme.iconSize,
          height: phoenix.AppBarTheme.iconSize,
          fit: BoxFit.fitHeight,
        );
    _titleStyle = BaseTextStyle(
      fontSize: phoenix.AppBarTheme.titleFontSize,
      fontWeight: FontWeight.w600,
      color: phoenix.AppBarTheme.lightTextColor,
    );
    _actionsStyle = BaseTextStyle(
      color: phoenix.AppBarTheme.lightTextColor,
      fontSize: phoenix.AppBarTheme.actionFontSize,
      fontWeight: FontWeight.w600,
    );
    _systemOverlayStyle = SystemUiOverlayStyle.dark;
  }

  /// AppBar 的背景色
  Color? _backgroundColor;

  Color get backgroundColor =>
      _backgroundColor ??
      BaseAppBarConfigUtils.defaultAppBarConfig.backgroundColor;

  /// AppBar 的高度
  double? _appBarHeight;

  double get appBarHeight =>
      _appBarHeight ?? BaseAppBarConfigUtils.defaultAppBarConfig.appBarHeight;

  /// 返回按钮的child widget，一般为Image
  WidgetBuilder? _leadIconBuilder;

  WidgetBuilder get leadIconBuilder =>
      _leadIconBuilder ??
      BaseAppBarConfigUtils.defaultAppBarConfig.leadIconBuilder;

  /// 标题样式，仅当直接 title 设置为 String 生效
  ///
  /// **注意**：`fontSize` 必须传大小，否则报错
  BaseTextStyle? _titleStyle;

  BaseTextStyle get titleStyle =>
      _titleStyle ?? BaseAppBarConfigUtils.defaultAppBarConfig.titleStyle;

  /// 右侧文字按钮样式，仅当直接actions里面元素为BrnTextAction类型生效
  ///
  /// **注意**：`fontSize` 必须传大小，否则报错
  ///
  /// BrnTextStyle(
  ///   color: AppBarBrightness(brightness).textColor,
  ///   fontSize: BrnAppBarTheme.actionFontSize,
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _actionsStyle;

  BaseTextStyle get actionsStyle =>
      _actionsStyle ?? BaseAppBarConfigUtils.defaultAppBarConfig.actionsStyle;

  /// AppBar title 的最大字符数 8
  int? _titleMaxLength;

  int get titleMaxLength =>
      _titleMaxLength ??
      BaseAppBarConfigUtils.defaultAppBarConfig.titleMaxLength;

  /// 左右边距
  double? _leftAndRightPadding;

  double get leftAndRightPadding =>
      _leftAndRightPadding ??
      BaseAppBarConfigUtils.defaultAppBarConfig.leftAndRightPadding;

  /// 元素间间距
  double? _itemSpacing;

  double get itemSpacing =>
      _itemSpacing ?? BaseAppBarConfigUtils.defaultAppBarConfig.itemSpacing;

  /// title的padding
  EdgeInsets? _titlePadding;

  EdgeInsets get titlePadding =>
      _titlePadding ?? BaseAppBarConfigUtils.defaultAppBarConfig.titlePadding;

  /// leadIcon 宽高，需要相同
  /// 默认为 20
  double? _iconSize;

  double get iconSize =>
      _iconSize ?? BaseAppBarConfigUtils.defaultAppBarConfig.iconSize;

  /// statusBar 样式
  /// 默认为 [SystemUiOverlayStyle.dark]
  SystemUiOverlayStyle? _systemOverlayStyle;

  SystemUiOverlayStyle get systemOverlayStyle =>
      _systemOverlayStyle ??
      BaseAppBarConfigUtils.defaultAppBarConfig.systemOverlayStyle;

  /// 是否展示Appbar bottom 分割线
  /// 默认为 [false]
  bool? _showDefaultBottom;

  bool get showDefaultBottom =>
      _showDefaultBottom ??
      BaseAppBarConfigUtils.defaultAppBarConfig.showDefaultBottom;

  @override
  void initThemeConfig(
    String configId, {
    BaseCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    /// 用户全局组件配置
    AppBarConfig appbarConfig =
        BaseThemeConfig.instance.getConfig(configId: configId).appBarConfig;

    _backgroundColor ??= appbarConfig._backgroundColor;
    _appBarHeight ??= appbarConfig._appBarHeight;
    _leadIconBuilder ??= appbarConfig._leadIconBuilder;
    _titleStyle = appbarConfig.titleStyle.merge(_titleStyle);
    _actionsStyle = appbarConfig.actionsStyle.merge(_actionsStyle);
    _titleMaxLength ??= appbarConfig._titleMaxLength;
    _leftAndRightPadding ??= appbarConfig._leftAndRightPadding;
    _itemSpacing ??= appbarConfig._itemSpacing;
    _titlePadding ??= appbarConfig._titlePadding;
    _iconSize ??= appbarConfig._iconSize;
    _systemOverlayStyle ??= appbarConfig._systemOverlayStyle;
    _showDefaultBottom ??= appbarConfig._showDefaultBottom;
  }

  AppBarConfig copyWith({
    Color? backgroundColor,
    double? appBarHeight,
    WidgetBuilder? leadIconBuilder,
    BaseTextStyle? titleStyle,
    BaseTextStyle? actionsStyle,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    bool? showDefaultBottom,
  }) {
    return AppBarConfig(
      backgroundColor: backgroundColor ?? _backgroundColor,
      appBarHeight: appBarHeight ?? _appBarHeight,
      leadIconBuilder: leadIconBuilder ?? _leadIconBuilder,
      titleStyle: titleStyle ?? _titleStyle,
      actionsStyle: actionsStyle ?? _actionsStyle,
      titleMaxLength: titleMaxLength ?? _titleMaxLength,
      leftAndRightPadding: leftAndRightPadding ?? _leftAndRightPadding,
      itemSpacing: itemSpacing ?? _itemSpacing,
      titlePadding: titlePadding ?? _titlePadding,
      iconSize: iconSize ?? _iconSize,
      systemUiOverlayStyle: systemUiOverlayStyle ?? _systemOverlayStyle,
      showDefaultBottom: showDefaultBottom ?? _showDefaultBottom,
    );
  }

  AppBarConfig merge(AppBarConfig? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other._backgroundColor,
      appBarHeight: other._appBarHeight,
      leadIconBuilder: other._leadIconBuilder,
      titleStyle: titleStyle.merge(other._titleStyle),
      actionsStyle: actionsStyle.merge(other._actionsStyle),
      titleMaxLength: other._titleMaxLength,
      leftAndRightPadding: other._leftAndRightPadding,
      itemSpacing: other._itemSpacing,
      titlePadding: other._titlePadding,
      iconSize: other._iconSize,
      systemUiOverlayStyle: other._systemOverlayStyle,
      showDefaultBottom: other._showDefaultBottom,
    );
  }
}
