App.controller 'UsersController', ['$scope', '$http', '$location', ($scope, $http, $location) ->
 
  # =========================================================================
  # Initialize
  # =========================================================================
 
  $scope.users = {}
  # if $state.current.name == 'users'
  $scope.getUsers = ->
    $http.get("/api/users"
 
    # success
    ).then ((response) ->
      $scope.users = response.data
    
    # failure
    ), (error) ->
 
  $scope.getUsers()
  $scope.user = {}
  #  if $state.current.name == 'edit'
  $scope.editUser = (id) ->
    $http.get("/api/users/#{id}"
 
    # success
    ).then ((response) ->
      $scope.user = response.data
 
    # failure
    ), (error) ->

  # =========================================================================
  # Create
  # =========================================================================
 
  $scope.createUser = ->
    $http.post("/api/users",
      user:
        name: $scope.user.name
        lastname: $scope.user.lastname
        birthday: $scope.user.birthday
        education: $scope.user.education
        hobbies: $scope.user.hobbies
        relationship: $scope.user.relationship
 
    # success
    ).then ((response) ->
      $location.path "/"
 
    # failure
    ), (error) ->
 
  # =========================================================================
  # Update
  # =========================================================================
 
  $scope.updateUser = ->
    $http.put("/api/users/#{$scope.user.id}",
      user:
        name: $scope.user.name
        lastname: $scope.user.lastname
        birthday: $scope.user.birthday
        education: $scope.user.education
        hobbies: $scope.user.hobbies
        relationship: $scope.user.relationship
 
    # success
    ).then ((response) ->
    #  $location.path "/"
      $scope.getUsers()
 
    # failure
    ), (error) ->
 
  # =========================================================================
  # Destroy
  # =========================================================================
 
  $scope.destroyUser = (id) ->
    $http.delete("/api/users/#{id}"
 
    # success
    ).then ((response) ->
      $http.get("/api/users").then ((response) ->
        $scope.users = response.data
      ), (error) ->
 
    # failure
    ), (error) ->
 
  return false

]