
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogs) { 
  const dogLinks = [];
  const dogNames = Object.keys(dogs);

  dogNames.forEach(dog => { 
    const dogLink = document.createElement("a");
    dogLink.innerHTML = dog;
    dogLink.href = dogs[dog];

    const outerLi = document.createElement("li");
    outerLi.classList = 'dog-link';
    outerLi.appendChild(doglink);
    dogLinks.push(outerLi);

  })
  return dogLinks;
}

