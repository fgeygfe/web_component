/// 组件事件类型
pub enum ComponentEvent {
  /// 点击事件
  Click(String)
  /// 输入事件
  Input(String, String)
  /// 变化事件
  Change(String, String)
  /// 焦点事件
  Focus(String)
  /// 失焦事件
  Blur(String)
  /// 自定义事件
  Custom(String, String)
}

/// 事件处理器管理器
pub struct EventHandler {
  handlers : Map[String, Array[(ComponentEvent) -> Unit]]
}

/// 创建新的事件处理器
pub fn EventHandler::new() -> EventHandler {
  { handlers: Map::new() }
}

/// 添加事件监听器
pub fn EventHandler::on(
  self : EventHandler, 
  event_type : String, 
  handler : (ComponentEvent) -> Unit
) -> Unit {
  match self.handlers.get(event_type) {
    Some(handlers) => {
      handlers.push(handler)
    }
    None => {
      let new_handlers = [handler]
      self.handlers[event_type] = new_handlers
    }
  }
}

/// 移除事件监听器
pub fn EventHandler::off(
  self : EventHandler,
  event_type : String
) -> Unit {
  self.handlers.remove(event_type) |> ignore
}

/// 触发事件
pub fn EventHandler::emit(
  self : EventHandler,
  event_type : String,
  event : ComponentEvent
) -> Unit {
  match self.handlers.get(event_type) {
    Some(handlers) => {
      for i = 0; i < handlers.length(); i = i + 1 {
        let handler = handlers[i]
        handler(event)
      }
    }
    None => ()
  }
}

/// 检查是否有特定类型的监听器
pub fn EventHandler::has_listeners(self : EventHandler, event_type : String) -> Bool {
  match self.handlers.get(event_type) {
    Some(handlers) => handlers.length() > 0
    None => false
  }
}

/// 获取所有事件类型
pub fn EventHandler::get_event_types(self : EventHandler) -> Array[String] {
  let types = []
  self.handlers.each(fn(event_type, _handlers) { types.push(event_type) })
  types
}

/// 清空所有事件处理器
pub fn EventHandler::clear(self : EventHandler) -> Unit {
  self.handlers.clear()
}

/// 事件类型常量
pub const EVENT_CLICK : String = "click"
pub const EVENT_INPUT : String = "input"  
pub const EVENT_CHANGE : String = "change"
pub const EVENT_FOCUS : String = "focus"
pub const EVENT_BLUR : String = "blur"