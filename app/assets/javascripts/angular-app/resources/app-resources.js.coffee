App.factory 'Trade', ['$resource', ($resource) ->
  $resource '/trades'
]

App.factory 'TradeMessage', ['$resource', ($resource) ->
  $resource '/trade_messages'
]

App.factory 'HaveCourse', ['$resource', ($resource) ->
  $resource '/have_courses'
]

App.factory 'WantCourse', ['$resource', ($resource) ->
  $resource '/want_courses'
]
