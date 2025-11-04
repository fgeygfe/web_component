/// 通知组件
struct NotificationComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn NotificationComponent::new() -> NotificationComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(true)
  }
}
fn NotificationComponent::set_message(self : NotificationComponent, message : String) -> Unit {
  self.attributes.set("message", message)
}
fn NotificationComponent::set_type(self : NotificationComponent, notification_type : String) -> Unit {
  self.attributes.set("type", notification_type)
}
fn NotificationComponent::set_auto_close(self : NotificationComponent, auto_close : Bool) -> Unit {
  self.attributes.set("auto_close", if auto_close { "true" } else { "false" })
}
fn NotificationComponent::dismiss(self : NotificationComponent) -> Unit {
  self.state.set(false)
}
impl @lib.WebComponent for NotificationComponent with render(self) {
  let visible = self.state.get()
  if not(visible) {
    return ""
  }
  
  let message = match self.attributes.get("message") {
    Some(m) => m
    None => "Notification message"
  }
  
  let notification_type = match self.attributes.get("type") {
    Some(t) => t
    None => "info"
  }
  
  let attrs = Map::new()
  attrs["class"] = "notification-component notification-" + notification_type
  
  let icon = match notification_type {
    "success" => "✓"
    "error" => "✗"
    "warning" => "⚠"
    _ => "ℹ"
  }
  
  let close_btn = "<button class=\"notification-close\" onclick=\"dismissNotification()\">×</button>"
  let content = "<span class=\"notification-icon\">" + icon + "</span>" + message + close_btn
  
  @lib.wrap_content("div", content, attrs)
}