/// 切换开关组件
struct ToggleSwitchComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn ToggleSwitchComponent::new() -> ToggleSwitchComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(false)
  }
}
fn ToggleSwitchComponent::set_label(self : ToggleSwitchComponent, label : String) -> Unit {
  self.attributes.set("label", label)
}
fn ToggleSwitchComponent::toggle(self : ToggleSwitchComponent) -> Unit {
  let current = self.state.get()
  self.state.set(not(current))
}
fn ToggleSwitchComponent::is_on(self : ToggleSwitchComponent) -> Bool {
  self.state.get()
}
impl @lib.WebComponent for ToggleSwitchComponent with render(self) {
  let label = match self.attributes.get("label") {
    Some(l) => l
    None => "Toggle"
  }
  
  let is_on = self.state.get()
  let switch_class = if is_on { " switch-on" } else { " switch-off" }
  
  let container_attrs = Map::new()
  container_attrs["class"] = "toggle-switch-component"
  
  let switch_attrs = Map::new()
  switch_attrs["class"] = "toggle-switch" + switch_class
  switch_attrs["onclick"] = "toggleSwitch()"
  
  let slider = @lib.wrap_content("span", "", Map::new())
  let switch_element = @lib.wrap_content("div", slider, switch_attrs)
  let label_element = @lib.wrap_content("label", label, Map::new())
  let content = switch_element + label_element
  
  @lib.wrap_content("div", content, container_attrs)
}