/// 评分组件
struct RatingComponent {
  attributes : @lib.ComponentAttributes
  state : @lib.ComponentState[Int]
}
fn RatingComponent::new() -> RatingComponent {
  {
    attributes: @lib.ComponentAttributes::new(),
    state: @lib.ComponentState::new(0)
  }
}
fn RatingComponent::set_max_stars(self : RatingComponent, max : Int) -> Unit {
  self.attributes.set("max", "5")
}
fn RatingComponent::set_rating(self : RatingComponent, rating : Int) -> Unit {
  self.state.set(rating)
}
fn RatingComponent::get_rating(self : RatingComponent) -> Int {
  self.state.get()
}
impl @lib.WebComponent for RatingComponent with render(self) {
  let rating = self.state.get()
  let max_stars = 5
  
  let attrs = Map::new()
  attrs["class"] = "rating-component"
  
  let stars = "<span class=\"star\" onclick=\"setRating(1)\">★</span>" +
              "<span class=\"star\" onclick=\"setRating(2)\">★</span>" +
              "<span class=\"star\" onclick=\"setRating(3)\">★</span>" +
              "<span class=\"star\" onclick=\"setRating(4)\">★</span>" +
              "<span class=\"star\" onclick=\"setRating(5)\">★</span>"
  
  @lib.wrap_content("div", stars, attrs)
}