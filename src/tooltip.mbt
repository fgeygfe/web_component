/// 工具提示组件
struct TooltipComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn TooltipComponent::new() -> TooltipComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(false)
  }
}
fn TooltipComponent::set_text(self : TooltipComponent, text : String) -> Unit {
  self.attributes.set("text", text)
}
fn TooltipComponent::set_tooltip(self : TooltipComponent, tooltip : String) -> Unit {
  self.attributes.set("tooltip", tooltip)
}
fn TooltipComponent::show_tooltip(self : TooltipComponent) -> Unit {
  self.state.set(true)
}
fn TooltipComponent::hide_tooltip(self : TooltipComponent) -> Unit {
  self.state.set(false)
}
impl @lib.WebComponent for TooltipComponent with render(self) {
  let text = match self.attributes.get("text") {
    Some(t) => t
    None => "Hover me"
  }
  
  let tooltip_text = match self.attributes.get("tooltip") {
    Some(t) => t
    None => "This is a tooltip"
  }
  
  let visible = self.state.get()
  let tooltip_class = if visible { " tooltip-visible" } else { ""
  }
  
  let attrs = Map::new()
  attrs["class"] = "tooltip-component"
  attrs["onmouseenter"] = "showTooltip()"
  attrs["onmouseleave"] = "hideTooltip()"
  
  let tooltip_attrs = Map::new()
  tooltip_attrs["class"] = "tooltip-text\{tooltip_class}"
  
  let tooltip_element = @lib.wrap_content("span", tooltip_text, tooltip_attrs)
  let content = text + tooltip_element
  
  @lib.wrap_content("span", content, attrs)
}