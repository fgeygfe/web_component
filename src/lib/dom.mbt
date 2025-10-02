/// DOM 操作辅助函数集合

/// 创建 HTML 元素标签
pub fn create_element(tag : String) -> String {
  "<\{tag}></" + tag + ">"
}

/// 创建带属性的 HTML 元素
pub fn create_element_with_attrs(tag : String, attrs : Map[String, String]) -> String {
  let attr_pairs = []
  attrs.each(fn(key, value) {
    attr_pairs.push(" \{key}=\"\{value}\"")
  })
  let attr_str = attr_pairs.join("")
  "<\{tag}\{attr_str}></" + tag + ">"
}

/// 创建自闭合标签
pub fn create_self_closing_element(tag : String, attrs : Map[String, String]) -> String {
  let attr_pairs = []
  attrs.each(fn(key, value) {
    attr_pairs.push(" \{key}=\"\{value}\"")
  })
  let attr_str = attr_pairs.join("")
  "<\{tag}\{attr_str} />"
}

/// 包装内容到指定标签中
pub fn wrap_content(tag : String, content : String, attrs : Map[String, String]) -> String {
  let attr_pairs = []
  attrs.each(fn(key, value) {
    attr_pairs.push(" \{key}=\"\{value}\"")
  })
  let attr_str = attr_pairs.join("")
  "<\{tag}\{attr_str}>\{content}</" + tag + ">"
}

/// 转义 HTML 特殊字符
/// 转义 HTML 特殊字符
pub fn escape_html(text : String) -> String {
  text
    .replace(old="&", new="&amp;")
    .replace(old="<", new="&lt;")
    .replace(old=">", new="&gt;")
    .replace(old="\"", new="&quot;")
    .replace(old="'", new="&#x27;")
}

/// 创建 CSS 类名字符串
pub fn join_classes(classes : Array[String]) -> String {
  classes.join(" ")
}

/// 创建内联样式字符串
pub fn create_style(styles : Map[String, String]) -> String {
  let style_pairs = []
  styles.each(fn(key, value) {
    style_pairs.push("\{key}: \{value}")
  })
  style_pairs.join("; ")
}