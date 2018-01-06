package com.hpe.encdec;

import java.util.Arrays;
import java.util.List;

public class MyClass {
	private List<String> myList;

    @Autowired
    public MyClass(@Value("${my.list.of.strings}") final String strs) {
        myList = Arrays.asList(strs.split(","));
    }
	

}
