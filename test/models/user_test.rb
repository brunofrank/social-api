require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Uniqueness username' do
    user = users(:john)
    user.save

    another_user = user.dup

    assert_not another_user.valid?
    assert_not_nil another_user.errors[:username], 'Username cannot repeat'
  end

  test '#follow!' do
    john = users(:john)
    jane = users(:jane)

    john.follow!(jane)

    assert_not_empty john.followeds
    assert_equal john.followeds.first.username, jane.username
  end

  test '#unfollow!' do
    john = users(:john)
    jane = users(:jane)

    john.follow!(jane)

    assert_not_empty john.followeds

    john.unfollow!(jane)

    assert_empty john.followeds
  end
end
