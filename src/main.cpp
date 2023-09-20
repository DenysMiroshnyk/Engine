int main()
{
    glfwInit();

    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    int const width = 800;
    int const height = 600;
    GLFWwindow *window = glfwCreateWindow(width, height, "Vulkan window", nullptr, nullptr);

    while (glfwWindowShouldClose(window) == 0) {
        glfwPollEvents();
    }

    glfwDestroyWindow(window);

    glfwTerminate();

    return 0;
}