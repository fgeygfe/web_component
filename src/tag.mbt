/// 标签组件
struct TagComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn TagComponent::new() -> TagComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(true)
  }
}
fn TagComponent::set_text(self : TagComponent, text : String) -> Unit {
  self.attributes.set("text", text)
}
fn TagComponent::set_color(self : TagComponent, color : String) -> Unit {
  self.attributes.set("color", color)
}
fn TagComponent::set_closable(self : TagComponent, closable : Bool) -> Unit {
  self.attributes.set("closable", if closable { "true" } else { "false" })
}
fn TagComponent::close(self : TagComponent) -> Unit {
  self.state.set(false)
}
impl @lib.WebComponent for TagComponent with render(self) {
  let visible = self.state.get()
  if not(visible) {
    return ""
  }
  
  let text = match self.attributes.get("text") {
    Some(t) => t
    None => "Tag"
  }
  
  let color = match self.attributes.get("color") {
    Some(c) => c
    None => "blue"
  }
  
  let closable = match self.attributes.get("closable") {
    Some(c) => c == "true"
    None => false
  }
  
  let attrs = Map::new()
  attrs["class"] = "tag-component tag-" + color
  
  let close_btn = if closable { "<span class=\"tag-close\" onclick=\"closeTag()\">×</span>" } else { "" }
  let content = text + close_btn
  
  @lib.wrap_content("span", content, attrs)
}