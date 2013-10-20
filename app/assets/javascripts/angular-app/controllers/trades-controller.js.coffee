App.controller 'NewTradeController', ['$scope', '$http', '$location', ($scope, $http, $location) ->
 
  $scope.haveCourses = []
  $scope.haveCourseNo = ""
  $scope.haveCourseName = ""
  $scope.haveCourseSection = ""

  $scope.wantCourses = []
  $scope.wantCourseNo = ""
  $scope.wantCourseName = ""
  $scope.wantCourseSection = ""

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
    

]