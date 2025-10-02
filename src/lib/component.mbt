/// Web Component 基础接口定义
pub(open) trait WebComponent {
  /// 组件渲染方法，返回 HTML 字符串
  render(Self) -> String
  
  /// 组件连接到 DOM 时的回调
  connected_callback(Self) -> Unit = _
  
  /// 组件从 DOM 断开时的回调
  disconnected_callback(Self) -> Unit = _
  
  /// 属性变化时的回调
  attribute_changed_callback(Self, String, String?, String?) -> Unit = _
}

/// Web Component 默认实现
impl WebComponent with connected_callback(self) {
  // 默认空实现
  ()
}

impl WebComponent with disconnected_callback(self) {
  // 默认空实现
  ()
}

impl WebComponent with attribute_changed_callback(self, _name, _old_value, _new_value) {
  // 默认空实现
  ()
}