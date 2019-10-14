class AddBadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    add_badges
  end

  def add_badges
    Badge.find_each do |badge|
      rule = badge.rule
      rule_type = rule.rule_type
      
      @user.badges.push(badge) if rule.send("#{rule_type}?", @test_passage)
    end
  end
end