///|
pub fn view_counter(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Counter")],
    ),
    @html.div(
      class="flex flex-col items-center gap-4",
      [
        @html.h1(
          class="text-6xl font-bold text-blue-600",
          [@html.text(model.counter.to_string())],
        ),
        @html.div(
          class="flex gap-3",
          [
            @html.button(
              class="w-12 h-12 bg-green-500 hover:bg-green-600 text-white rounded-full text-2xl font-bold transition-colors shadow-md hover:shadow-lg",
              click=CounterIncrement,
              [@html.text("+")],
            ),
            @html.button(
              class="w-12 h-12 bg-red-500 hover:bg-red-600 text-white rounded-full text-2xl font-bold transition-colors shadow-md hover:shadow-lg",
              click=CounterDecrement,
              [@html.text("-")],
            ),
          ],
        ),
      ],
    ),
  ])
}


