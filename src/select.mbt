/// 下拉选择组件
struct SelectComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[String]
}
fn SelectComponent::new() -> SelectComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new("")
  }
}
fn SelectComponent::add_option(self : SelectComponent, value : String, text : String) -> Unit {
  let options = match self.attributes.get("options") {
    Some(o) => o
    None => ""
  }
  let new_options = if options == "" { "\{value}|\{text}" } else { options + ";\{value}|\{text}" }
  self.attributes.set("options", new_options)
}
fn SelectComponent::set_selected(self : SelectComponent, value : String) -> Unit {
  self.state.set(value)
}
impl @lib.WebComponent for SelectComponent with render(self) {
  let selected_value = self.state.get()
  let options_data = match self.attributes.get("options") {
    Some(o) => o
    None => "option1|Option 1;option2|Option 2"
  }
  
  let attrs = Map::new()
  attrs["class"] = "select-component"
  attrs["onchange"] = "handleSelectChange()"
  
  // 简化的选项渲染
  let options_html = "<option value=\"\">Select an option</option>"
  
  @lib.wrap_content("select", options_html, attrs)
}