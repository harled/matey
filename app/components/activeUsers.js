const template = document.createElement('template')
template.innerHTML = `
  <style>
    .container {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      grid-template-rows: repeat(2, 1fr);
      justify-items: center;
      align-items: center;

      background-color: #e3242b;
      color: white;
      box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);

      word-wrap: break-word;
      border: 0;
      border-radius: 0.5rem;
      padding: 1.25rem;
      min-width: 10rem;
      max-width: 16rem;
    }

    .text {
      grid-column: span 2;
    }
  </style>

  <div class="container">
    <slot name="number">
      <h1><span id="number">###</span></h1>
    </slot>
    <slot name="stat">
      <p><span id="symbol">+</span> <span id="trend">##</span> / <span id="percent">##</span> %<br>since last week</p>
    </slot>
    <div class="text">
      <slot name="text">
        <h2>Active users since<br><span id="date">####-##-##</span></h2>
      </slot>
    </div>
  </div>
`

class ActiveUsers extends HTMLElement {
  constructor() {
    super()
      .attachShadow({ mode: "open" })
      .append(template.content.cloneNode(true))
  }

  connectedCallback() {
    let possibleAttributes = ["number", "symbol", "trend", "percent", "date"]
    possibleAttributes.forEach((attribute) => {
      if (this.getAttribute(attribute)) {
        this.shadowRoot.querySelector(`#${attribute}`).innerHTML = this.getAttribute(attribute)
      }
    })
  }
}

window.customElements.define('active-users', ActiveUsers)