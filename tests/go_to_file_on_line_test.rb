# This isn't really a formal test.. it's just something I wrote in order to prove to myself that the regular expressions were working while I was working on them.  Just run this file with ruby go_to_file_on_line_test.rb.
def test(regex, input, message)
  puts "!!!!!!#{message}!!!!!!!"
  input.each do |i|
    if  i.match(regex)
      puts "Works: #{i}" 
      puts "$1: #{$1}"
      puts "-------"
    end
  end
end

input = <<-END
render :partial => @post
render :partial => foo
render :partial => @post, foo
render :partial => @post, :foo
render :partial => 'foo'
render :partial => '/web_resources/web_resource', :collection => @category.web_resources
render :partial => '/web_resources/web_resource',
foo
END

array = input.scan(/(.*)\n/).flatten
regex = /render[\s\(].*:partial\s*=>\s*['"@]([\w\d\/]+)['",]{0,2}/
test(regex, array, "testing first regex")

input = <<-END
render @post
render @post, :object => @foo
render foo
render :action 
foo
END

array = input.scan(/(.*)\n/).flatten
regex = /render\s*\(?@([^'"), ]+)/
test(regex, array, "testing second regex")
