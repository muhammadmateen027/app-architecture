class TestModels {
  List<dynamic> launchesResponse() {
    return <dynamic>[
      {
        'links': {
          'patch': {
            'small': 'https://images2.imgbox.com/94/f2/NN6Ph45r_o.png',
            'large': 'https://images2.imgbox.com/5b/02/QcxHUb5V_o.png'
          },
          'webcast': 'https://www.youtube.com/watch?v=0a_00nJ_Y88',
          'article':
              'https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html',
          'wikipedia': 'https://en.wikipedia.org/wiki/DemoSat'
        },
        'static_fire_date_utc': '2006-03-17T00:00:00.000Z',
        'rocket': '5e9d0d95eda69955f709d1eb',
        'details': 'Engine failure at 33 seconds and loss of vehicle',
        'ships': ['5ea6ed2d080df4000697c901'],
        'flight_number': 1,
        'name': 'FalconSat',
        'date_precision': 'hour',
        'id': '5eb87cd9ffd86e000604b32a'
      },
      {
        'links': {
          'patch': {
            'small': 'https://images2.imgbox.com/c5/f4/XfLVgbaO_o.png',
            'large': 'https://images2.imgbox.com/94/8d/YnZ1SLsT_o.png'
          },
          'webcast': 'https://www.youtube.com/watch?v=tpQzDbAY7yI',
          'article': 'https://en.wikipedia.org/wiki/Dragon_C2%2B',
          'wikipedia': 'https://en.wikipedia.org/wiki/Dragon_C2%2B'
        },
        'static_fire_date_utc': '2012-09-29T00:00:00.000Z',
        'rocket': '5e9d0d95eda69955f709d1eb',
        'details':
            'Launch was scrubbed on first attempt, second launch attempt was successful',
        'ships': ['5ea6ed2d080df4000697c901'],
        'flight_number': 1,
        'name': 'COTS 2',
        'date_precision': 'hour',
        'id': '5eb87cdfffd86e000604b331'
      }
    ];
  }

  Map<String, dynamic> launchDto() {
    return {
      'links': {
        'patch': {
          'small': 'https://images2.imgbox.com/94/f2/NN6Ph45r_o.png',
          'large': 'https://images2.imgbox.com/5b/02/QcxHUb5V_o.png'
        },
        'webcast': 'https://www.youtube.com/watch?v=0a_00nJ_Y88',
        'article':
            'https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html',
        'wikipedia': 'https://en.wikipedia.org/wiki/DemoSat'
      },
      'static_fire_date_utc': '2006-03-17T00:00:00.000Z',
      'rocket': '5e9d0d95eda69955f709d1eb',
      'details': 'Engine failure at 33 seconds and loss of vehicle',
      'ships': ['5ea6ed2d080df4000697c901'],
      'flight_number': 1,
      'name': 'FalconSat',
      'date_precision': 'hour',
      'id': '5eb87cd9ffd86e000604b32a'
    };
  }
}
