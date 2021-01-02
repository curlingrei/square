module GroupsHelper
  def num_over?(group)
    group.participates.size >= group.target_number
  end
end
