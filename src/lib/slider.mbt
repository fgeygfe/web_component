///|
pub fn view_slider(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Slider")],
    ),
    @html.div(
      class="w-full",
      [
        @html.div(
          class="w-full bg-gray-200 rounded-full h-4 relative",
          [
            @html.div(
              class="bg-blue-500 h-full rounded-full transition-all duration-300",
              style=["width: \{model.slider_value}%"],
              [],
            ),
          ],
        ),
        @html.div(
          class="flex justify-between items-center mt-4",
          [
            @html.button(
              class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg text-sm transition-colors",
              click=if model.slider_value > 0 {
                SetSliderValue(model.slider_value - 10)
              } else {
                SetSliderValue(0)
              },
              [@html.text("-10")],
            ),
            @html.span(
              class="font-semibold text-blue-600 text-lg",
              [@html.text("\{model.slider_value}%")],
            ),
            @html.button(
              class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg text-sm transition-colors",
              click=if model.slider_value < 100 {
                SetSliderValue(model.slider_value + 10)
              } else {
                SetSliderValue(100)
              },
              [@html.text("+10")],
            ),
          ],
        ),
      ],
    ),
  ])
}

