# hooksという単純な名前にすると、なぜか別のプラグインのhooksをロードしちゃうので
# 重複しないようにフォルダ配下に置いた
require_dependency 'show_parent_at_subtask/hooks'
require_dependency 'show_parent_at_subtask/issue_helper_patch'

Redmine::Plugin.register :redmine_show_parent_at_subtask do
  name 'Show parent task at subtask'
  author 'Minoru Nagasawa'
  author_url 'https://github.com/minoru-nagasawa'
  description '子チケットの詳細表示画面に、親チケット + その子チケットを表示する'
  version '1.1.0'
  url 'https://github.com/minoru-nagasawa/redmine_show_parent_at_subtask/'
end
