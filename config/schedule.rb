every 1.day, at: "5:10 pm" do
  rake "notice_book:create_notice"
end


# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end