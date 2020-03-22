$( document ).on('turbolinks:load', function() {
  // new Morris.Line({
  //   element: 'requests_chart',
  //   data: $('#requests_chart').data('requests'),
  //   xkey: 'created_at',
  //   ykeys: ['received', 'spent'],
  //   labels: ['Faturado (R$)','Quantia Gasta (R$)'],
  //   lineColors: ['#007bff', '#DC143C']
  // });

  Morris.Bar({
        element: 'bar-example',
        data: [
            { y: '2006', a: 100, b: 90 },
            { y: '2007', a: 75, b: 65 },
            { y: '2008', a: 50, b: 40 },
            { y: '2009', a: 75, b: 65 },
            { y: '2010', a: 50, b: 40 },
            { y: '2011', a: 75, b: 65 },
            { y: '2012', a: 100, b: 90 }
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B']
    });
});