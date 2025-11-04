/// 分页组件
struct PaginationComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Int]
}
fn PaginationComponent::new() -> PaginationComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(1)
  }
}
fn PaginationComponent::set_total_pages(self : PaginationComponent, total : Int) -> Unit {
  self.attributes.set("total", "10")
}
fn PaginationComponent::set_current_page(self : PaginationComponent, page : Int) -> Unit {
  self.state.set(page)
}
fn PaginationComponent::get_current_page(self : PaginationComponent) -> Int {
  self.state.get()
}
impl @lib.WebComponent for PaginationComponent with render(self) {
  let current_page = self.state.get()
  let total_pages = 10
  
  let attrs = Map::new()
  attrs["class"] = "pagination-component"
  
  let prev_btn = "<button onclick=\"prevPage()\" class=\"page-btn\">‹ Prev</button>"
  let page_info = "<span class=\"page-info\">Page " + current_page.to_string() + " of " + total_pages.to_string() + "</span>"
  let next_btn = "<button onclick=\"nextPage()\" class=\"page-btn\">Next ›</button>"
  
  let content = prev_btn + page_info + next_btn
  
  @lib.wrap_content("div", content, attrs)
}