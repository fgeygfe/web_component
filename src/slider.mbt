/// 滑块组件
struct SliderComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Int]
}
fn SliderComponent::new() -> SliderComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(50)
  }
}
fn SliderComponent::set_min(self : SliderComponent, min : Int) -> Unit {
  self.attributes.set("min", min.to_string())
}
fn SliderComponent::set_max(self : SliderComponent, max : Int) -> Unit {
  self.attributes.set("max", max.to_string())
}
fn SliderComponent::set_value(self : SliderComponent, value : Int) -> Unit {
  self.state.set(value)
}
impl @lib.WebComponent for SliderComponent with render(self) {
  let value = self.state.get()
  let min = match self.attributes.get("min") {
    Some(m) => m
    None => "0"
  }
  let max = match self.attributes.get("max") {
    Some(m) => m
    None => "100"
  }
  
  let attrs = Map::new()
  attrs["type"] = "range"
  attrs["min"] = min
  attrs["max"] = max
  attrs["value"] = value.to_string()
  attrs["class"] = "slider-component"
  attrs["oninput"] = "handleSliderChange()"
  
  @lib.create_self_closing_element("input", attrs)
}