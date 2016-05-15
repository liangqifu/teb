package cn.com.teb.common.utils;

import java.util.List;

public class DataUtils {
	public static int [] listToIntArray(List<Integer> list) {
		int [] intArray = new int [list.size()];
		int i = 0;
		for (int j : list) {
			intArray[i]=j;
			i++;
		}
		return intArray;
	}
}
