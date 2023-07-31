package oop20230706;

public class VariableEx4 {

	public static void main(String[] args) {
		short a = 32767;
		System.out.println(a+1);//변수 a에는 여전히 +32767이 저장되어있다.
		
		int b = 2147483647;
		System.out.println(b+1);
		
		long c = 2147483647;
		System.out.println(c+1);
		
		byte d = 127;
		System.out.print(d+1);
		System.out.println();
		System.out.println(10); // 10진 정수 (결과)10
		System.out.println(010);// 8진 정수 (결과)8
		System.out.println(0x10);// 16진 정수 (결과)16
		System.out.println(0b10);//2진 정수 (결과)2
				
	}

}





/* 10진수 : 0,1,2,3,4,5,6,7,8,9
 * 16진수 : 0,1,2,3,4,5,6,7,8,9,A(10인지 1,0인지 구분불가여서 알파벳으로표현),B,C,D,E,F
 * 8진수  : 0,1,2,3,4,5,6,7
 * 2진수  : 0,1
 * 
 * ==== 2진 정수의 내부표현 방법(fixed point 고정 소수점 표현방법) ====
 *      비트내에서 부호는 맨앞 한자리 1bit쓴다
 *      (부호:+(0),-(1)) int(4byte=32bit)
 *                     byte(1byte=8bit)
 *      1+7                           +14                   -14                              (n bit)표현범위
 * ---------------------------------------------------------------------------------------------------------    
 * 1)부호와 절대치                       00001110                10001110     
 * 2)부호와 1의 보수(compliment)                                 11110001  0->1, 1->0
 * 3)부호와 2의 보수                                             11110010 
 * 
 * ====[2진법] Nbit 자리수 일 경우의 수의 표현 범위
 * 1bit경우 : []  1자리 [0]또는[1]-> 2가지 표현가능하다.
 * 2bit경우 : [][] 2자리 00,01,10,11 -> 4가지 표현가능하다.
 * 3bit경우 : [][][]3자리 000, 001, 010, 011, 100, 101, 110, 111 -> 8가지 표현 가능하다.
 * Nbit경우 : ----N자리 ------------------------------------------> 2의n승 가지 표현 가능하다.
 * 
 * =====2진수 자리수의 가중치
 * 위치     10    9    8    7    6    5   4    3  2  1 0
 * 가중치    1024  512  256  128  64   32  16   8  4  2 1.
 * 
 * ==== 2진 실수의 내부표현 방법(부동floating소수점 표현방법) ====
 * 
 * 
 * 
 */
