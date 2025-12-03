using @tea { none }
using @types { type Model, type Msg }
///|
/// 初始化模型
pub fn init_model() -> Model {
  {
    counter: 0,
    show_notification: false,
    show_modal: false,
    notification_text: "Saved successfully!",
    modal_open_count: 0,
    active_tab: 1,
    toggle_on: false,
    show_alert: true,
    card_expanded: false,
    checkbox_checked: false,
    search_query: "",
    text_input_value: "",
    slider_value: 50,
    rating_value: 0,
    progress_value: 0,
    current_page: 1,
    selected_option: "",
    tag_visible: true,
    tooltip_visible: false,
  }
}

///|
/// 更新函数
pub fn update(msg : Msg, model : Model) -> (@tea.Cmd[Msg], Model) {
  match msg {
    CounterIncrement => (none(), { ..model, counter: model.counter + 1 })
    CounterDecrement => (none(), { ..model, counter: model.counter - 1 })
    ShowNotification => (none(), { ..model, show_notification: true })
    HideNotification => (none(), { ..model, show_notification: false })
    OpenModal => (none(), {
      ..model,
      show_modal: true,
      modal_open_count: model.modal_open_count + 1,
    })
    CloseModal => (none(), { ..model, show_modal: false })
    SelectTab1 => (none(), { ..model, active_tab: 1 })
    SelectTab2 => (none(), { ..model, active_tab: 2 })
    SelectTab3 => (none(), { ..model, active_tab: 3 })
    ToggleSwitch => (none(), { ..model, toggle_on: !model.toggle_on })
    DismissAlert => (none(), { ..model, show_alert: false })
    ToggleCard => (none(), { ..model, card_expanded: !model.card_expanded })
    ToggleCheckbox => (none(), { ..model, checkbox_checked: !model.checkbox_checked })
    SetSearchQuery(query) => (none(), { ..model, search_query: query })
    SetTextInput(value) => (none(), { ..model, text_input_value: value })
    SetSliderValue(value) => (none(), { ..model, slider_value: value })
    SetRating(rating) => (none(), { ..model, rating_value: rating })
    SetProgress(progress) => (none(), { ..model, progress_value: progress })
    SetCurrentPage(page) => (none(), { ..model, current_page: page })
    SelectOption(option) => (none(), { ..model, selected_option: option })
    CloseTag => (none(), { ..model, tag_visible: false })
    ShowTooltip => (none(), { ..model, tooltip_visible: true })
    HideTooltip => (none(), { ..model, tooltip_visible: false })
  }
}

