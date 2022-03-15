const template = document.createElement('template')
template.innerHTML = `
  <div class="card widget-flat shadow-sm">
    <div class="card-body">
      <div id="first col" class="col">
        <div id="top half col" class="row">
          <div class="col m-2">
            <slot name="header">
              <h1 class="card-title">
                100
              </h1>
            </slot>
          </div>
          <div class="col">
            <slot name="body">
              <p class="card-text">
                + 50 %
              </p>
            </slot>
          </div>
        </div>
        <div class="col">
          <slot name="footer">
            <h5 class="card-text my-2">
              Active Users since 1 day ago
            </h5>
          </slot>
        </div>
      </div>
    </div>
  </div>
`

class ActiveUsers extends HTMLElement {
  constructor() {
    super()
      .attachShadow({ mode: "open" })
      .append(template.content.cloneNode(true))
  }
}

window.customElements.define('active-users', ActiveUsers)