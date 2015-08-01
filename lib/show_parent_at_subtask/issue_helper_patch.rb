# IssuesHelperに関数を追加する
require_dependency 'issues_helper'

module IssuesHelperPatch
  def self.included(base)
    # 定義したInstanceMethodsを読み込ませる
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    # 自分と子チケットを表示する
    def render_issue_self_and_descendants_tree(root_issue, this_issue)
      s = '<form><table class="list issues">'
      issue_list([root_issue] | root_issue.descendants.visible.sort_by(&:lft)) do |child, level|
        css = "issue issue-#{child.id} hascontextmenu"
        css << " idnt idnt-#{level}" if level > 0
        need_strong = (child.id == this_issue.id) ? "font-weight:bold" : ""
        s << content_tag('tr',
               content_tag('td', check_box_tag("ids[]", child.id, false, :id => nil), :class => 'checkbox') +
               content_tag('td', link_to_issue(child, :truncate => 60, :project => (root_issue.project_id != child.project_id)), :class => 'subject', :style => need_strong) +
               content_tag('td', h(child.status)) +
               content_tag('td', link_to_user(child.assigned_to)) +
               content_tag('td', progress_bar(child.done_ratio, :width => '80px')),
               :class => css)
      end
      s << '</table></form>'
      s.html_safe
    end
  end
end

# IssuesHelper本体に、作成したIssuesHelperPatch.includeを実行させる
IssuesHelper.send(:include, IssuesHelperPatch)
