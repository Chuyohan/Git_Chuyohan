class User < ActiveRecord::Base
	has_many :posts

	validates :username, :presence => { :message => "아이디를 반드시 입력하셔야 합니다."}
	validates :username, :presence => { :message => "이미 존재하는 아이디 입니다.", :case_sensitive => false}
	validates :password, :length => { :minimum => 6, :too_short => "최소 6자 이상으로 만들어주세요."}
end
