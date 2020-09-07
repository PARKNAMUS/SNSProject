package park.spring.web.block;

import java.util.ArrayList;

import com.google.gson.GsonBuilder;

public class BlockTest {
	
	public static ArrayList<Block> blockchain = new ArrayList<Block>();
	public static int difficulty = 5;
	
	public static Boolean isChainValid() {
		Block currentBlock;
		Block previousBlock;
		String hashTarget = new String(new char[difficulty]).replace("\0", "0");
		
		for(int i=0;i<blockchain.size(); i++) {
			currentBlock = blockchain.get(i);
			if(i<0) {
				previousBlock = blockchain.get(i-1);
			}else {
				previousBlock = new Block("0","0");
			}
			if(!currentBlock.hash.equals(currentBlock.calculateHash())) {
				System.out.println("current hash not equal");
				return false;
			}
			if(!previousBlock.hash.equals(currentBlock.previouseHash)) {
				System.out.println("previous hashes not equal");
				return false;
			}
			if(!currentBlock.hash.substring(0,difficulty).equals(hashTarget)) {
				System.out.println("This block hasn't been mined");
				return false;
			}
		}
		return true;
	}
	
	public static void main(String[] args) {
		Block firstBlock = new Block("hi im first","0");
		
		blockchain.add(firstBlock);
		System.out.println("trying to mine block1 ...");
		blockchain.get(0).mineBlock(difficulty);
		blockchain.add(new Block("yo im the second", blockchain.get(blockchain.size()-1).hash));
		System.out.println("trying to mine block2 ...");
		blockchain.get(1).mineBlock(difficulty);
		blockchain.add(new Block("yo im the third", blockchain.get(blockchain.size()-1).hash));
		System.out.println("trying to mine block3");
		blockchain.get(2).mineBlock(difficulty);
		
		System.out.println("\nblockchain is valid:"+isChainValid());
		String blockJson = new GsonBuilder().setPrettyPrinting().create().toJson(blockchain);
		System.out.println(blockJson);

	}
}
