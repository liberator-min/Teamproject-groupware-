package com.team.component;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

@Component	// 불특정 용도의 스프링 빈 클래스
public class HashComponent {

	// 문자열 input을 전달받아서, sha-512 해시 알고리즘을 적용하여 만들어진 해시값을 반환하는 함수
	// hash : 입출력 데이터간의 고유성을 보장하는 난독화 알고리즘 (원본을 유추할 수 없으나 고유성은 보장된다)
	public String getHash(String input) {
		MessageDigest md;
		String hash = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
			md.update(input.getBytes());
			hash = String.format("%0128x", new BigInteger(1, md.digest()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return hash;
	}
}
