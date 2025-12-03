///|
pub fn view_select(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Select")],
    ),
    @html.select(
      class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500",
      change=fn(s) { SelectOption(s) },
      [
        @html.option([@html.text("Select an option")]),
        @html.option(value="option1", [@html.text("Option 1")]),
        @html.option(value="option2", [@html.text("Option 2")]),
        @html.option(value="option3", [@html.text("Option 3")]),
      ],
    ),
    @html.div(
      class="mt-2 text-sm text-gray-600",
      [
        @html.text(
          if model.selected_option == "" {
            "No option selected"
          } else {
            "Selected: \{model.selected_option}"
          },
        ),
      ],
    ),
  ])
}

