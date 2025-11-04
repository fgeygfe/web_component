/// 加载器组件
struct LoadingComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn LoadingComponent::new() -> LoadingComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(false)
  }
}
fn LoadingComponent::set_text(self : LoadingComponent, text : String) -> Unit {
  self.attributes.set("text", text)
}
fn LoadingComponent::set_size(self : LoadingComponent, size : String) -> Unit {
  self.attributes.set("size", size)
}
fn LoadingComponent::show(self : LoadingComponent) -> Unit {
  self.state.set(true)
}
fn LoadingComponent::hide(self : LoadingComponent) -> Unit {
  self.state.set(false)
}
impl @lib.WebComponent for LoadingComponent with render(self) {
  let visible = self.state.get()
  if not(visible) {
    return ""
  }
  
  let text = match self.attributes.get("text") {
    Some(t) => t
    None => "Loading..."
  }
  
  let size = match self.attributes.get("size") {
    Some(s) => s
    None => "medium"
  }
  
  let attrs = Map::new()
  attrs["class"] = "loading-component loading-\{size}"
  
  let spinner = "<div class=\"loading-spinner\"></div>"
  let text_element = @lib.wrap_content("div", text, Map::new())
  let content = spinner + text_element
  
  @lib.wrap_content("div", content, attrs)
}