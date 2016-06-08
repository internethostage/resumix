require 'open-uri'

class LinkedinScraperController < ApplicationController
  before_action :authenticate_user!
  
  def index
    begin
      linkedin_profile = current_user.auth_raw_data.info.urls.public_profile
      user_agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36"
      doc = Nokogiri::HTML(open(linkedin_profile, 'User-Agent' => user_agent), nil, "UTF-8")
    rescue OpenURI::HTTPError => e
      redirect_to snippets_path, alert: "That didn't go well"
      return
    end

    if params[:type] == "languages"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      puts "You chose to scrape languages"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      languages = doc.css('#languages ul .language .wrap').map{|l| l.text.split(' ', 2)}
      languages.each.map do |l|
        language = Language.new(name: l[0], properties: {language: l[0], level: l[1]})
        language.user = current_user
        language.save
      end
      redirect_to snippets_path, notice: "Your linkedin account languages were successfully imported!"
    elsif params[:type] == "skills"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      puts "You chose to scrape skills"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      skills = doc.css('.pills')
      skill_list = skills.children[1..-1].reject{|s| s.text =~ /See/}.map{|s| s.text}
      skill_list.each do |s|
        skill = Skill.new(name: s, properties: {skill: s})
        skill.user = current_user
        skill.save
      end
      redirect_to snippets_path, notice: "Your linkedin account skills were successfully imported!"
    elsif params[:type] == "education"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      puts "You chose to scrape education"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      # byebug
      # schools = doc.css('ul .school')
      # skill_list = skills.children[1..-1].reject{|s| s.text =~ /See/}.map{|s| s.text}
      # skill_list.each do |s|
      #   skill = Skill.new(name: s, properties: {skill: s})
      #   skill.user = current_user
      #   skill.save
      # end
      redirect_to snippets_path, alert: "There were issues importing your linkedin education details"
    elsif params[:type] == "experience"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      puts "You chose to scrape work experience"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      # byebug
      # schools = doc.css('ul .school')
      # skill_list = skills.children[1..-1].reject{|s| s.text =~ /See/}.map{|s| s.text}
      # skill_list.each do |s|
      #   skill = Skill.new(name: s, properties: {skill: s})
      #   skill.user = current_user
      #   skill.save
      # end
      redirect_to snippets_path, alert: "There were issues importing your linkedin work experiences"
    elsif params[:type] == "summary"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      puts "You chose to scrape summary"
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      summary_text = doc.css('#summary .description').text
      summary = Summary.new(name: "Linkedin", properties: {description: summary_text})
      summary.user = current_user
      summary.save
      redirect_to snippets_path, notice: "Your linkedin account summary was successfully imported!"
    end

  end

end
