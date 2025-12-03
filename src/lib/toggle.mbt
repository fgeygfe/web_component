///|
pub fn view_toggle(model : @types.Model) -> @html.Html[@types.Msg] {
  let (label, button_class) =
    if model.toggle_on {
      ("On", "bg-green-500 hover:bg-green-600 text-white")
    } else {
      ("Off", "bg-gray-300 hover:bg-gray-400 text-gray-700")
    }

  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Toggle")],
    ),
    @html.button(
      class="px-8 py-3 rounded-lg font-semibold transition-colors shadow-md hover:shadow-lg " +
        button_class,
      click=ToggleSwitch,
      [@html.text(label)],
    ),
  ])
}


