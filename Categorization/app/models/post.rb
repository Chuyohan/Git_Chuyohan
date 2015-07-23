class Post < ActiveRecord::Base
	belongs_to :user
	
	validates :category, :inclusion => {:in => ["연극","문화","체육","학술","봉사","종교"], :message => "카테고리를 선택해주세요."}
	validates :title, :presence => {:message => "동아리명을 입력하세요."}
end