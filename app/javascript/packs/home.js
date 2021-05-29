const homeInit = async () => {
  const autocomplete = document.querySelector("#autocomplete-input");

  const experiences = (await (await fetch("/experiences.json")).json()) || [];
  const data = experiences.reduce((acum, experience) => {
    acum[experience.title] = null;
    return acum;
  }, {});

  console.log("Experiences: ", experiences, autocomplete);

  const instances = M.Autocomplete.init(autocomplete, {
    data,
  });
};

if (document.readyState === "complete") {
  homeInit();
} else {
  addEventListener("turbolinks:load", homeInit);
}
