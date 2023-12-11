import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:test_in_action/common/http/model/paging_data_entity.dart';
import 'package:test_in_action/models/http/page_request_entity.dart';

abstract class PageDataGridSource<T> extends DataGridSource {
  /// 初始化数据
  PageDataGridSource() {
    onLoadRefresh();
  }

  // 当前页数
  final page = 1.obs;

  // 每页数据的数量
  final rowsPerPage = 5.obs;

  // 总数据的数量
  final total = 0.obs;

  // 总页数
  final pageCount = 1.0.obs;

  // 数据列表
  final records = [].obs;

  // 保留字段
  final initial = false;

  // pageRequest
  final PageRequestEntity _pageRequest = PageRequestEntity();

  /// 提供一个分页请求参数, 如果需要可以自行修改
  get pageRequest {
    _pageRequest.page = page.value;
    _pageRequest.size = rowsPerPage.value;
    return _pageRequest;
  }

  /// 页码变化的响应事件
  /// 当页面发生改变时,加载新的数据
  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    // int startIndex = newPageIndex * rowsPerPage.value;
    // int endIndex = startIndex + rowsPerPage.value;
    // if (startIndex < records.length && endIndex <= records.length) {
    //   await Future.delayed(Duration(milliseconds: 2000));
    //   await onLoadPage(newPageIndex + 1);
    //   notifyListeners();
    // } else {
    //   records.clear();
    // }
    if (oldPageIndex != newPageIndex) {
      await onLoadPage(newPageIndex + 1);
    }
    return true;
  }

  /// 保留方法,加载下一页
  onLoadMore() async {
    ++page.value;
    await requestData();
  }

  /// 刷新,即加载第一页的数据
  onLoadRefresh() async {
    page.value = 1;
    await requestData();
  }

  /// 加载第N页的数据,
  onLoadPage(int newPage) async {
    page.value = newPage;
    await requestData();
  }

  /// 适用于后端请求结束后调用，由requestData方法调用
  void onFinishRequest(PagingDataEntity<T>? pageData) {
    if (pageData != null) {
      rowsPerPage.value = pageData.size ?? 0;
      total.value = pageData.total ?? 0;
      var count = (total.value / rowsPerPage.value).ceilToDouble();
      pageCount.value = count == 0 ? 1 : count;
      records.clear();
      records.addAll(pageData.records ?? []);
      buildDataGridRows();
      notifyListeners();
    }
  }

  /// 由子类在该方法中实现调用后端请求
  /// 请求完成后需要手动调用onFinishRequest
  Future<void> requestData();

  /// 在该方法中完成将后端数据转换为List<DataGridRow>的逻辑, 最终提供给rows使用
  void buildDataGridRows();

  /// 定义表格的表头
  List<GridColumn> get columns;
}
