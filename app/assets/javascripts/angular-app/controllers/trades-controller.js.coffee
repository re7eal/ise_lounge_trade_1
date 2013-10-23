App.controller 'NewTradeController', ['$scope', 'HaveCourse', 'WantCourse', 'Trade', ($scope, HaveCourse, WantCourse, Trade) ->
 
  $scope.haveCourses = []
  $scope.haveCourseNo = ""
  $scope.haveCourseName = ""
  $scope.haveCourseSection = ""

  $scope.wantCourses = []
  $scope.wantCourseNo = ""
  $scope.wantCourseName = ""
  $scope.wantCourseSection = ""

  $scope.tradeNote = ""

  $scope.errorMessage = ""

  $scope.haveAddCourse = ->
    if ($scope.haveCourseNo is "") or ($scope.haveCourseName is "") or ($scope.haveCourseSection is "")
      $scope.errorMessage = "Please enter a value in all input fields"
      $("#newTradeError").modal "show"
      return

    $scope.haveCourses.push
      course_number: $scope.haveCourseNo
      course_name: $scope.haveCourseName
      course_section: $scope.haveCourseSection

    $scope.haveCourseNo = ""
    $scope.haveCourseName = ""
    $scope.haveCourseSection = ""

  $scope.haveRemoveCourse = (index) ->
    $scope.haveCourses.splice index, 1

  $scope.wantAddCourse = ->
    if ($scope.wantCourseNo is "") or ($scope.wantCourseName is "") or ($scope.wantCourseSection is "")
      $scope.errorMessage = "Please enter a value in all input fields"
      $("#newTradeError").modal "show"
      return

    $scope.wantCourses.push
      course_number: $scope.wantCourseNo
      course_name: $scope.wantCourseName
      course_section: $scope.wantCourseSection

    $scope.wantCourseNo = ""
    $scope.wantCourseName = ""
    $scope.wantCourseSection = ""

  $scope.wantRemoveCourse = (index) ->
    $scope.wantCourses.splice index, 1

  $scope.checkInput = ->
    if ($scope.haveCourses.length <= 0) and ($scope.wantCourses.length <= 0) and ($scope.tradeNote is "")
      $scope.errorMessage = "Empty trade post"
      $("#newTradeError").modal "show"
      return true

  $scope.postTrade = ->
    if $scope.checkInput()
      return
    else
      Trade.save
        note : $scope.tradeNote
        have_courses : $scope.haveCourses
        want_courses : $scope.wantCourses
      , ((response) ->
        console.log "Success"
        window.location.href = "/trades/" + response.id
        ), (response) ->
          console.log "Error" + response.status

]

App.controller 'TradeController', ['$scope', 'TradeMessage', ($scope, TradeMessage) ->

  $scope.tradeMessages = []
  $scope.message = ""

  $scope.loadTradeMessages = (tradeId) ->
    $scope.tradeMessages = TradeMessage.query(
      trade_id : tradeId
    , ((response) ->

    ), (response) ->
      console.log "Error" + response.status
    )

  $scope.postTrade = (tradeId) ->
    if $scope.message is ""
      return
    else
      console.log tradeId
      TradeMessage.save
        content : $scope.message
        trade_id : tradeId
      , ((response) ->
        $scope.tradeMessages.push response
        $scope.message = ""
        ), (response) ->
          console.log "Error" + response.status

]