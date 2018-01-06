NAME = "verypossible/ethereum-dapp"

all :
	docker build -t $(NAME) .
.PHONY: all


rebuild :
	docker build --no-cache -t $(NAME) .
.PHONY: rebuild


clean :
	docker rmi $(NAME)
.PHONY: all
