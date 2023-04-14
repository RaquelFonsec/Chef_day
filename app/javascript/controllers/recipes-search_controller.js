import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "query", "results", "clearResults" ];

  connect() {
    if (!this.element.classList.contains("my-recipes-search-form")) {
      console.error("Incorrect element for recipes search controller");
      return;
    }
  }

  search(event) {
    event.preventDefault();

    if (this.hasQueryTarget && this.hasResultsTarget) {
      const query = this.queryTarget.value;
      fetch("/recipes", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({query: query})
      })
      .then(response => response.json())
      .then(data => {
        if (data && data.hits && data.hits.length > 0) {
          const hits = data.hits;
          let html = "";
          hits.forEach(hit => {
            const recipe = hit.recipe;
            html += `
              <div class="recipe-card">
                <div class="recipe-card-img">
                  <img src="${recipe.image}" alt="${recipe.label}">
                </div>
                <div class="recipe-card-content">
                  <h3 class="recipe-card-title">${recipe.label}</h3>
                  <p class="recipe-card-calories">${recipe.calories.toFixed(2)} calories</p>
                  <a href="${recipe.url}" target="_blank" class="recipe-card-link">View Recipe</a>
                </div>
              </div>
            `;
          });

          if (this.hasResultsTarget) {
            this.clearResultsTarget.hidden = false;
            this.resultsTarget.innerHTML = html;
          }
          else {
            console.error("No results target found");
          }
        }
        else {
          console.error("No hits found");
        }
      })
      .catch(error => {
        console.error("fetch error:", error);

        if (this.hasResultsTarget) {
          this.resultsTarget.innerHTML = '<p class="error">Oops, something went wrong. Please try again later.</p>';
        }
        else {
          console.error("No results target found");
        }
      });
    }
    else {
      console.error("Missing query or results target");
    }
  }
}
