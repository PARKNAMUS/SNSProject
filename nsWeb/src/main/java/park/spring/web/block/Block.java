package park.spring.web.block;

import java.util.Date;

public class Block {
	
	public String hash;//������ ������ ���ϰ� �ִ� �ؽ�
	public String previouseHash;//������ �ؽ���
	private String data;//���� ������
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
