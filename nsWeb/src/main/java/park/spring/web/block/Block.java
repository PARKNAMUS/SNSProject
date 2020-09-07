package park.spring.web.block;

import java.util.Date;

public class Block {
	
	public String hash;//디지털 서명을 지니고 있는 해쉬
	public String previouseHash;//이전의 해쉬값
	private String data;//블럭의 데이터
	private long timeStamp;
	private int nonce;
	
	public Block(String hash, String previouseHash) {
		this.hash = hash;
		this.previouseHash = previouseHash;
		this.timeStamp = new Date().getTime();
		this.hash = calculateHash();
	}
	public String calculateHash() {
		String calculatedHash = StringUtil.applySha256(
				previouseHash + Long.toString(timeStamp) + Integer.toString(nonce) + data);
		return calculatedHash;
	}
	
	public void mineBlock(int difficulty) {
		String target = new String(new char[difficulty]).replace("\0", "0");
		while(!hash.substring(0,difficulty).equals(target)) {
			nonce ++;
			hash = calculateHash();
		}
		System.out.println("block Mined:"+hash);
	}
}
