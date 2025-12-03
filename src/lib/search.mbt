///|
pub fn view_search(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Search")],
    ),
    @html.div(
      class="flex gap-2",
      [
        @html.input(
          input_type=@html.Text,
          value=model.search_query,
          placeholder="Search...",
          class="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500",
          input=fn(s) { SetSearchQuery(s) },
        ),
        @html.button(
          class="px-6 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg font-medium transition-colors",
          click=ShowNotification,
          [@html.text("🔍")],
        ),
      ],
    ),
    @html.div(
      class="mt-2 text-sm text-gray-600",
      [
        @html.text(
          if model.search_query == "" {
            "No search query"
          } else {
            "Searching for: \{model.search_query}"
          },
        ),
      ],
    ),
  ])
}

