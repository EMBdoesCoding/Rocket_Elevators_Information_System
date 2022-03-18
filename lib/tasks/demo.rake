namespace :demo do 
    desc "demo running a rake task"
    task say_hello: :environment do
        puts "hello"
    end
end