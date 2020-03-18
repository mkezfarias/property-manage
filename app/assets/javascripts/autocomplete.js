console.log('required')
window.onload = () => {
  (function () {
    const searchInp = document.getElementById('search_string');
    if (searchInp) {
      const dropDownContainer = document.getElementById('dropDownOpts');
      const dropDownOpts = [...dropDownContainer.querySelectorAll('option')];
      const clickCatcher = document.getElementById('click-catcher')

      dropDownOpts.forEach(option => {
        option.addEventListener('click', e => {
          searchInp.value = e.target.innerText;
          clickCatcher.classList.add('hidden');

          dropDownOpts.forEach(opt => {
            opt.innerText = '';
            opt.classList.add('hidden');
          });
          dropDownContainer.classList.add('hidden');
        });
      });

      clickCatcher.addEventListener('click', e => {
        dropDownContainer.classList.add('hidden');
        e.target.classList.add('hidden');
      });

      searchInp.addEventListener('input', async e => {
        if (e.target.value.length > 1) {

          let autoComplete = await fetch(`http://localhost:3000/landing_pages/${searchInp.value}/auto_complete.json`);

          let jsonRes = await autoComplete.json();

          if (dropDownContainer.classList.contains('hidden')) {
            dropDownContainer.classList.remove('hidden');
          } else {
            jsonRes.forEach((res, i) => {
              dropDownOpts[i].classList.add('hidden');
            });
          }

          dropDownOpts.forEach((opt, i) => {
            if (jsonRes[i]) {
              opt.innerText = jsonRes[i];
              dropDownOpts[i].classList.remove('hidden');
            } else {
              opt.innerText = '';
              opt.classList.add('hidden');
            }
          });
        }

        clickCatcher.classList.remove('hidden');
      });
    }
  })();
};