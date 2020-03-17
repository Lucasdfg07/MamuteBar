$( document ).on('turbolinks:load', function() {
  new Morris.Line({
    element: 'requests_chart',
    data: $('#requests_chart').data('requests'),
    xkey: 'created_at',
    ykeys: ['received', 'spent'],
    labels: ['Faturado (R$)','Quantia Gasta (R$)'],
    lineColors: ['#007bff', '#DC143C']
  });

  Morris.Bar({
    element: 'payment_chart',
    data: $('#payment_chart').data('requests'),
    xkey: 'created_at',
    ykeys: ['cash', 'card'],
    labels: ['Dinheiro', 'Cartão']
  }).on('click', function(i, row){
    console.log(i, row);
  });
});