import java.util.*;
public class Game {
	private String gameName;
	private HashMap<Player, Integer> scores;
	public int maxScore;
	public Game(String gameName) {
		this.gameName = gameName;
		scores = new HashMap<Player, Integer>();
		maxScore = 0;
	}
	
	public int addScore(Player one, int e) {
		scores.put(one, e);
		
		for (int i = 1; i < scores.size(); i++) {
			if (scores.get(i) > scores.get(i - 1)) {
				maxScore = scores.get(i);
			}
		}
		return maxScore;
	}
}
