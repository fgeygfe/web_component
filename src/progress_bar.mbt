/// 进度条组件
struct ProgressBarComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Int]
}
fn ProgressBarComponent::new() -> ProgressBarComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(0)
  }
}
fn ProgressBarComponent::set_max(self : ProgressBarComponent, max : Int) -> Unit {
  self.attributes.set("max", max.to_string())
}
fn ProgressBarComponent::set_progress(self : ProgressBarComponent, progress : Int) -> Unit {
  self.state.set(progress)
}
impl @lib.WebComponent for ProgressBarComponent with render(self) {
  let progress = self.state.get()
  let max = 100 // 固定最大值为100
  
  let percentage = if max > 0 { (progress * 100) / max } else { 0 }
  
  let attrs = Map::new()
  attrs["class"] = "progress-bar-component"
  
  let bar_attrs = Map::new()
  bar_attrs["class"] = "progress-bar-fill"
  bar_attrs["style"] = "width: " + percentage.to_string() + "%"
  
  let fill = @lib.wrap_content("div", "", bar_attrs)
  let label = @lib.wrap_content("div", progress.to_string() + "/" + max.to_string(), Map::new())
  let content = fill + label
  
  @lib.wrap_content("div", content, attrs)
}