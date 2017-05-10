package first.common.util;

import java.util.StringTokenizer;

//bean 생성이아닌 View단에서 El custom tag로 사용할 것이라서 static으로 지정함
public class ContentForm {
	public static String getContent(String comment) {
		return br(" ", "<br>", comment);
	}

	public static String br(String first, String brTag, String comment) {
		StringBuffer buffer = new StringBuffer();
		StringTokenizer st = new StringTokenizer(comment, "\n");
		int count = st.countTokens();
		buffer.append(first);
		int i = 1;
		while (st.hasMoreTokens()) {
			if (i == count) {
				buffer.append(st.nextToken());
			} else {
				buffer.append(st.nextToken() + brTag);
			}
			i++;
		}
		return buffer.toString();
	}
}
