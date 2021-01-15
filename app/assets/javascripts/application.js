= require jquery
= require jquery_ujs
= require materialize

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
});

$('select').material_select();