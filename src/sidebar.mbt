/// 侧边栏组件
struct SidebarComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Bool]
}
fn SidebarComponent::new() -> SidebarComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(false)
  }
}
fn SidebarComponent::set_title(self : SidebarComponent, title : String) -> Unit {
  self.attributes.set("title", title)
}
fn SidebarComponent::set_content(self : SidebarComponent, content : String) -> Unit {
  self.attributes.set("content", content)
}
fn SidebarComponent::open(self : SidebarComponent) -> Unit {
  self.state.set(true)
}
fn SidebarComponent::close(self : SidebarComponent) -> Unit {
  self.state.set(false)
}
impl @lib.WebComponent for SidebarComponent with render(self) {
  let title = match self.attributes.get("title") {
    Some(t) => t
    None => "Sidebar"
  }
  
  let content = match self.attributes.get("content") {
    Some(c) => c
    None => "Sidebar content goes here..."
  }
  
  let is_open = self.state.get()
  let sidebar_class = if is_open { " sidebar-open" } else { " sidebar-closed" }
  
  let attrs = Map::new()
  attrs["class"] = "sidebar-component" + sidebar_class
  
  let header = @lib.wrap_content("div", title + "<button onclick=\"closeSidebar()\">×</button>", Map::new())
  let body = @lib.wrap_content("div", content, Map::new())
  let sidebar_content = header + body
  
  @lib.wrap_content("aside", sidebar_content, attrs)
}