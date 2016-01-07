Maid.rules do

	#
	# Desktop Files
	#
	rule 'Other Desktop Files' do
		dir('~/Desktop/*.*').each do |path|
			mkdir('~/Desktop/Desktop/' + Time.now.strftime("%Y-%m-%d"))
			move(path, '~/Desktop/Desktop/' + Time.now.strftime("%Y-%m-%d"))
		end
	end

	#
	# Update all our Applications, brew, oh my zsh and such
	#
	rule 'Updating Brew' do
		`brew update`
	end
	rule 'Updating Brews' do
		`brew upgrade --all`
	end
	rule 'Cleaning Brew' do
		`brew cleanup`
	end
	rule 'Cleaning Brew Cask' do
		`brew cask cleanup`
	end
	rule 'Updating Cask Applications' do
		`brew cask update`
	end
	rule 'Updating dotfiles submodules' do
		`cd ~/dotfiles && gitupdateall`
	end
	rule 'Updating gems ' do
		`sudo gem update`
	end

	#
	# Downloads Folder Stuff
	#
	rule 'Trash incomplete downloads' do
		trash dir('~/Downloads/*.download').select { |p| 3.days.since modified_at p }
	end

	rule 'Trash zips and tarballs downloaded from GitHub' do
		dir('~/Downloads/*.{zip,tgz,gz,rar,tar}').each do |path|
			if downloaded_from(path).any? { |u| u.match %r{//([^\/]+\.)?github\.com\/} }
				trash path
			end
		end
	end

end
