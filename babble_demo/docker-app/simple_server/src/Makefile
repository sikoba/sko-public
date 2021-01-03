SRC = 	test.cr \
		merkle_tree.cr \
		test_compress.cr

all : 
	crystal run $(SRC)

web :
	$(shell cd webpage && php -S localhost:8000)

clean :
	rm -rf *.json

fclean : clean
	rm -rf *.zip

re : fclean all

.PHONY : all clean fclean re
