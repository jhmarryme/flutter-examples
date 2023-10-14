///刷新状态
enum RefreshStatus {
  ///初次进入页面加载
  first,

  ///上拉加载
  pull,

  ///下拉加载
  down,

  /// 滚轮触发下拉加载
  wheelDown,
}
