App.controller 'NewTradeController', ['$scope', '$location', 'HaveCourse', 'WantCourse', 'Trade', ($scope, $location, HaveCourse, WantCourse, Trade) ->
 
  $scope.haveCourses = []
  $scope.haveCourseNo = ""
  $scope.haveCourseName = ""
  $scope.haveCourseSection = ""

  $scope.wantCourses = []
  $scope.wantCourseNo = ""
  $scope.wantCourseName = ""
  $scope.wantCourseSection = ""

  $scope.tradeNote = ""

  $scope.haveAddCourse = ->
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
    $scope.wantCourses.push
      course_number: $scope.wantCourseNo
      course_name: $scope.wantCourseName
      course_section: $scope.wantCourseSection

    $scope.wantCourseNo = ""
    $scope.wantCourseName = ""
    $scope.wantCourseSection = ""

  $scope.wantRemoveCourse = (index) ->
    $scope.wantCourses.splice index, 1

  $scope.postTrade = ->
    Trade.save
      note : $scope.tradeNote
    , ((response) ->
      for haveCourse of $scope.haveCourses
        HaveCourse.save
          course_number : $scope.haveCourses[haveCourse].course_number
          course_name : $scope.haveCourses[haveCourse].course_name
          course_section : $scope.haveCourses[haveCourse].course_section
        , ((response) ->
          console.log "Success"
        ), (response) ->
          console.log "Error" + response.status

      for wantCourse of $scope.wantCourses
        WantCourse.save
          course_number : $scope.wantCourses[wantCourse].course_number
          course_name : $scope.wantCourses[wantCourse].course_name
          course_section : $scope.wantCourses[wantCourse].course_section
        , ((response) ->
          console.log "Success"
        ), (response) ->
          console.log "Error" + response.status
      ), (response) ->
        console.log "Error" + response.status

]