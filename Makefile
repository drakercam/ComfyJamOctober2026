SRC = main.c
COMPILER_FLAGS = -Wall -Werror
OUT_LINUX = main
OUT_WINDOWS = main.exe
OUT_WEB = main.html

.PHONY = linux windows web run-linux run-windows run-web clean

linux:
	gcc $(SRC) $(COMPILER_FLAGS) -o $(OUT_LINUX) -lSDL3

windows:
	x86_64-w64-mingw32-gcc $(SRC) $(COMPILER_FLAGS) -o $(OUT_WINDOWS) -lSDL3

web:
	emcc -USE_SDL=3 $(SRC) -o $(OUT_WEB)

run-linux:
	./$(OUT_LINUX)

run-windows:
	./$(OUT_WINDOWS)

run-web:
	emrun ./$(OUT_WEB)

clean:
	rm -f $(OUT_LINUX) $(OUT_WINDOWS) $(OUT_WEB)
