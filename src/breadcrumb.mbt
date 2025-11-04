/// 面包屑导航组件
struct BreadcrumbComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Int]
}
fn BreadcrumbComponent::new() -> BreadcrumbComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(0)
  }
}
fn BreadcrumbComponent::set_path(self : BreadcrumbComponent, path : String) -> Unit {
  self.attributes.set("path", path)
}
fn BreadcrumbComponent::set_separator(self : BreadcrumbComponent, separator : String) -> Unit {
  self.attributes.set("separator", separator)
}
impl @lib.WebComponent for BreadcrumbComponent with render(self) {
  let path = match self.attributes.get("path") {
    Some(p) => p
    None => "Home / Products / Details"
  }
  
  let separator = match self.attributes.get("separator") {
    Some(s) => s
    None => " / "
  }
  
  let attrs = Map::new()
  attrs["class"] = "breadcrumb-component"
  
  let breadcrumb_items = "<a href=\"#\">Home</a>" + separator +
                        "<a href=\"#\">Products</a>" + separator +
                        "<span class=\"current\">Details</span>"
  
  @lib.wrap_content("nav", breadcrumb_items, attrs)
}