///|
pub fn view_rating(model : @types.Model) -> @html.Html[@types.Msg] {
  let max_stars = 5
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Rating")],
    ),
    @html.div(
      class="flex items-center gap-2",
      [
        @html.div(
          class="flex gap-1",
          [
            @html.button(
              class="text-3xl transition-colors " +
                (if model.rating_value >= 1 {
                  "text-yellow-400"
                } else {
                  "text-gray-300"
                }),
              click=SetRating(1),
              [@html.text("★")],
            ),
            @html.button(
              class="text-3xl transition-colors " +
                (if model.rating_value >= 2 {
                  "text-yellow-400"
                } else {
                  "text-gray-300"
                }),
              click=SetRating(2),
              [@html.text("★")],
            ),
            @html.button(
              class="text-3xl transition-colors " +
                (if model.rating_value >= 3 {
                  "text-yellow-400"
                } else {
                  "text-gray-300"
                }),
              click=SetRating(3),
              [@html.text("★")],
            ),
            @html.button(
              class="text-3xl transition-colors " +
                (if model.rating_value >= 4 {
                  "text-yellow-400"
                } else {
                  "text-gray-300"
                }),
              click=SetRating(4),
              [@html.text("★")],
            ),
            @html.button(
              class="text-3xl transition-colors " +
                (if model.rating_value >= 5 {
                  "text-yellow-400"
                } else {
                  "text-gray-300"
                }),
              click=SetRating(5),
              [@html.text("★")],
            ),
          ],
        ),
        @html.span(
          class="ml-2 text-gray-600",
          [
            @html.text(
              if model.rating_value > 0 {
                "\{model.rating_value}/\{max_stars}"
              } else {
                "No rating"
              },
            ),
          ],
        ),
      ],
    ),
  ])
}

