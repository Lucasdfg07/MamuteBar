$( document ).on('turbolinks:load', function() {
  new Morris.Line({
    element: 'requests_chart',
    data: $('#requests_chart').data('requests'),
    xkey: 'created_at',
    ykeys: ['price'],
    labels: ['Faturado']
  });
});