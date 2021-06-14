const homeInit = async () => {
  autoCompleteInit();
  chipsInit();
};

const autoCompleteInit = async () => {
  const autocomplete = document.querySelector("#autocomplete-input");

  const experiences = (await (await fetch("/experiences.json")).json()) || [];
  const data = experiences.reduce((acum, experience) => {
    acum[experience.title] = null;
    return acum;
  }, {});

  M.Autocomplete.init(autocomplete, {
    data,
    limit: 10,
    minLength: 2,
    onAutocomplete: (text) => {
      const url = new URL(location.href);
      let queries = url.searchParams.getAll("q[]");

      queries.push(text);

      queries = [...new Set(queries)];

      setQueries(url, queries);
    },
  });
};

const chipsInit = async () => {
  const chips = document.querySelectorAll(".chip i.close");

  for (let chip of chips) {
    chip.addEventListener(
      "click",
      ({ target }) => {
        const {
          dataset: { query },
        } = target;

        const url = new URL(location.href);

        const queries = url.searchParams
          .getAll("q[]")
          .filter((q) => q !== query);

        setQueries(url, queries);
      },
      { once: true }
    );
  }
};

const setQueries = (url, queries) => {
  url.searchParams.delete("q[]");

  for (let q of queries) {
    url.searchParams.append("q[]", q);
  }

  Turbolinks.visit(url.toString());
};

if (document.readyState === "complete") {
  // Delay a little for race condition on self navigation
  setTimeout(() => {
    homeInit();
  }, 300);
} else {
  addEventListener("turbolinks:load", homeInit, { once: true });
}
