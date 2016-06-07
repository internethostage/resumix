require 'open-uri'

class LinkedinScraperController < ApplicationController

  def index
    if params
      # byebug
      linkedin_profile = current_user.auth_raw_data.info.urls.public_profile
      doc = Nokogiri::HTML(open(linkedin_profile))
      skills = doc.css('.pills')
      skill_list = skills.children[1..-1].reject{|s| s.text =~ /See/}.map{|s| s.text}
      skill_list.each do |s|
        skill = Skill.new(name: s, properties: {skill: s})
        skill.user = current_user
        skill.save
      end
    redirect_to snippets_path, notice: "Your linkedin account was successfully scraped."
  end

end
