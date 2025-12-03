///|
pub fn view_tooltip(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Tooltip")],
    ),
    @html.div(
      class="relative inline-block",
      [
        @html.button(
          class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg font-medium transition-colors",
          click=if model.tooltip_visible { HideTooltip } else { ShowTooltip },
          [@html.text("Hover me (click to toggle)")],
        ),
        @html.div(
          class=if model.tooltip_visible {
            "absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-800 text-white text-sm rounded-lg whitespace-nowrap opacity-100 transition-opacity"
          } else {
            "absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-800 text-white text-sm rounded-lg whitespace-nowrap opacity-0 pointer-events-none transition-opacity"
          },
          [
            @html.text("This is a tooltip"),
            @html.div(
              class="absolute top-full left-1/2 transform -translate-x-1/2 -mt-1",
              [
                @html.div(
                  class="w-2 h-2 bg-gray-800 transform rotate-45",
                  [],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ])
}

