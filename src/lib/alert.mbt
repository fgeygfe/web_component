///|
pub fn view_alert(model : @types.Model) -> @html.Html[@types.Msg] {
  match model.show_alert {
    false => @html.div([])
    true =>
      @html.div(
        class="bg-blue-100 border-l-4 border-blue-500 p-4 rounded-lg flex items-center justify-between shadow-md",
        [
          @html.span(
            class="text-blue-800 font-medium",
            [@html.text("This is an alert message")],
          ),
          @html.button(
            class="ml-4 text-blue-600 hover:text-blue-800 text-2xl font-bold transition-colors",
            click=DismissAlert,
            [@html.text("×")],
          ),
        ],
      )
  }
}

