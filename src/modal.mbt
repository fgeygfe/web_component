/// 模态框组件
struct ModalComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn ModalComponent::new() -> ModalComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(false)
  }
}
fn ModalComponent::set_title(self : ModalComponent, title : String) -> Unit {
  self.attributes.set("title", title)
}
fn ModalComponent::set_content(self : ModalComponent, content : String) -> Unit {
  self.attributes.set("content", content)
}
fn ModalComponent::show(self : ModalComponent) -> Unit {
  self.state.set(true)
}
fn ModalComponent::hide(self : ModalComponent) -> Unit {
  self.state.set(false)
}
impl @lib.WebComponent for ModalComponent with render(self) {
  let title = match self.attributes.get("title") {
    Some(t) => t
    None => "Modal Title"
  }
  
  let content = match self.attributes.get("content") {
    Some(c) => c
    None => "Modal content..."
  }
  
  let visible = self.state.get()
  let display_style = if visible { "flex" } else { "none" }
  
  let attrs = Map::new()
  attrs["class"] = "modal-component"
  attrs["style"] = "display: \{display_style}"
  
  let header = @lib.wrap_content("div", title + "<span class=\"close\" onclick=\"closeModal()\">&times;</span>", Map::new())
  let body = @lib.wrap_content("div", content, Map::new())
  let modal_content = @lib.wrap_content("div", header + body, Map::new())
  
  @lib.wrap_content("div", modal_content, attrs)
}