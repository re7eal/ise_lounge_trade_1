App.controller 'CommentsController', ['$scope', '$http', '$location', ($scope, $http, $location) ->
 
  # =========================================================================
  # Initialize
  # =========================================================================
 
  $scope.comments = {}
  # if $state.current.name == 'comments'
  $http.get("/api/comments"
 
  # success
  ).then ((response) ->
    $scope.comments = response.data
    
  # failure
  ), (error) ->
 
  $scope.comment = {}
  #if $state.current.name == 'edit'
  $scope.editComments = ->
    $http.get("/api/comments/#{$stateParams['id']}"
 
    # success
    ).then ((response) ->
      $scope.comment = response.data
 
    # failure
    ), (error) ->

  # =========================================================================
  # Create
  # =========================================================================
 
  $scope.createComment = (text, statusId) ->
    $http.post("/api/comments",
      comment:
        content: text
        status_id: statusId
 
    # success
    ).then ((response) ->
    #  $location.path "/"
      $scope.comments.push(response.data)
 
    # failure
    ), (error) ->
 
  # =========================================================================
  # Update
  # =========================================================================
 
  $scope.updateComment = ->
    $http.put("/api/comments/#{$scope.comment.id}",
      comment:
        content: $scope.comment.content
        status_id: $scope.comment.status_id
 
    # success
    ).then ((response) ->
      $location.path "/"
 
    # failure
    ), (error) ->
 
  # =========================================================================
  # Destroy
  # =========================================================================
 
  $scope.destroyComment = (id) ->
    $http.delete("/api/comments/#{id}"
 
    # success
    ).then ((response) ->
      $http.get("/api/comments").then ((response) ->
        $scope.comments = response.data
      ), (error) ->
 
    # failure
    ), (error) ->
 
  return false

]