///|
pub fn view_button(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Button")],
    ),
    @html.div(
      class="flex flex-wrap gap-3",
      [
        @html.button(
          class="px-6 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg font-medium transition-colors shadow-md hover:shadow-lg",
          click=CounterIncrement,
          [@html.text("Primary Button")],
        ),
        @html.button(
          class="px-6 py-2 bg-gray-500 hover:bg-gray-600 text-white rounded-lg font-medium transition-colors shadow-md hover:shadow-lg",
          click=CounterDecrement,
          [@html.text("Secondary Button")],
        ),
        @html.button(
          class="px-6 py-2 bg-green-500 hover:bg-green-600 text-white rounded-lg font-medium transition-colors shadow-md hover:shadow-lg",
          click=ShowNotification,
          [@html.text("Success Button")],
        ),
      ],
    ),
  ])
}

