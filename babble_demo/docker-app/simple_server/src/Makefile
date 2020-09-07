SRC = 	test.cr \
		merkle_tree.cr \
		test_compress.cr

all : 
	crystal run $(SRC)

clean :
	rm -rf *.json

fclean : clean
	rm -rf *.zip

re : fclean all

.PHONY : all clean fclean re