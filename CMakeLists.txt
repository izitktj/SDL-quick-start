cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)
project(GraphicsEngine VERSION 0.1.0)

#[[

Uncomment this to use WinMain
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mwindows")

Warning:
By using this linker flag you lose the hability to use console to print logs

]]

if(MINGW)
    add_definitions(-DWIN32_LEAN_AND_MEAN)
endif()

add_executable(GraphicsEngine
	src/main.cpp
)

target_include_directories(GraphicsEngine PRIVATE
	include/
)

target_link_directories(GraphicsEngine PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}/lib/x64
)

target_link_libraries(GraphicsEngine PRIVATE SDL2)

add_custom_command(TARGET GraphicsEngine POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_CURRENT_SOURCE_DIR}/lib/x64/SDL2.dll $<TARGET_FILE_DIR:GraphicsEngine>)