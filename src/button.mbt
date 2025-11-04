/// 按钮组件实现示例
pub struct ButtonComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[ButtonState]
  mut click_handler : (() -> Unit)?
}

/// 按钮状态
pub struct ButtonState {
  disabled : Bool
  loading : Bool
}

/// 创建新的按钮组件
pub fn ButtonComponent::new() -> ButtonComponent {
  let initial_state = ButtonState::{ disabled: false, loading: false }
  { 
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(initial_state),
    click_handler: None
  }
}

/// 设置按钮文本
pub fn ButtonComponent::set_text(self : ButtonComponent, text : String) -> Unit {
  self.attributes.set("text", text)
}

/// 设置按钮禁用状态
pub fn ButtonComponent::set_disabled(self : ButtonComponent, disabled : Bool) -> Unit {
  let current_state = self.state.get()
  self.state.set({ ..current_state, disabled })
}

/// 设置按钮加载状态
pub fn ButtonComponent::set_loading(self : ButtonComponent, loading : Bool) -> Unit {
  let current_state = self.state.get()
  self.state.set({ ..current_state, loading })
}

/// 设置点击处理器
pub fn ButtonComponent::on_click(self : ButtonComponent, handler : () -> Unit) -> Unit {
  self.click_handler = Some(handler)
}

/// 实现 WebComponent trait
impl @lib.WebComponent for ButtonComponent with render(self) {
  let text = match self.attributes.get("text") {
    Some(t) => t
    None => "Click me"
  }
  
  let state = self.state.get()
  let disabled_attr = if state.disabled || state.loading { " disabled" } else { "" }
  let loading_text = if state.loading { " (Loading...)" } else { "" }
  
  let attrs = Map::new()
  attrs["type"] = "button"
  if state.disabled || state.loading {
    attrs["disabled"] = "disabled"
  }
  
  @lib.wrap_content("button", @lib.escape_html(text) + loading_text, attrs)
}

impl @lib.WebComponent for ButtonComponent with connected_callback(self) {
  println("Button component connected to DOM")
}

impl @lib.WebComponent for ButtonComponent with disconnected_callback(self) {
  println("Button component disconnected from DOM")
}