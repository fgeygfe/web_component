export function defineRabbitTeaElement(tagName, options = {}) {
  class RabbitTeaElement extends HTMLElement {
    async connectedCallback() {
      // 避免同一个元素重复挂载
      if (this._rabbitTeaMounted) return

      // 动态加载 RabbitTea 编译出来的 main.js
      // main.js 会在加载时自动执行 main 函数，启动 RabbitTea 应用
      await import('/main.js')

      // RabbitTea 应用已经在 main 函数中启动并挂载到 #app
      // Web Component 不需要做任何事情，应用已经运行
      this._rabbitTeaMounted = true
    }
  }

  if (!customElements.get(tagName)) {
    customElements.define(tagName, RabbitTeaElement)
  }
}

// 注册 Web Components（它们共享同一个 RabbitTea 实例）
defineRabbitTeaElement('rt-showcase')
defineRabbitTeaElement('rt-counter')

if (typeof window !== 'undefined') {
  const root = document.getElementById('app')
  if (root && root.childElementCount === 0) {
    const showcase = document.createElement('rt-showcase')
    root.appendChild(showcase)
  }
}

