$(function () {
  window.Pool = {}

  Pool.main = function () {
    Pool.getPoolPerformance()
      .then(function (response) {
        Pool.setRecentHashRate(response.data)
      })

  }

  Pool.getPoolPerformance = function () {
    try {
      return axios.get("/api/pools/wae/performance")
    } catch (error) {
      console.error(error)
    }
  }

  Pool.setRecentHashRate = function (stats) {
    let poolHashrate = ['Pool Hashrate']
    let time = ['time']

    $.each(stats.stats, function (index, stat) {
      poolHashrate.push(stat.poolHashrate)
      time.push(new Date(stat.created))
    })

    let c3LineChart = c3.generate({
      bindto: '#c3-recent-hash-rate',
      data: {
        x: 'time',
        xFormat: '%Y-%m-%d %H:%M:%S',
        columns: [
            time,
            poolHashrate
        ],
        axes: {
          poolHashrate: 'y'
        }
      },
      color: {
        pattern: ['#db2d94', '#fdd1ac']
      },
      axis: {
        x: {
          type: 'timeseries',
          tick: {
            fit: true,
            format: '%H:%M:%S'
          }
        },
        y: {
          // label: {
          //   text: 'Pool Hashrate',
          //   position: 'outer-middle'
          // },
          tick: {
            format: function (d) {
              return GoHashMe.hashFormat(d)
            },
            count: 10
          }
        },
        // y2: {
        //   show: true,
        //   min: 0,
        //   label: {
        //     text: 'Miners',
        //     position: 'outer-middle'
        //   }
        // }
      }
    })
  }

  Pool.main()
})