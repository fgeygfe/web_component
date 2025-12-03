///|
pub fn view_pagination(model : @types.Model) -> @html.Html[@types.Msg] {
  let total_pages = 10
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Pagination")],
    ),
    @html.div(
      class="flex items-center justify-center gap-2",
      [
        @html.button(
          class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-lg font-medium transition-colors " +
            (if model.current_page <= 1 {
              "opacity-50 cursor-not-allowed"
            } else {
              ""
            }),
          click=if model.current_page > 1 {
            SetCurrentPage(model.current_page - 1)
          } else {
            SetCurrentPage(1)
          },
          [@html.text("‹ Prev")],
        ),
        @html.span(
          class="px-4 py-2 text-gray-700 font-medium",
          [@html.text("Page \{model.current_page} of \{total_pages}")],
        ),
        @html.button(
          class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-lg font-medium transition-colors " +
            (if model.current_page >= total_pages {
              "opacity-50 cursor-not-allowed"
            } else {
              ""
            }),
          click=if model.current_page < total_pages {
            SetCurrentPage(model.current_page + 1)
          } else {
            SetCurrentPage(total_pages)
          },
          [@html.text("Next ›")],
        ),
      ],
    ),
  ])
}

