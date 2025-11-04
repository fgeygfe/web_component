/// 搜索框组件
struct SearchComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[String]
}
fn SearchComponent::new() -> SearchComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new("")
  }
}
fn SearchComponent::set_placeholder(self : SearchComponent, placeholder : String) -> Unit {
  self.attributes.set("placeholder", placeholder)
}
fn SearchComponent::get_query(self : SearchComponent) -> String {
  self.state.get()
}
fn SearchComponent::clear(self : SearchComponent) -> Unit {
  self.state.set("")
}
impl @lib.WebComponent for SearchComponent with render(self) {
  let query = self.state.get()
  let placeholder = match self.attributes.get("placeholder") {
    Some(p) => p
    None => "Search..."
  }
  
  let container_attrs = Map::new()
  container_attrs["class"] = "search-component"
  
  let input_attrs = Map::new()
  input_attrs["type"] = "text"
  input_attrs["value"] = query
  input_attrs["placeholder"] = placeholder
  input_attrs["class"] = "search-input"
  input_attrs["oninput"] = "handleSearch()"
  
  let button_attrs = Map::new()
  button_attrs["class"] = "search-button"
  button_attrs["onclick"] = "performSearch()"
  
  let input = @lib.create_self_closing_element("input", input_attrs)
  let button = @lib.wrap_content("button", "🔍", button_attrs)
  let content = input + button
  
  @lib.wrap_content("div", content, container_attrs)
}