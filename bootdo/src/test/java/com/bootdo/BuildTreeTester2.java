package com.bootdo;

import java.util.ArrayList;
import java.util.List;

import com.bootdo.common.domain.Tree;
import com.bootdo.common.utils.BuildTree;
import com.bootdo.system.domain.MenuDO;

public class BuildTreeTester2 {

	public static void main(String[] args) {

		List<Tree<MenuDO>> trees = new ArrayList<Tree<MenuDO>>();
//		List<SysMenuDO> SysMenuDOs = new ArrayList<SysMenuDO>();
//		SysMenuDO menuDO = new SysMenuDO();
	//	menuDO.setMenuId("0");
		//SysMenuDOs.add(new SysMenuDO("0", "", "关于本人"));
//		tests.add(new Test("1", "0", "技术学习"));
//		tests.add(new Test("2", "0", "兴趣"));
//		tests.add(new Test("3", "1", "JAVA"));
//		tests.add(new Test("4", "1", "oracle"));
//		tests.add(new Test("5", "1", "spring"));
//		tests.add(new Test("6", "1", "springmvc"));
//		tests.add(new Test("7", "1", "fastdfs"));
//		tests.add(new Test("8", "1", "linux"));
//		tests.add(new Test("9", "2", "骑行"));
//		tests.add(new Test("10", "2", "吃喝玩乐"));
//		tests.add(new Test("11", "2", "学习"));
//		tests.add(new Test("12", "3", "String"));
//		tests.add(new Test("13", "4", "sql"));
//		tests.add(new Test("14", "5", "ioc"));
//		tests.add(new Test("15", "5", "aop"));
//		tests.add(new Test("16", "1", "等等"));
//		tests.add(new Test("17", "2", "等等"));
//		tests.add(new Test("18", "3", "等等"));
//		tests.add(new Test("19", "4", "等等"));
//		tests.add(new Test("20", "5", "等等"));

		//for (Test test : tests) {
			Tree<MenuDO> tree = new Tree<MenuDO>();
			tree.setId("1");
			tree.setParentId("0");
			tree.setText("");
			Tree<MenuDO> tree2 = new Tree<MenuDO>();
			tree2.setId("3");
			tree2.setParentId("0");
			tree2.setText("");
			trees.add(tree2);
			trees.add(tree);
	//	}

		List<Tree<MenuDO>> t = BuildTree.buildList(trees,"0");
		System.out.println(t);
	}
}

