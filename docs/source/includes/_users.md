# Users

## Create user
The endpoint that will create a user

```shell
curl -X POST <%= route_for(:create_user) %> \
  -H 'Content-Type: application/vnd.api+json'
  -d '<%= render_json_file('users/requests/create.json') %>'
```

> Request example

```json
<%= render_json_file('users/requests/create.json') %>
```

> Response 200

```json
<%= render_json_file('users/responses/create.json', { id: '42' }) %>
```

### HTTP Request

`POST <%= route_for(:create_user) %>`

### Links

Link                | Description
--------------------|-----------
self                | Resource get link


## Update user
The endpoint that will update a user

```shell
curl -X PATCH <%= route_for(:update_user, id: 42) %> \
  -H 'Content-Type: application/vnd.api+json'
  -d '<%= render_json_file('users/requests/update.json', { id: '42', attributes: { first_name: 'Ion' }.to_json }) %>'
```

> Request example

```json
<%= render_json_file('users/requests/update.json', { id: '42', attributes: { first_name: 'Ion' }.to_json }) %>
```

> Response 200

```json
<%= render_json_file('users/responses/update.json', { id: '42' }) %>
```

### HTTP Request

`PATCH <%= route_for(:update_user) %>`

### Links

Link                | Description
--------------------|-----------
self                | Resource get link


## Delete user
The endpoint that will delete a user

```shell
curl -X DELETE <%= route_for(:delete_user, id: 42) %> \
  -H 'Content-Type: application/vnd.api+json'
```

> Response 204

### HTTP Request

`DELETE <%= route_for(:delete_user, id: 42) %>`

## Get user
The endpoint that will get a user

```shell
curl -X GET <%= route_for(:user, id: 42) %> \
  -H 'Content-Type: application/vnd.api+json'
```

> Response 200

```json
<%= render_json_file('users/responses/get.json') %>
```

### HTTP Request

`GET <%= route_for(:user, id: 42) %>`

### Links

Link                | Description
--------------------|-----------
self                | Resource get link


## Get all users
The endpoint that will get all users

```shell
curl -X GET <%= route_for(:users) %> \
  -H 'Content-Type: application/vnd.api+json'
```

> Response 200

```json
<%= render_json_file('users/responses/get_all.json') %>
```

### HTTP Request

`GET <%= route_for(:users) %>`

### Links

Link                | Description
--------------------|-----------
self                | Resource get link

### Filtering

You can filter users by the following attributes: `first_name`.

Parameter                      | Required | Description
------------------------------ | ------- | -----------
filter                         | false  | Object specifying how to filter the result set.
filter[attribute]              | true   | Specifies the attribute on which the filtering will be done
