/// 组件生命周期阶段
pub enum LifecyclePhase {
  Created
  Mounted
  Updated
  Unmounted
}
/// 组件生命周期管理器
pub struct LifecycleManager {
  mut mounted_components : Array[String]
  lifecycle_hooks : Map[String, Array[(LifecyclePhase) -> Unit]]
}
/// 创建新的生命周期管理器
pub fn LifecycleManager::new() -> LifecycleManager {
  { 
    mounted_components: Array::new(),
    lifecycle_hooks: Map::new()
  }
}
/// 挂载组件
pub fn LifecycleManager::mount[T : WebComponent](self : LifecycleManager, component : T, component_id : String) -> Unit {
  self.mounted_components.push(component_id)
  component.connected_callback()
  self.trigger_hooks("mount", LifecyclePhase::Mounted)
}
/// 卸载组件
pub fn LifecycleManager::unmount[T : WebComponent](self : LifecycleManager, component : T, component_id : String) -> Unit {
  component.disconnected_callback()
  
  // 从已挂载列表中移除组件ID
  let new_components = Array::new()
  for mounted_id in self.mounted_components {
    if mounted_id != component_id {
      new_components.push(mounted_id)
    }
  }
  self.mounted_components = new_components
  
  self.trigger_hooks("unmount", LifecyclePhase::Unmounted)
}
/// 卸载所有组件
pub fn LifecycleManager::unmount_all(self : LifecycleManager) -> Unit {
  self.mounted_components.clear()
  self.trigger_hooks("unmount_all", LifecyclePhase::Unmounted)
}
/// 添加生命周期钩子
pub fn LifecycleManager::add_hook(
  self : LifecycleManager,
  phase : String,
  hook : (LifecyclePhase) -> Unit
) -> Unit {
  match self.lifecycle_hooks.get(phase) {
    Some(hooks) => hooks.push(hook)
    None => {
      let new_hooks = Array::new()
      new_hooks.push(hook)
      self.lifecycle_hooks[phase] = new_hooks
    }
  }
}
/// 触发生命周期钩子
fn LifecycleManager::trigger_hooks(
  self : LifecycleManager,
  phase : String,
  lifecycle_phase : LifecyclePhase
) -> Unit {
  match self.lifecycle_hooks.get(phase) {
    Some(hooks) => {
      for hook in hooks {
        hook(lifecycle_phase)
      }
    }
    None => ()
  }
}
/// 获取已挂载组件数量
pub fn LifecycleManager::get_mounted_count(self : LifecycleManager) -> Int {
  self.mounted_components.length()
}
/// 检查是否有已挂载的组件
pub fn LifecycleManager::has_mounted_components(self : LifecycleManager) -> Bool {
  self.mounted_components.length() > 0
}
/// 清空所有生命周期钩子
pub fn LifecycleManager::clear_hooks(self : LifecycleManager) -> Unit {
  self.lifecycle_hooks.clear()
}
/// 组件更新通知
pub fn LifecycleManager::notify_update[T : WebComponent](self : LifecycleManager, component : T) -> Unit {
  self.trigger_hooks("update", LifecyclePhase::Updated)
}
/// 全局生命周期管理器实例
let global_lifecycle_manager : LifecycleManager = LifecycleManager::new()
/// 获取全局生命周期管理器
pub fn get_global_lifecycle_manager() -> LifecycleManager {
  global_lifecycle_manager
}