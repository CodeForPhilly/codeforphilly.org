$( document ).ready(function() {
    [
        { jsSiteSearch: 'js-site-search', navbarSearchBarDropdown: 'navbarSearchBarDropdown' },
        { jsSiteSearch: 'js-site-search-2', navbarSearchBarDropdown: 'navbarSearchBarDropdown-2' },
    ].forEach(({ jsSiteSearch, navbarSearchBarDropdown }) => {
        document.getElementById(navbarSearchBarDropdown).addEventListener('focusout', function (evt) {
            $(`#${navbarSearchBarDropdown}`).removeClass('show');
        });

        document.getElementById(jsSiteSearch).addEventListener('input', debounce(
            function(evt) {
                var searchTerm = evt.target.value;
                fetch(`/search?q=${searchTerm}&include=recordTitle%2CrecordURL&format=json`)
                    .then(response => response.json())
                    .then(data => {
                        $(`#${navbarSearchBarDropdown}`).empty();
                        $(`#${navbarSearchBarDropdown}`).removeClass('show');

                        if (!data.data) return;

                        $(`#${navbarSearchBarDropdown}`).addClass('show');

                        let section = $(`<div class="results-group"><h6 class="group-title dropdown-header">Top results</h6></div>`);
                        section.appendTo(`#${navbarSearchBarDropdown}`);

                        if (data.data['Laddr\\Project'].length) {
                            let section = $(`<div class="results-group"><h6 class="group-title dropdown-header">Projects</h6></div>`);
                            section.appendTo(`#${navbarSearchBarDropdown}`);
                            data.data['Laddr\\Project'].slice(0, 3).forEach(result => {
                                $(`<a class="dropdown-item nav-link" href="${result.recordURL}">${result.Title}</a>`).appendTo(section);
                            });
                        }
                        if (data.data['Laddr\\ProjectBuzz'].length) {
                            let section = $(`<div class="results-group"><h6 class="group-title dropdown-header">Project Buzz</h6></div>`);
                            section.appendTo(`#${navbarSearchBarDropdown}`);
                            data.data['Laddr\\ProjectBuzz'].slice(0, 3).forEach(result => {
                                $(`<a class="dropdown-item nav-link" href="${result.recordURL}">${result.Headline}</a>`).appendTo(section);
                            });
                        }
                        if (data.data['Laddr\\ProjectUpdate'].length) {
                            let section = $(`<div class="results-group"><h6 class="group-title dropdown-header">Project Updates</h6></div>`);
                            section.appendTo(`#${navbarSearchBarDropdown}`);
                            data.data['Laddr\\ProjectUpdate'].slice(0, 3).forEach(result => {
                                $(`<a class="dropdown-item nav-link" href="${result.recordURL}">${result.recordTitle}</a>`).appendTo(`#${navbarSearchBarDropdown}`);
                            });
                        }
                        if (data.data['Tag'].length) {
                            let section = $(`<div class="results-group"><h6 class="group-title dropdown-header">Tags</h6></div>`);
                            section.appendTo(`#${navbarSearchBarDropdown}`);
                            data.data['Tag'].slice(0, 3).forEach(result => {
                                $(`<a class="dropdown-item nav-link" href="${result.recordURL}">${result.Title}</a>`).appendTo(`#${navbarSearchBarDropdown}`);
                            });
                        }
                    });
            },
            250
        ));
    });
});
