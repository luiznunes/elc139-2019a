FLAGS=-std=c++11 -openmp

RM=rm -f

EXEC=sum

all: $(EXEC)

$(EXEC):
		$(CXX) $(FLAGS) $(EXEC).cpp -o $(EXEC).o

clean:
		$(RM) $(EXEC).o *.out *.err

run: $(EXEC)
	./$(EXEC).o
