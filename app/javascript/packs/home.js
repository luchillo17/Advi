document.addEventListener("DOMContentLoaded", async function () {
  var autocomplete = document.querySelector("#autocomplete-input");

  const users = await fetch(users_path);
  console.log("Users: ", users);
  // var instances = M.Autocomplete.init(autocomplete, options);
});
