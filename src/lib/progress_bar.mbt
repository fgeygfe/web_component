///|
pub fn view_progress_bar(model : @types.Model) -> @html.Html[@types.Msg] {
  let max_value = 100
  let percentage = (model.progress_value * 100) / max_value
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Progress Bar")],
    ),
    @html.div(
      class="w-full",
      [
        @html.div(
          class="flex justify-between mb-2",
          [
            @html.span(
              class="text-sm text-gray-600",
              [@html.text("\{model.progress_value}/\{max_value}")],
            ),
            @html.span(
              class="text-sm text-gray-600",
              [@html.text("\{percentage}%")],
            ),
          ],
        ),
        @html.div(
          class="w-full bg-gray-200 rounded-full h-4 overflow-hidden",
          [
            @html.div(
              class="bg-blue-500 h-full transition-all duration-300",
              style=["width: \{percentage}%"],
              [],
            ),
          ],
        ),
        @html.div(
          class="flex gap-2 mt-4",
          [
            @html.button(
              class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg text-sm transition-colors",
              click=SetProgress(model.progress_value + 10),
              [@html.text("+10")],
            ),
            @html.button(
              class="px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded-lg text-sm transition-colors",
              click=SetProgress(model.progress_value - 10),
              [@html.text("-10")],
            ),
          ],
        ),
      ],
    ),
  ])
}

