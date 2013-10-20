App.controller 'StatusesController', ['$scope', '$http', '$location', ($scope, $http, $location) ->
 
  # =========================================================================
  # Initialize
  # =========================================================================
 
  $scope.statuses = {}
  # if $state.current.name == 'statuses'
  # $scope.getStatuses = ->
  $http.get("/api/statuses"
 
  # success
  ).then ((response) ->
    $scope.statuses = response.data
    
  # failure
  ), (error) ->
 
  $scope.status = {}
  #if $state.current.name == 'edit'
  $scope.editStatuses = ->
    $http.get("/api/statuses/#{$stateParams['id']}"
 
    # success
    ).then ((response) ->
      $scope.status = response.data
 
    # failure
    ), (error) ->

  # =========================================================================
  # Create
  # =========================================================================
 
  $scope.createStatus = (text, userId) ->
    $http.post("/api/statuses",
      status:
        content: text
        user_id: userId
 
    # success
    ).then ((response) ->
    #  $location.path "/"
      $scope.statuses.push(response.data)
 
    # failure
    ), (error) ->
 
  # =========================================================================
  # Update
  # =========================================================================
 
  $scope.updateStatus = ->
    $http.put("/api/statuses/#{$scope.status.id}",
      status:
        content: $scope.status.content
        user_id: $scope.status.user_id
 
    # success
    ).then ((response) ->
      $location.path "/"
 
    # failure
    ), (error) ->
 
  # =========================================================================
  # Destroy
  # =========================================================================
 
  $scope.destroyStatus = (id) ->
    $http.delete("/api/statuses/#{id}"
 
    # success
    ).then ((response) ->
      $http.get("/api/statuses").then ((response) ->
        $scope.statuses = response.data
      ), (error) ->
 
    # failure
    ), (error) ->
 
  return false

]
