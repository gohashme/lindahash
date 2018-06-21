$(function () {
  window.Dashboard = {}
  let totalHashrate = 0

  Dashboard.main = function () {
    // first time

    if (localStorage.getItem('worker-address')) {
      // has not ben set
      $(".worker-address").val(localStorage.getItem('worker-address'))

      Dashboard.getMiner(localStorage.getItem('worker-address'))
        .then(function (response) {
          Dashboard.setMinerData(response.data)
        })

      Dashboard.getMinerPayments(localStorage.getItem('worker-address'))
        .then(function (response) {
          Dashboard.setMinerPayments(response.data)
        })

      // flip buttons
      $('.track-worker').hide()
      $('.reset-dashboard').show()
    }

    Dashboard.inputHawk()
  }

  Dashboard.inputHawk = function () {
    $(".track-worker").click(function () {
      if ($(".worker-address").val().length != 0) {
        localStorage.setItem('worker-address', $(".worker-address").val())

        Dashboard.getMiner($(".worker-address").val())
          .then(function (response) {
            Dashboard.setMinerData(response.data)
          })

        Dashboard.getMinerPayments(localStorage.getItem('worker-address'))
          .then(function (response) {
            Dashboard.setMinerPayments(response.data)
          })

        // flip buttons
        $('.track-worker').hide()
        $('.reset-dashboard').show()
      }
    });

    $(".reset-dashboard").click(function () {

      $(".worker-address").val("")

      // flip buttons
      $('.reset-dashboard').hide()
      $('.track-worker').show()

      localStorage.removeItem('worker-address')
    });
  }

  Dashboard.getMiner = function (address) {
    try {
      return axios.get("/api/pools/wae/miners/" + address)
    } catch (error) {
      console.error(error)
    }
  }

  Dashboard.getMinerPayments = function (address) {
    try {
      return axios.get("/api/pools/wae/miners/" + address + "/payments")
    } catch (error) {
      console.error(error)
    }
  }

  Dashboard.setWorkers = function (workers) {
    $.each(workers, function (index, worker) {
      $('.miner-worker-table tbody').append([
        '<tr>',
        '<td>' + index + '</td>',
        '<td>' + GoHashMe.hashFormat(worker.hashrate)+ '</td>',
        '<td>' + GoHashMe.hashFormat(worker.sharesPerSecond, "") + '</td>',
        '</tr>'
      ].join(''))

      totalHashrate += worker.hashrate
    })

    $('.miner-my-hashrate').html(GoHashMe.hashFormat(totalHashrate))
  }

  Dashboard.setMinerData = function (data) {
    $('.miner-pending-shares').html(data.pendingShares)
    $('.miner-total-earning').html(GoHashMe.hashFormat(data.totalPaid, ""))
    // $('.miner-last-payment').html(moment(Date.parse(data.lastPayment)).fromNow()) // .format("MM/DD/YYYY")
    $('.miner-last-payment').html(moment(Date.parse(data.lastPayment)).format("LTS"))

    if (data.hasOwnProperty('performance')) {
      $('.appear-hh-worker').hide()
      Dashboard.setWorkers(data.performance.workers)
    } else {
      $('.appear-hh-worker').html("No active worker")
    }
  }

  Dashboard.setMinerPayments = function (payments) {
    if (payments.length == 0) {
      $('.appear-hh-payments').html("No payments have been made")
    } else {
      $('.appear-hh-payments').hide()

      $.each(payments, function (index, payment) {
        $('.miner-payments-table tbody').append([
          '<tr>',
          '<td>' + payment.created + '</td>',
          '<td><a href="' + payment.addressInfoLink + '" target="_blank">' + payment.address + '</a></td>',
          '<td><a href="' + payment.transactionInfoLink + '" target="_blank">' + payment.amount + ' WAE</a></td>',
          '</tr>'
        ].join(''))
      })
    }
  }

  Dashboard.main()
})