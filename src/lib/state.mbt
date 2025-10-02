/// 组件状态管理器
pub struct ComponentState[T] {
  mut state : T
  listeners : Array[(T) -> Unit]
}

/// 创建新的状态管理器
pub fn ComponentState::new[T](initial : T) -> ComponentState[T] {
  { state: initial, listeners: Array::new() }
}

/// 获取当前状态
pub fn ComponentState::get[T](self : ComponentState[T]) -> T {
  self.state
}

/// 设置新状态并通知监听器
pub fn ComponentState::set[T](self : ComponentState[T], new_state : T) -> Unit {
  let old_state = self.state
  self.state = new_state
  
  // 通知所有监听器
  for listener in self.listeners {
    listener(new_state)
  }
}

/// 添加状态变化监听器
pub fn ComponentState::subscribe[T](self : ComponentState[T], listener : (T) -> Unit) -> Unit {
  self.listeners.push(listener)
}

/// 更新状态（使用更新函数）
pub fn ComponentState::update[T](self : ComponentState[T], updater : (T) -> T) -> Unit {
  let new_state = updater(self.state)
  self.set(new_state)
}

/// 清空所有监听器
pub fn ComponentState::clear_listeners[T](self : ComponentState[T]) -> Unit {
  self.listeners.clear()
}