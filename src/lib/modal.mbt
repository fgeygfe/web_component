///|
pub fn view_modal(model : @types.Model) -> @html.Html[@types.Msg] {
  match model.show_modal {
    false =>
      @html.div([
        @html.button(
          class="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white rounded-lg font-medium transition-colors shadow-md hover:shadow-lg",
          click=OpenModal,
          [@html.text("Open modal")],
        ),
        @html.span(
          class="ml-2 text-sm text-gray-600",
          [@html.text("(opened \{model.modal_open_count} times)")],
        ),
      ])
    true =>
      @html.div(
        class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50",
        [
          @html.div(
            class="bg-white rounded-lg shadow-2xl p-6 max-w-md w-full mx-4",
            [
              @html.h2(
                class="text-2xl font-semibold text-gray-800 mb-4",
                [@html.text("Modal")],
              ),
              @html.div(
                class="text-gray-600 mb-6",
                [@html.text("This is a simple modal dialog.")],
              ),
              @html.button(
                class="w-full px-4 py-2 bg-gray-500 hover:bg-gray-600 text-white rounded-lg font-medium transition-colors",
                click=CloseModal,
                [@html.text("Close")],
              ),
            ],
          ),
        ],
      )
  }
}


