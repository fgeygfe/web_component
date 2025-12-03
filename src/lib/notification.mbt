///|
pub fn view_notification(model : @types.Model) -> @html.Html[@types.Msg] {
  match model.show_notification {
    false =>
      @html.div([
        @html.button(
          class="px-4 py-2 bg-purple-500 hover:bg-purple-600 text-white rounded-lg font-medium transition-colors shadow-md hover:shadow-lg",
          click=ShowNotification,
          [@html.text("Show notification")],
        ),
      ])
    true =>
      @html.div(
        class="bg-green-100 border-l-4 border-green-500 p-4 rounded-lg flex items-center justify-between shadow-md",
        [
          @html.span(
            class="text-green-800 font-medium",
            [@html.text(model.notification_text)],
          ),
          @html.button(
            class="ml-4 text-green-600 hover:text-green-800 text-2xl font-bold transition-colors",
            click=HideNotification,
            [@html.text("×")],
          ),
        ],
      )
  }
}


