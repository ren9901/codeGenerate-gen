
package gen.plusboot;

import codeGenerate.mybatis.utils.GenUtils;

public class PlusBootGen {
private String useName;
	public static void main(String[] args) throws Exception {

		GenUtils.genCode(PlusBootGen.class.getResourceAsStream("jdbc.xml"));
	}

}
