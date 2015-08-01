module ShowParentAtSubtask
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_issues_show_description_bottom,
              :partial => 'issues/parent_status'
  end
end
