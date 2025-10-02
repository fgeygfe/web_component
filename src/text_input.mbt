/// 文本输入组件
struct TextInputComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[String]
}
fn TextInputComponent::new() -> TextInputComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new("")
  }
}
fn TextInputComponent::set_placeholder(self : TextInputComponent, placeholder : String) -> Unit {
  self.attributes.set("placeholder", placeholder)
}
fn TextInputComponent::get_value(self : TextInputComponent) -> String {
  self.state.get()
}
impl @lib.WebComponent for TextInputComponent with render(self) {
  let value = self.state.get()
  let placeholder = match self.attributes.get("placeholder") {
    Some(p) => p
    None => "Enter text..."
  }
  
  let attrs = Map::new()
  attrs["type"] = "text"
  attrs["value"] = value
  attrs["placeholder"] = placeholder
  attrs["class"] = "text-input-component"
  
  @lib.create_self_closing_element("input", attrs)
}