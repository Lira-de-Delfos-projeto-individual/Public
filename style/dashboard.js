// Gráfico de Barras - Progresso por Módulo
const barCtx = document.getElementById('barChart').getContext('2d');
new Chart(barCtx, {
  type: 'bar',
  data: {
    labels: ['Módulo 1', 'Módulo 2', 'Módulo 3', 'Módulo 4'],
    datasets: [{
      label: 'Progresso (%)',
      data: [100, 60, 30, 0],
      backgroundColor: ['#4caf50', '#ff9800', '#f44336', '#9e9e9e'],
    }],
  },
  options: {
    scales: {
      y: {
        beginAtZero: true,
        max: 100,
      },
    },
  },
});

// Gráfico de Pizza - Conclusão Geral
const pieCtx = document.getElementById('pieChart').getContext('2d');
new Chart(pieCtx, {
  type: 'pie',
  data: {
    labels: ['Concluído', 'Restante'],
    datasets: [{
      data: [65, 35],
      backgroundColor: ['#4caf50', '#e0e0e0'],
    }],
  },
});

// Gráfico de Linha - Ritmo de Estudo
const lineCtx = document.getElementById('lineChart').getContext('2d');
new Chart(lineCtx, {
  type: 'line',
  data: {
    labels: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4'],
    datasets: [{
      label: 'Horas Estudadas',
      data: [3, 5, 4, 7],
      borderColor: '#4caf50',
      backgroundColor: 'rgba(76, 175, 80, 0.2)',
      tension: 0.3,
    }],
  },
});

