///|
pub fn view_loading(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Loading")],
    ),
    @html.div(
      class="flex flex-col items-center gap-4",
      [
        @html.div(
          class="w-16 h-16 border-4 border-blue-500 border-t-transparent rounded-full animate-spin",
          [],
        ),
        @html.p(
          class="text-gray-600",
          [@html.text("Loading...")],
        ),
      ],
    ),
  ])
}

