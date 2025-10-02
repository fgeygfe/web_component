/// 计数器组件
struct CounterComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Int]
}
fn CounterComponent::new() -> CounterComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(0)
  }
}
fn CounterComponent::increment(self : CounterComponent) -> Unit {
  let current = self.state.get()
  self.state.set(current + 1)
}
fn CounterComponent::decrement(self : CounterComponent) -> Unit {
  let current = self.state.get()
  self.state.set(current - 1)
}
/// 实现 WebComponent trait
impl @lib.WebComponent for CounterComponent with render(self) {
  let count = self.state.get()
  let attrs = Map::new()
  attrs["class"] = "counter-component"
  
  // 修复字符串问题 - 使用正确的转义或者避免转义
  let display_div = @lib.wrap_content("div", "Count: \{count}", Map::new())
  let inc_button_attrs = Map::new()
  inc_button_attrs["onclick"] = "increment()"
  let inc_button = @lib.wrap_content("button", "+", inc_button_attrs)
  
  let dec_button_attrs = Map::new()
  dec_button_attrs["onclick"] = "decrement()"
  let dec_button = @lib.wrap_content("button", "-", dec_button_attrs)
  
  let content = display_div + inc_button + dec_button
  
  @lib.wrap_content("div", content, attrs)
}