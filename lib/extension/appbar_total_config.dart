/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-21 16:23:36
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-21 16:27:21
 * @FilePath: /phoenix_navbar/lib/extension/appbar_total_config.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:phoenix_base/phoenix.dart';

import '../config/appbar_config.dart';
import 'appbar_default_config_utils.dart';

class AppBarTotalConfig extends BaseTotalConfig {
  AppBarTotalConfig({AppBarConfig? appBarConfig})
      : _appBarConfig = appBarConfig;

  AppBarConfig? _appBarConfig;

  AppBarConfig get buttonConfig =>
      _appBarConfig ?? BaseAppBarConfigUtils.defaultAppBarConfig;

  @override
  void initThemeConfig(String configId) {
    super.initThemeConfig(configId);
    _appBarConfig ??= AppBarConfig();
    buttonConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
  }
}

extension BaseAppBarTotalConfig on BaseTotalConfig {
  static AppBarConfig? _appBarConfig;
  AppBarConfig get appBarConfig =>
      _appBarConfig ?? BaseAppBarConfigUtils.defaultAppBarConfig;
  set buttonTotalConfig(AppBarTotalConfig config) {
    _appBarConfig = config.buttonConfig;
  }
}
