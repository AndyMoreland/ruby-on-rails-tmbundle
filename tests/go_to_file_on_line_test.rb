# This isn't really a formal test.. it's just something I wrote in order to prove to myself that the regular expressions were working while I was working on them.  Just run this file with ruby go_to_file_on_line_test.rb.
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

test(regex, array, "testing first regex")

regex = /render\s*\(?@([^'"), ]+)/

input = <<-END
render @post
render @post, :object => @foo
render foo
render :action 
foo
END

array = input.scan(/(.*)\n/).flatten

test(regex, array, "testing second regex")
