package oop20230713;

public class For3Star3 {

	public static void main(String[] args) {
		//중첩 for문 : 사각형(5x5) 별 출력
		 /* 
		 
		 [결과]
		 i(행)       j(열)0~(4-i)이하
		 --------------------------
		 0행 *****   (5회)0~4(4-0) (+1 증가)
		 1행 ****    (4회)0~3(4-1) (+1 증가)
		 2행 ***     (3회)0~2(4-2) (+1 증가)
		 3행 **      (2회)0~1(4-3) (+1 증가)
		 4행 *       (1회)0~0(4-4) (+1 증가) 
		  
		 */
		for(int i = 0; i < 5; i++) {         //외부(고정): 행(줄)
		   for(int j = 0; j < (5-i); j++) {  //내부(변화): 열(칸)
		      System.out.print("*");//25회 실행
		   }//for j end
	     System.out.println();
	     }//for i end
	}//main()end

}//class()end
