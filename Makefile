clean:
	hexo clean

generate:
	hexo generate

deploy: clean generate
	hexo deploy
