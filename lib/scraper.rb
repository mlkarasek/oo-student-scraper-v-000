require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students_list = []
    student_list = page.css("div.student-card")
    student_hash = {}
    name = student.css("h4.student-name").text
    url = student.css("a").first.attributes["href"].value
    location = student.css("p.student-location").text

    student_hash = {:name => name, :location =>location, :profile_url =>url}

    student_array << student_hash
  end
  students_array
end

scraped_profiles = {}
  doc.css("div.social-icon-container a").each do |profile|
    if profile.attribute("href").value.include?("twitter")
      scraped_profiles[:twitter] = profile.attribute("href").value
    elsif profile.attribute("href").value.include?("linkedin")
      scraped_profiles[:linkedin] = profile.attribute("href").value
    elsif profile.attribute("href").value.include?("github")
      scraped_profiles[:github] = profile.attribute("href").value
    else
      scraped_profiles[:blog] = profile.attribute("href").value
    end
    scraped_profiles[:profile_quote] = doc.css("div.profile-quote").text
    scraped_profiles[:bio] = doc.css("div.description-holder p").text
  end
  scraped_profiles
end
end
end 
