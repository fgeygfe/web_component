///|
pub fn view_checkbox(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Checkbox")],
    ),
    @html.div(
      class="flex items-center gap-3",
      [
        @html.input(
          input_type=@html.Checkbox,
          checked=model.checkbox_checked,
          class="w-5 h-5 text-blue-600 rounded cursor-pointer",
          change=fn(_) { ToggleCheckbox },
        ),
        @html.label(
          class="text-gray-700 font-medium cursor-pointer",
          [@html.text("I agree to the terms and conditions")],
        ),
      ],
    ),
    @html.div(
      class="mt-2 text-sm text-gray-500",
      [
        @html.text(
          if model.checkbox_checked {
            "Checked"
          } else {
            "Unchecked"
          },
        ),
      ],
    ),
  ])
}

