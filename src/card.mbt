/// 卡片组件
struct CardComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn CardComponent::new() -> CardComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(false)
  }
}
fn CardComponent::set_title(self : CardComponent, title : String) -> Unit {
  self.attributes.set("title", title)
}
fn CardComponent::set_content(self : CardComponent, content : String) -> Unit {
  self.attributes.set("content", content)
}
fn CardComponent::toggle_expanded(self : CardComponent) -> Unit {
  let current = self.state.get()
  self.state.set(not(current))
}
impl @lib.WebComponent for CardComponent with render(self) {
  let title = match self.attributes.get("title") {
    Some(t) => t
    None => "Card Title"
  }
  
  let content = match self.attributes.get("content") {
    Some(c) => c
    None => "Card content goes here..."
  }
  
  let expanded = self.state.get()
  let expanded_class = if expanded { " expanded" } else { "" }
  
  let attrs = Map::new()
  attrs["class"] = "card-component\{expanded_class}"
  let display_style = if expanded { "block" } else { "none" }
  let header = "<div class=\"card-header\" onclick=\"toggle()\">" + title + "</div>"
  let body = "<div class=\"card-body\" style=\"display: " + display_style + "\">" + content + "</div>"
  let card_content = header + body
  
  @lib.wrap_content("div", card_content, attrs)
    
}