pkg update
pkg upgrade
pkg install -y termux-api \
	git \
	perl \
	python \
	vim \
	openssh \
	sqlite \
	curl \
	jq \
	tmux
git config --global user.email "stephan.van.ellewee@gmail.com"
git config --global user.username "svanellewee"
