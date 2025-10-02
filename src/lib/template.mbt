/// 简单模板引擎
pub fn template(html : String, data : Map[String, String]) -> String {
  let mut result = html
  data.each(fn(key, value) {
    let placeholder = "{{\{key}}}"
    result = result.replace(old=placeholder, new=value)
  })
  result
}
/// 条件渲染
pub fn conditional_render(condition : Bool, content : String) -> String {
  if condition { content } else { "" }
}
/// 列表渲染
pub fn list_render[T](items : Array[T], renderer : (T) -> String) -> String {
  let mut result = ""
  for item in items {
    result = result + renderer(item)
  }
  result
}
/// 创建模板数据
pub fn create_template_data() -> Map[String, String] {
  Map::new()
}
/// 向模板数据添加键值对
pub fn add_template_data(data : Map[String, String], key : String, value : String) -> Unit {
  data[key] = value
}
/// 模板片段组合
pub fn combine_templates(templates : Array[String]) -> String {
  templates.join("")
}
/// 安全的模板渲染（转义 HTML）
pub fn safe_template(html : String, data : Map[String, String]) -> String {
  let mut result = html
  data.each(fn(key, value) {
    let placeholder = "{{\{key}}}"
    let escaped_value = escape_html(value)
    result = result.replace(old=placeholder, new=escaped_value)
  })
  result
}
/// 嵌套模板渲染
pub fn nested_template(
  outer_template : String,
  inner_templates : Map[String, String],
  data : Map[String, String]
) -> String {
  let mut result = outer_template
  
  // 先渲染内部模板
  inner_templates.each(fn(key, inner_template) {
    let rendered_inner = template(inner_template, data)
    let placeholder = "{{>\{key}}}"
    result = result.replace(old=placeholder, new=rendered_inner)
  })
  
  // 再渲染外部数据
  template(result, data)
}