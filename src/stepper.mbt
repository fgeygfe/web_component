/// 步骤条组件
struct StepperComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Int]
}
fn StepperComponent::new() -> StepperComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(0)
  }
}
fn StepperComponent::set_total_steps(self : StepperComponent, total : Int) -> Unit {
  self.attributes.set("total", "4")
}
fn StepperComponent::set_current_step(self : StepperComponent, step : Int) -> Unit {
  self.state.set(step)
}
fn StepperComponent::next_step(self : StepperComponent) -> Unit {
  let current = self.state.get()
  self.state.set(current + 1)
}
fn StepperComponent::prev_step(self : StepperComponent) -> Unit {
  let current = self.state.get()
  if current > 0 {
    self.state.set(current - 1)
  }
}
impl @lib.WebComponent for StepperComponent with render(self) {
  let current_step = self.state.get()
  let total_steps = 4
  
  let attrs = Map::new()
  attrs["class"] = "stepper-component"
  
  let step1_class = if current_step >= 0 { " step-completed" } else { "" }
  let step2_class = if current_step >= 1 { " step-completed" } else { "" }
  let step3_class = if current_step >= 2 { " step-completed" } else { "" }
  let step4_class = if current_step >= 3 { " step-completed" } else { "" }
  
  let steps = "<div class=\"step" + step1_class + "\">1. Start</div>" +
              "<div class=\"step" + step2_class + "\">2. Process</div>" +
              "<div class=\"step" + step3_class + "\">3. Review</div>" +
              "<div class=\"step" + step4_class + "\">4. Complete</div>"
  
  let controls = "<button onclick=\"prevStep()\">Previous</button>" +
                "<button onclick=\"nextStep()\">Next</button>"
  
  let content = steps + controls
  
  @lib.wrap_content("div", content, attrs)
}