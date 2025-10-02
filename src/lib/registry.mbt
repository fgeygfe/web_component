/// 组件注册器
pub struct ComponentRegistry {
  components : Map[String, () -> String]
}
/// 创建新的组件注册器
pub fn ComponentRegistry::new() -> ComponentRegistry {
  { components: Map::new() }
}
/// 注册组件
pub fn ComponentRegistry::register[T : WebComponent](
  self : ComponentRegistry, 
  name : String, 
  factory : () -> T
) -> Unit {
  self.components[name] = fn() { factory().render() }
}
/// 创建组件实例（返回渲染后的HTML字符串）
pub fn ComponentRegistry::create(self : ComponentRegistry, name : String) -> String? {
  match self.components.get(name) {
    Some(factory) => Some(factory())
    None => None
  }
}
/// 检查组件是否已注册
pub fn ComponentRegistry::is_registered(self : ComponentRegistry, name : String) -> Bool {
  self.components.contains(name)
}
/// 获取所有已注册的组件名称
pub fn ComponentRegistry::get_registered_names(self : ComponentRegistry) -> Array[String] {
  let names = Array::new()
  self.components.each(fn(name, _factory) {
    names.push(name)
  })
  names
}
/// 取消注册组件
pub fn ComponentRegistry::unregister(self : ComponentRegistry, name : String) -> Unit {
  self.components.remove(name) |> ignore
}
/// 清空所有注册的组件
pub fn ComponentRegistry::clear(self : ComponentRegistry) -> Unit {
  self.components.clear()
}
/// 创建全局注册器实例
let global_registry : ComponentRegistry = ComponentRegistry::new()
/// 获取全局组件注册器
pub fn get_global_registry() -> ComponentRegistry {
  global_registry
}