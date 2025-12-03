## RabbitTea Web Component Template

This project is a **template** for building Web Components using **RabbitTea** and **MoonBit**, aligned with the Web Components model described on [MDN](https://developer.mozilla.org/zh-CN/docs/Web/API/Web_components).

### Features

- **RabbitTea + TEA 模型**：使用 `Model` / `Msg` / `update` / `view` 的声明式 UI 模式  
- **模块化架构**：采用 `types` / `update` / `main` / `lib` 分离的清晰结构
- **Tailwind CSS 样式**：使用 Tailwind CSS v4 进行现代化 UI 设计
- **单实例应用**：所有 Web Components 共享同一个 RabbitTea 实例
- **Vite 构建**：通过 `rabbit-tea-vite` 插件集成 MoonBit 构建流程  
- **适合作为 GitHub Template 或 npm 包骨架**  

### Project Structure

```text
web_component/
├── moon.mod.json                # MoonBit module metadata
├── package.json                 # npm scripts for dev/build
├── vite.config.js               # Vite + rabbit-tea-vite + Tailwind CSS config
└── src/
    ├── index.html               # Demo page
    ├── styles.css               # Tailwind CSS import
    ├── types/
    │   ├── types.mbt            # Model 和 Msg 类型定义
    │   └── moon.pkg.json
    ├── update/
    │   ├── update.mbt           # init_model 和 update 函数
    │   └── moon.pkg.json
    ├── lib/
    │   ├── counter.mbt          # Counter 组件视图
    │   ├── modal.mbt            # Modal 组件视图
    │   ├── notification.mbt     # Notification 组件视图
    │   ├── tabs.mbt             # Tabs 组件视图
    │   ├── toggle.mbt           # Toggle 组件视图
    │   └── moon.pkg.json        # imports RabbitTea 和 types
    ├── main/
    │   ├── main.mbt             # 主入口：组合 view 和启动应用
    │   └── moon.pkg.json
    ├── main.js                  # 由 MoonBit 生成的 JS 入口（dev 用）
    ├── main.js.map
    └── web-components.js        # Web Components 封装
```

### 架构说明

项目采用模块化架构，参考了 blog-template 的设计：

- **`types` 包**：定义 `Model` 和 `Msg` 类型
- **`update` 包**：包含 `init_model` 和 `update` 函数
- **`lib` 包**：各个组件的视图函数（`view_counter`、`view_modal` 等）
- **`main` 包**：组合所有视图，启动 RabbitTea 应用

### Getting Started

#### Prerequisites

- MoonBit toolchain  
- Node.js (or Bun)  

#### Install dependencies

```bash
moon update
moon add Yoorkin/rabbit-tea
npm install
```

#### Run in development mode

```bash
npm run dev
```

Then open the URL printed in the terminal to see the RabbitTea app rendered into `<div id="app">`.

#### Build for production

```bash
npm run build
```

- MoonBit 会把 `src/main/main.mbt` 编译到 `target/js/release/build/main/main.js`。  
- `rabbit-tea-vite` 会在构建时把它复制到 `src/main.js`，并最终打包成 `src/dist/assets/main-xxxx.js`。

### 代码示例

#### main.mbt - 主入口

```moonbit
using @update { init_model, update }
using @lib { view_counter, view_notification, view_modal, view_tabs, view_toggle }

///|
fn view(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div(
    class="min-h-screen bg-blue-100 p-8",
    [
      // 组合所有组件视图
      view_counter(model),
      view_notification(model),
      view_modal(model),
      view_tabs(model),
      view_toggle(model),
    ],
  )
}

///|
fn main {
  let model = init_model()
  @tea.startup(model~, update~, view~)
}
```

#### types.mbt - 类型定义

```moonbit
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
}
```

#### update.mbt - 状态更新

```moonbit
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
  }
}

///|
/// 更新函数
pub fn update(msg : Msg, model : Model) -> (@tea.Cmd[Msg], Model) {
  match msg {
    CounterIncrement => (none(), { ..model, counter: model.counter + 1 })
    CounterDecrement => (none(), { ..model, counter: model.counter - 1 })
    // ... 其他消息处理
  }
}
```

#### lib/counter.mbt - 组件视图

```moonbit
///|
pub fn view_counter(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    @html.h2(
      class="text-2xl font-semibold text-gray-800 mb-4",
      [@html.text("Counter")],
    ),
    @html.div(
      class="flex flex-col items-center gap-4",
      [
        @html.h1(
          class="text-6xl font-bold text-blue-600",
          [@html.text(model.counter.to_string())],
        ),
        @html.button(
          class="w-12 h-12 bg-green-500 hover:bg-green-600 text-white rounded-full",
          click=CounterIncrement,
          [@html.text("+")],
        ),
      ],
    ),
  ])
}
```

### Web Components 使用说明

#### 单实例架构

本项目采用**单实例架构**，所有 Web Components 共享同一个 RabbitTea 应用实例：

- `main.js` 加载时，`main` 函数自动执行
- `main` 函数调用 `@tea.startup` 启动 RabbitTea 应用（挂载到 `#app`）
- 所有 Web Component（`<rt-showcase>`、`<rt-counter>` 等）共享这个已启动的实例

#### web-components.js

```js
export function defineRabbitTeaElement(tagName, options = {}) {
  class RabbitTeaElement extends HTMLElement {
    async connectedCallback() {
      if (this._rabbitTeaMounted) return

      // 动态加载 main.js，它会自动执行 main 函数启动应用
      await import('/main.js')

      // 应用已经在 main 函数中启动，Web Component 不需要额外操作
      this._rabbitTeaMounted = true
    }
  }

  if (!customElements.get(tagName)) {
    customElements.define(tagName, RabbitTeaElement)
  }
}

// 注册 Web Components
defineRabbitTeaElement('rt-showcase')
defineRabbitTeaElement('rt-counter')
```

#### index.html

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>RabbitTea Web Component Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/styles.css" />
  </head>
  <body>
    <div id="app"></div>
  </body>
  <script type="module" src="/web-components.js"></script>
</html>
```

### 样式系统

项目使用 **Tailwind CSS v4** 进行样式设计：

- `src/styles.css` 包含 Tailwind CSS 导入：`@import "tailwindcss";`
- 所有组件使用 Tailwind 工具类进行样式设计
- 支持响应式设计和现代化 UI 效果

### Using as a GitHub Template

1. 将仓库设为 GitHub Template（在 GitHub 仓库 Settings 里勾选 "Template repository"）。  
2. 在新项目中点击 "Use this template" 创建仓库。  
3. 修改 `moon.mod.json` / `package.json` 中的名称信息。  
4. 在 `src/types/types.mbt` 中定义你的 `Model` 和 `Msg`。  
5. 在 `src/update/update.mbt` 中实现 `init_model` 和 `update`。  
6. 在 `src/lib/` 中创建你的组件视图函数。  
7. 在 `src/main/main.mbt` 中组合视图并启动应用。

### 组件开发指南

#### 添加新组件

1. **在 `src/lib/` 中创建组件视图**：

```moonbit
// src/lib/my-component.mbt
///|
pub fn view_my_component(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div(
    class="bg-white rounded-lg shadow-md p-6",
    [
      @html.h2(
        class="text-2xl font-semibold text-gray-800 mb-4",
        [@html.text("My Component")],
      ),
      // 组件内容
    ],
  )
}
```

2. **在 `src/main/main.mbt` 中使用组件**：

```moonbit
using @lib { view_my_component }

fn view(model : @types.Model) -> @html.Html[@types.Msg] {
  @html.div([
    view_counter(model),
    view_my_component(model),  // 添加新组件
    // ... 其他组件
  ])
}
```

3. **在 `src/types/types.mbt` 中添加消息类型**（如需要）：

```moonbit
pub(all) enum Msg {
  // ... 现有消息
  MyComponentAction
}
```

4. **在 `src/update/update.mbt` 中处理消息**（如需要）：

```moonbit
pub fn update(msg : Msg, model : Model) -> (@tea.Cmd[Msg], Model) {
  match msg {
    // ... 现有处理
    MyComponentAction => (none(), { ..model, /* 更新状态 */ })
  }
}
```

### 技术栈

- **MoonBit**：函数式编程语言
- **RabbitTea**：基于 TEA 架构的 UI 框架
- **Vite**：现代化构建工具
- **Tailwind CSS v4**：实用优先的 CSS 框架
- **Web Components**：原生 Web 组件标准

This template is designed to work nicely with the Web Components primitives described on MDN ([Custom Elements, Shadow DOM, HTML Templates](https://developer.mozilla.org/zh-CN/docs/Web/API/Web_components)).  
RabbitTea renders into a DOM container, which you can place inside a custom element's shadow root or light DOM depending on your needs.
