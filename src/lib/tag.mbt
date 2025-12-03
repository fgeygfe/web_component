///|
pub fn view_tag(model : @types.Model) -> @html.Html[@types.Msg] {
  match model.tag_visible {
    false => @html.div([])
    true =>
      @html.div([
        @html.h2(
          class="text-2xl font-semibold text-gray-800 mb-4",
          [@html.text("Tag")],
        ),
        @html.div(
          class="inline-flex items-center gap-2 px-3 py-1 bg-blue-100 text-blue-800 rounded-full",
          [
            @html.span(
              class="font-medium",
              [@html.text("Tag Label")],
            ),
            @html.button(
              class="text-blue-600 hover:text-blue-800 font-bold transition-colors",
              click=CloseTag,
              [@html.text("×")],
            ),
          ],
        ),
      ])
  }
}

