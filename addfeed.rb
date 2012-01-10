puts 'Choose \'URL\', \'TAG\', or \'ALL\'.'
choice = gets.chomp.downcase

    def url 
        puts 'URL: '
        urls = gets.chomp.downcase
        file = File.open('parselist', 'a'){ |f|
            getline = []
            getline.push urls
            f.puts getline[0]
             }
    end

    def tag
        
        puts 'Which feed would you like to tag?'
        whichurl
        choosenumber

        #puts 'List your tags delineated by commas \',\''
        #tags = gets.chomp.downcase
        #file = File.open('parselist.txt', 'a'){ |f|
        # getline = []
        # getline.push tags
        # f.push getline[1]
        # }
    end

def whichurl

    idx = 1
    feedlist = File.foreach('parselist') do |wholeline|
        
         wholeline.strip!

         next if wholeline.empty?

         line = wholeline.split(",")
                                            
         feedurl = line[0].strip
         feedtags = line[1].strip

         lineWidth = 50

         puts "#{idx.to_s.ljust(lineWidth/3)} #{feedurl.center(lineWidth/3)} #{feedtags.rjust(lineWidth/3)}"
                                                                                
         idx += 1
     end
                
end

def choosenumber
    puts 'Please choose your feed. Type in the number:'
    numerator = gets.chomp
    number = numerator.to_i - 1
   
     puts 'List your tags delineated by commas \',\''
     tags = gets.strip.downcase
    

    #replace file with tagged version
    File.open('parselist', 'a+') do |f|
        eachline = f.readlines
        thisline = eachline[number]
        thisline.strip!
        thisline << ','
#        puts 'List your tags delineated by commas \',\''
#        tags = gets.strip.downcase
        thisline << tags
        puts thisline
        f.rewind
        f.truncate(0)
        f.puts eachline
    end

end

if choice == 'url'
    url
elsif choice == 'tag'
    tag
elsif choice == 'all'
    url
    tag
end
