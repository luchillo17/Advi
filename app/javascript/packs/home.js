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
    limit: 10,
    minLength: 2,
    onAutocomplete: (text) => {
      const url = new URL(location.href);
      url.searchParams.set("q", text);

      Turbolinks.visit(url.toString());
    },
  });
};

if (document.readyState === "complete") {
  homeInit();
} else {
  addEventListener("turbolinks:load", homeInit);
}
