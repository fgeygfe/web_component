///|
/// 消息类型
pub(all) enum Msg {
  CounterIncrement
  CounterDecrement
  ShowNotification
  HideNotification
  OpenModal
  CloseModal
  SelectTab1
  SelectTab2
  SelectTab3
  ToggleSwitch
  DismissAlert
  ToggleCard
  ToggleCheckbox
  SetSearchQuery(String)
  SetTextInput(String)
  SetSliderValue(Int)
  SetRating(Int)
  SetProgress(Int)
  SetCurrentPage(Int)
  SelectOption(String)
  CloseTag
  ShowTooltip
  HideTooltip
}

///|
/// 状态类型
pub(all) struct Model {
  counter : Int
  show_notification : Bool
  show_modal : Bool
  notification_text : String
  modal_open_count : Int
  active_tab : Int
  toggle_on : Bool
  show_alert : Bool
  card_expanded : Bool
  checkbox_checked : Bool
  search_query : String
  text_input_value : String
  slider_value : Int
  rating_value : Int
  progress_value : Int
  current_page : Int
  selected_option : String
  tag_visible : Bool
  tooltip_visible : Bool
}

