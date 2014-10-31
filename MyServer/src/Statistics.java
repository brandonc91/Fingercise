import java.util.*;


public class Statistics {
	
	private Player player;
	private Game game;
	public final int SCORE_LIST_MAX = 50; // maximum count of scores per game
	
	public Statistics(Player thePlayer, Game theGame) {
		this.player = thePlayer;
		this.game = theGame;
	}
	
	public int userHighScore(Game otherGame) {
		PriorityQueue<Integer> scores = new PriorityQueue<Integer>(SCORE_LIST_MAX, Collections.reverseOrder());
		if (otherGame != null) {
			scores = otherGame.returnPlayerScores(player);
		}
		else {
			scores = game.returnPlayerScores(player);		
		}
		return scores.peek();
	}
	
	public int overallHighScore() {
		return game.findHighScore();
	}
	
	public double overallAverageScore() {
		return game.averageScore();
	}
	
	public void userAverageScoreByTimePeriod() {}
}
