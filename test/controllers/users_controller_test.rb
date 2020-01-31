require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    name = 'John Doe'
    username = 'johndoe'
    post api_users_create_url, params: { user: { name: name, username: username } }

    assert_response :success
    assert_equal({ 'name' => name, 'username' => username }, response.parsed_body['data']['attributes'])
  end

  test 'should get follow' do
    john = users(:john)
    jane = users(:jane)

    post api_users_follow_url(john, jane)
    assert_response :success
  end

  test 'should get unfollow' do
    john = users(:john)
    jane = users(:jane)

    john.follow!(jane)

    post api_users_unfollow_url(john, jane)
    assert_response :success
  end

  test 'should get followers' do
    john = users(:john)
    jane = users(:jane)

    john.follow!(jane)

    get api_users_followers_url(jane)

    follower = response.parsed_body['data'][0]['attributes']
    assert_response :success
    assert_equal({ 'name' => john.name, 'username' => john.username }, follower)
  end
end
