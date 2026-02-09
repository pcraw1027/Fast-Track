// app/javascript/packs/tabs.js
document.addEventListener("turbolinks:load", () => {
  document.querySelectorAll(".nav-tabs a").forEach(tab => {
    tab.addEventListener("click", event => {
      const url = tab.dataset.url;
      if (!url) return

      const targetId = tab.getAttribute("href")
      const pane = document.querySelector(targetId)
      const container = pane.querySelector(".tab-content-body")

      // Avoid reloading on repeat clicks
      if (container.dataset.loaded === "true") return

      container.innerHTML = "<div class='spinner-border'></div>"

      fetch(url, {
        headers: { "X-Requested-With": "XMLHttpRequest" }
      })
        .then(res => res.text())
        .then(html => {
          container.innerHTML = html
          container.dataset.loaded = "true"
        })
    })
  })
})



document.addEventListener("turbolinks:load", () => {
  const activeTab = document.querySelector(".nav-tabs a.active")
  if (activeTab) activeTab.click()
})

document.addEventListener("click", event => {
  const link = event.target.closest(".pagination a")
  if (!link) return

  event.preventDefault()

  fetch(link.href, {
    headers: { "X-Requested-With": "XMLHttpRequest" }
  })
    .then(res => res.text())
    .then(html => {
      link.closest(".tab-content-body").innerHTML = html
    })
})


document.addEventListener("submit", event => {
  const form = event.target
  if (!form.matches(".jump-to-form")) return

  event.preventDefault()

  const url = form.action + "?" + new URLSearchParams(new FormData(form))

  fetch(url, {
    headers: { "X-Requested-With": "XMLHttpRequest" }
  })
    .then(res => res.text())
    .then(html => {
      form.closest(".tab-content-body").innerHTML = html
    })
})
