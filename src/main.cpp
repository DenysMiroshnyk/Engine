#include "pch.h"

int main(/*int argc, char *argv[]*/)
{
  GLFWwindow *window;

  if (!glfwInit()) {
    fprintf(stderr, "Failed to initialize GLFW\n");
    exit(EXIT_FAILURE);
  }

  glfwWindowHint(GLFW_DEPTH_BITS, 16);

  window = glfwCreateWindow(300, 300, "Gears", NULL, NULL);

  if (!window) {
    fprintf(stderr, "Failed to open GLFW window\n");
    glfwTerminate();
    exit(EXIT_FAILURE);
  }

  glfwMakeContextCurrent(window);

  while (!glfwWindowShouldClose(window)) {
    // Swap buffers
    glfwSwapBuffers(window);
    glfwPollEvents();
  }

  // Terminate GLFW
  glfwTerminate();
  glfwDestroyWindow(window);

  //   Exit program
  exit(EXIT_SUCCESS);
}