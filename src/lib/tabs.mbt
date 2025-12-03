///|
pub fn view_tabs(model : @types.Model) -> @html.Html[@types.Msg] {
  let tab1_label = "Tab 1"
  let tab2_label = "Tab 2"
  let tab3_label = "Tab 3"

  let content =
    if model.active_tab == 1 {
      "Content of Tab 1"
    } else if model.active_tab == 2 {
      "Content of Tab 2"
    } else {
      "Content of Tab 3"
    }

  let tab1_class =
    if model.active_tab == 1 {
      "px-4 py-2 bg-blue-500 text-white rounded-t-lg font-medium transition-colors"
    } else {
      "px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-t-lg font-medium transition-colors"
    }
  let tab2_class =
    if model.active_tab == 2 {
      "px-4 py-2 bg-blue-500 text-white rounded-t-lg font-medium transition-colors"
    } else {
      "px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-t-lg font-medium transition-colors"
    }
  let tab3_class =
    if model.active_tab == 3 {
      "px-4 py-2 bg-blue-500 text-white rounded-t-lg font-medium transition-colors"
    } else {
      "px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-t-lg font-medium transition-colors"
    }

  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Tabs")],
    ),
    @html.div(
      class="flex gap-1 border-b-2 border-gray-300",
      [
        @html.button(
          class=tab1_class,
          click=SelectTab1,
          [@html.text(tab1_label)],
        ),
        @html.button(
          class=tab2_class,
          click=SelectTab2,
          [@html.text(tab2_label)],
        ),
        @html.button(
          class=tab3_class,
          click=SelectTab3,
          [@html.text(tab3_label)],
        ),
      ],
    ),
    @html.div(
      class="mt-4 p-4 bg-gray-50 rounded-b-lg border border-gray-200",
      [
        @html.span(
          class="text-gray-700",
          [@html.text(content)],
        ),
      ],
    ),
  ])
}


