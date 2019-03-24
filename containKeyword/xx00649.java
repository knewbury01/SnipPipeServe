|    @RunWith(SpringRunner.class)
    @WebMvcTest(controllers=ARestController.class)
    @Import(WebSecurityConfig.class) // <---
    public class ARestControllerTest { ... }
