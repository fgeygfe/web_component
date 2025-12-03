using @update { init_model, update }
using @lib {
  view_counter,
  view_notification,
  view_modal,
  view_tabs,
  view_toggle,
  view_alert,
  view_button,
  view_card,
  view_checkbox,
  view_loading,
  view_pagination,
  view_progress_bar,
  view_rating,
  view_search,
  view_select,
  view_slider,
  view_tag,
  view_text_input,
  view_tooltip,
}
///|
fn view(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div(
    class="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 p-8",
    [
      // 标题区域
      @html.div(
        class="max-w-7xl mx-auto mb-8",
        [
          @html.h1(
            class="text-4xl font-bold text-gray-800 mb-2",
            [@html.text("RabbitTea Component Showcase")],
          ),
          @html.p(
            class="text-gray-600",
            [@html.text("展示各种交互组件的功能")],
          ),
        ],
      ),
      // Alert 组件（全宽显示）
      @html.div(
        class="max-w-7xl mx-auto mb-6",
        [view_alert(model)],
      ),
      // 网格布局 - 响应式设计
      @html.div(
        class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6",
        [
          // Counter 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_counter(model)],
          ),
          // Toggle 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_toggle(model)],
          ),
          // Modal 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_modal(model)],
          ),
          // Notification 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_notification(model)],
          ),
          // Tabs 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_tabs(model)],
          ),
          // Button 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_button(model)],
          ),
          // Card 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_card(model)],
          ),
          // Checkbox 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_checkbox(model)],
          ),
          // Loading 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_loading(model)],
          ),
          // Pagination 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_pagination(model)],
          ),
          // Progress Bar 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_progress_bar(model)],
          ),
          // Rating 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_rating(model)],
          ),
          // Search 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_search(model)],
          ),
          // Select 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_select(model)],
          ),
          // Slider 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_slider(model)],
          ),
          // Tag 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_tag(model)],
          ),
          // Text Input 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_text_input(model)],
          ),
          // Tooltip 卡片
          @html.div(
            class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition-shadow",
            [view_tooltip(model)],
          ),
        ],
      ),
    ],
  )
}

///|
fn main {
  let model = init_model()
  @tea.startup(model~, update~, view~)
}

