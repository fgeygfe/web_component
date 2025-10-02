/// 组件属性管理器
pub struct ComponentAttributes {
  attributes : Map[String, String]
}

/// 创建新的属性管理器
pub fn ComponentAttributes::new() -> ComponentAttributes {
  { attributes: Map::new() }
}

/// 获取属性值
pub fn ComponentAttributes::get(self : ComponentAttributes, key : String) -> String? {
  self.attributes.get(key)
}

/// 设置属性值
pub fn ComponentAttributes::set(self : ComponentAttributes, key : String, value : String) -> Unit {
  self.attributes[key] = value
}

/// 删除属性
pub fn ComponentAttributes::remove(self : ComponentAttributes, key : String) -> Unit {
  self.attributes.remove(key)
}

/// 检查属性是否存在
pub fn ComponentAttributes::has(self : ComponentAttributes, key : String) -> Bool {
  self.attributes.contains(key)
}

/// 获取所有属性键
pub fn ComponentAttributes::keys(self : ComponentAttributes) -> Array[String] {
  let keys = []
  self.attributes.each(fn(key, _value) { keys.push(key) })
  keys
}

/// 清空所有属性
pub fn ComponentAttributes::clear(self : ComponentAttributes) -> Unit {
  self.attributes.clear()
}