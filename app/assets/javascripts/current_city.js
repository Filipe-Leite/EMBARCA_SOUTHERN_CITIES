document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('current_city');
    
    input.addEventListener('input', function() {
      const cityName = input.value;
      if (cityName.length >= 3) {
        fetchCitySuggestions(cityName);
      }
    });
  });
  
  function fetchCitySuggestions(cityName) {
    fetch(`/city_suggestions?city=${cityName}`)
      .then(response => response.json())
      .then(data => {
        const suggestionsDiv = document.getElementById('suggestions');
        suggestionsDiv.innerHTML = '';
        
        data.suggestions.forEach(city => {
          const suggestionItem = document.createElement('div');
          suggestionItem.textContent = city;
          suggestionItem.classList.add('suggestion-item');
          suggestionsDiv.appendChild(suggestionItem);
        });
      })
      .catch(error => console.error('Error fetching city suggestions:', error));
  }
  