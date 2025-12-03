///|
pub fn view_text_input(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Text Input")],
    ),
    @html.input(
      input_type=@html.Text,
      value=model.text_input_value,
      placeholder="Enter text...",
      class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500",
      input=fn(s) { SetTextInput(s) },
    ),
    @html.div(
      class="mt-2 text-sm text-gray-600",
      [
        @html.text(
          if model.text_input_value == "" {
            "No input"
          } else {
            "Input: \{model.text_input_value}"
          },
        ),
      ],
    ),
  ])
}

