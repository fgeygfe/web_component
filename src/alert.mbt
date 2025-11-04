/// 警告框组件
struct AlertComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn AlertComponent::new() -> AlertComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(true)
  }
}
fn AlertComponent::set_message(self : AlertComponent, message : String) -> Unit {
  self.attributes.set("message", message)
}
fn AlertComponent::set_type(self : AlertComponent, alert_type : String) -> Unit {
  self.attributes.set("type", alert_type)
}
fn AlertComponent::dismiss(self : AlertComponent) -> Unit {
  self.state.set(false)
}
impl @lib.WebComponent for AlertComponent with render(self) {
  let visible = self.state.get()
  if not(visible) {
    return ""
  }
  
  let message = match self.attributes.get("message") {
    Some(m) => m
    None => "This is an alert message"
  }
  
  let alert_type = match self.attributes.get("type") {
    Some(t) => t
    None => "info"
  }
  
  let attrs = Map::new()
  attrs["class"] = "alert-component alert-\{alert_type}"
  
  let close_button = "<span class=\"alert-close\" onclick=\"dismissAlert()\">&times;</span>"
  let content = message + close_button
  
  @lib.wrap_content("div", content, attrs)
}