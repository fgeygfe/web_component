/// 标签页组件
struct TabComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Int]
}
fn TabComponent::new() -> TabComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(0)
  }
}
fn TabComponent::add_tab(self : TabComponent, title : String, content : String) -> Unit {
  let tabs = match self.attributes.get("tabs") {
    Some(t) => t
    None => ""
  }
  let new_tabs = if tabs == "" { "\{title}|\{content}" } else { tabs + ";\{title}|\{content}" }
  self.attributes.set("tabs", new_tabs)
}
fn TabComponent::set_active_tab(self : TabComponent, index : Int) -> Unit {
  self.state.set(index)
}
impl @lib.WebComponent for TabComponent with render(self) {
  let active_index = self.state.get()
  let tabs_data = match self.attributes.get("tabs") {
    Some(t) => t
    None => "Tab 1|Content 1;Tab 2|Content 2"
  }
  
  let attrs = Map::new()
  attrs["class"] = "tab-component"
  
  // 简化的标签页渲染逻辑
  let tab_headers = "<div class=\"tab-headers\">Tab Headers</div>"
  let tab_content = "<div class=\"tab-content\">Active Tab Content</div>"
  let content = tab_headers + tab_content
  
  @lib.wrap_content("div", content, attrs)
}