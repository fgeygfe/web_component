///|
pub fn view_card(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Card")],
    ),
    @html.div(
      class="bg-white rounded-lg shadow-md overflow-hidden",
      [
        @html.div(
          class="bg-gray-100 px-6 py-4 cursor-pointer hover:bg-gray-200 transition-colors",
          click=ToggleCard,
          [
            @html.h3(
              class="text-xl font-semibold text-gray-800",
              [@html.text("Card Title")],
            ),
          ],
        ),
        @html.div(
          class=if model.card_expanded {
            "px-6 py-4"
          } else {
            "px-6 py-4 hidden"
          },
          [
            @html.p(
              class="text-gray-600",
              [@html.text("This is the card content. Click the header to expand or collapse.")],
            ),
          ],
        ),
      ],
    ),
  ])
}

