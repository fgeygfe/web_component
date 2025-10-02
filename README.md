# MoonBit Web Components

A lightweight web component framework built with MoonBit, providing reactive components with state management and clean HTML generation.

## Features

- 🔄 **Reactive State Management**: Built-in state management for component data
- 🎨 **Attribute System**: Flexible attribute management for component configuration
- 🧩 **Modular Components**: Easy-to-extend component architecture
- 🚀 **MoonBit Powered**: Leveraging MoonBit's type safety and performance
- 📦 **Multiple Targets**: Supports WebAssembly, JavaScript, and native compilation

## Project Structure

```text
web_component/
├── src/
│   ├── lib/  # Core framework components
│   │   ├── attributes.mbt
│   │   ├── button.mbt
│   │   ├── component.mbt
│   │   ├── dom.mbt
│   │   ├── events.mbt
│   │   ├── lifecycle.mbt
│   │   ├── registry.mbt
│   │   ├── state.mbt
│   │   ├── style.mbt
│   │   ├── template.mbt
│   │   └── moon.pkg.json
│   ├── card.mbt            # Card component implementation
│   ├── counter.mbt         # Counter component implementation
│   ├── text_input.mbt      # Text input component implementation
│   └── moon.pkg.json
└── moon.mod.json
```

## Components

### CounterComponent

A simple counter with increment and decrement functionality.

**Features:**
- Click to increment/decrement
- Persistent state management
- Clean button interface

**Usage:**
```moonbit
let counter = CounterComponent::new()
counter.increment()
counter.decrement()
let html = counter.render()

```markdown
### CardComponent

An expandable card component with title and content.

**Features:**
- Collapsible content area
- Customizable title and content
- Toggle state management
- CSS class-based styling

**Usage:**
```moonbit
let card = CardComponent::new()
card.set_title("My Card")
card.set_content("This is the card content")
card.toggle_expanded()
let html = card.render()

```markdown
### TextInputComponent

A text input component with placeholder support.

**Features:**
- Configurable placeholder text
- Value state management
- Standard HTML input rendering

**Usage:**
```moonbit
let input = TextInputComponent::new()
input.set_placeholder("Enter your name")
let value = input.get_value()
let html = input.render()

```markdown
## Core Framework

### WebComponent Trait

All components implement the `WebComponent` trait:

```moonbit
trait WebComponent {
  render(Self) -> String
}
ComponentAttributes
Manages component attributes with key-value storage:

// Example usage
let attrs = ComponentAttributes::new()
attrs.set("title", "My Title")
match attrs.get("title") {
  Some(value) => println(value)
  None => println("No title set")
}

```markdown
### ComponentState[T]

Generic state management for any type:

```moonbit
// Example usage
let state = ComponentState::new(0)      // Integer state
let string_state = ComponentState::new("") // String state
state.set(42)
let current = state.get()
Getting Started
Prerequisites
MoonBit toolchain
Basic understanding of MoonBit syntax
Installation
Clone the repository:
git clone <repository-url>
cd web_component
Build the project:
moon check
moon build
Run tests:
moon test

```markdown
## Development

### Creating a New Component

1. Create a new `.mbt` file in the `src` directory
2. Define your component struct with attributes and state
3. Implement the `WebComponent` trait
4. Add any custom methods for component behavior

**Example:**
```moonbit
struct MyComponent {
  attributes : ComponentAttributes
  state : ComponentState[String]
}

fn MyComponent::new() -> MyComponent {
  {
    attributes: ComponentAttributes::new(),
    state: ComponentState::new("initial")
  }
}

impl WebComponent for MyComponent with render(self) {
  let content = self.state.get()
  let attrs = Map::new()
  attrs["class"] = "my-component"
  wrap_content("div", content, attrs)
}

```markdown
### Testing Components

Create test files with the `_test.mbt` suffix:

```moonbit
test "counter component initialization" {
  let counter = CounterComponent::new()
  let initial_count = counter.state.get()
  assert_eq!(initial_count, 0)
}

test "counter increment" {
  let counter = CounterComponent::new()
  counter.increment()
  assert_eq!(counter.state.get(), 1)
}
HTML Generation
Components generate HTML strings through the render() method. The framework provides utility functions:

wrap_content(tag, content, attrs): Creates elements with content
create_self_closing_element(tag, attrs): Creates self-closing elements
Example Output:

<!-- Counter Component -->
<div class="counter-component">
  <div>Count: 5</div>
  <button onclick="increment()">+</button>
  <button onclick="decrement()">-</button>
</div>

```markdown
## Compilation Targets

This project supports multiple compilation targets:

- **WebAssembly**: For web deployment with optimal performance
- **JavaScript**: For Node.js integration and browser compatibility  
- **Native**: For server-side rendering and native applications

Build for specific targets:
```bash
moon build --target wasm    # WebAssembly
moon build --target js      # JavaScript
moon build --target native  # Native binary
Contributing
Fork the repository
Create a feature branch (git checkout -b feature/amazing-component)
Write your component with tests
Ensure all tests pass (moon test)
Submit a pull request
License
[Apache License 2.0]

Roadmap
[ ] Event handling system
[ ] Component lifecycle hooks
[ ] CSS-in-MoonBit styling
[ ] Component composition utilities
[ ] Performance optimizations
[ ] Documentation generator