/// 复选框组件
struct CheckboxComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn CheckboxComponent::new() -> CheckboxComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(false)
  }
}
fn CheckboxComponent::set_label(self : CheckboxComponent, label : String) -> Unit {
  self.attributes.set("label", label)
}
fn CheckboxComponent::toggle(self : CheckboxComponent) -> Unit {
  let current = self.state.get()
  self.state.set(not(current))
}
fn CheckboxComponent::is_checked(self : CheckboxComponent) -> Bool {
  self.state.get()
}
impl @lib.WebComponent for CheckboxComponent with render(self) {
  let label = match self.attributes.get("label") {
    Some(l) => l
    None => "Checkbox"
  }
  
  let checked = self.state.get()
  
  let input_attrs = Map::new()
  input_attrs["type"] = "checkbox"
  input_attrs["class"] = "checkbox-input"
  input_attrs["onclick"] = "toggleCheckbox()"
  if checked {
    input_attrs["checked"] = "true"
  }
  
  let checkbox_input = @lib.create_self_closing_element("input", input_attrs)
  let label_element = @lib.wrap_content("label", checkbox_input + label, Map::new())
  
  let attrs = Map::new()
  attrs["class"] = "checkbox-component"
  
  @lib.wrap_content("div", label_element, attrs)
}