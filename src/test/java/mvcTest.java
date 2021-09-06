

//@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration
//@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:D:\\IdeaProjects\\webProject\\manageSys\\src\\main\\resources\\dispatcherServlet-servlet.xml"})
public class mvcTest {

//    @Autowired
//    WebApplicationContext webApplicationContext;
//
//    MockMvc mockMvc;
//
//    @Before
//    public void mockBuild() {
//
//        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
//    }
//
//    @Test
//    public void testPage() throws Exception {
//        //模拟请求，拿到返回值
//        MvcResult pageResult = mockMvc.perform(MockMvcRequestBuilders.get("/user")
//                .param("page", "1"))
//                .andReturn();
//
//        //请求成功后，请求域中会有pageinfo
//        MockHttpServletRequest request = pageResult.getRequest();
//        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
//        System.out.println("当前：" + pageInfo.getPageNum() + "\n"
//                + "总页：" + pageInfo.getPages() + "\n"
//                + "记录：" + pageInfo.getTotal() + "\n"
//                + pageInfo.getSize());
//        List<User> list = pageInfo.getList();
//        for (User user : list) {
//            System.out.println(user.getuPositionName().getpName());
//        }
//
//    }
}
