/// CSS 样式规则
pub struct StyleRule {
  selector : String
  properties : Map[String, String]
}

/// CSS 样式表
pub struct StyleSheet {
  rules : Array[StyleRule]
  media_queries : Map[String, Array[StyleRule]]
}

/// 创建新的样式表
pub fn StyleSheet::new() -> StyleSheet {
  { 
    rules: Array::new(),
    media_queries: Map::new()
  }
}

/// 添加样式规则
pub fn StyleSheet::add_rule(
  self : StyleSheet, 
  selector : String, 
  properties : Map[String, String]
) -> Unit {
  let rule = StyleRule::{ selector, properties }
  self.rules.push(rule)
}

/// 添加媒体查询规则
pub fn StyleSheet::add_media_rule(
  self : StyleSheet,
  media : String,
  selector : String,
  properties : Map[String, String]
) -> Unit {
  let rule = StyleRule::{ selector, properties }
  match self.media_queries.get(media) {
    Some(rules) => rules.push(rule)
    None => {
      let new_rules = Array::new()
      new_rules.push(rule)
      self.media_queries[media] = new_rules
    }
  }
}

/// 生成 CSS 字符串
pub fn StyleSheet::to_css(self : StyleSheet) -> String {
  let mut css = ""
  
  // 普通规则
  for rule in self.rules {
    css = css + rule_to_css(rule) + "\n"
  }
  
  // 媒体查询规则
  self.media_queries.each(fn(media, rules) {
    css = css + "@media \{media} {\n"
    for rule in rules {
      css = css + "  " + rule_to_css(rule).replace(old="\n", new="\n  ") + "\n"
    }
    css = css + "}\n"
  })
  
  css
}

/// 将单个规则转换为 CSS
fn rule_to_css(rule : StyleRule) -> String {
  let mut properties = ""
  rule.properties.each(fn(property, value) {
    properties = properties + "  \{property}: \{value};\n"
  })
  "\{rule.selector} {\n\{properties}}"
}

/// 创建样式属性映射
pub fn create_style_properties() -> Map[String, String] {
  Map::new()
}

/// 添加样式属性
pub fn add_style_property(
  properties : Map[String, String],
  property : String,
  value : String
) -> Unit {
  properties[property] = value
}

/// 合并样式表
pub fn merge_stylesheets(sheets : Array[StyleSheet]) -> StyleSheet {
  let merged = StyleSheet::new()
  
  for sheet in sheets {
    for rule in sheet.rules {
      merged.rules.push(rule)
    }
    
    sheet.media_queries.each(fn(media, rules) {
      for rule in rules {
        merged.add_media_rule(media, rule.selector, rule.properties)
      }
    })
  }
  
  merged
}

/// CSS 工具函数
pub fn create_component_styles(component_name : String) -> StyleSheet {
  let styles = StyleSheet::new()
  
  // 为组件添加基础样式作用域
  let base_selector = ".\{component_name}"
  let base_properties = create_style_properties()
  add_style_property(base_properties, "display", "block")
  
  styles.add_rule(base_selector, base_properties)
  styles
}