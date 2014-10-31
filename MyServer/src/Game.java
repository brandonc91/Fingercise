import java.util.*;


/*
 * Game class creates a data structure for storing information about a 
 * mini-game and its attributes like the game name, scores and max score
 */
public class Game {
	private String gameName;
	private HashMap<Player, PriorityQueue<Integer> > scoreList;
	private PriorityQueue<Integer> allScores;
	public int maxScore;
	public final int SCORE_LIST_MAX = 50; // maximum count of scores per game
	
	/*
	 * Creates a Game object with a name, empty score list and max score of 0
	 * @param gameName the game title
	 */
	public Game(String gameName) {
		this.gameName = gameName;
		scoreList = new HashMap<Player, PriorityQueue<Integer>>();
		allScores = new PriorityQueue<Integer>(SCORE_LIST_MAX, Collections.reverseOrder()); // implement priority queue to return max element
		maxScore = 0;
	}
	
	/*
	 * Adds an individual's score to the game score list
	 * @param one The Player who has achieved the score
	 * @param e the Score the player has achieved
	 */
	public void updatePlayerScoreList(Player player, int score) {
		allScores.add(score);									// add score to total list of scores
		maxScore = allScores.peek();							// find current maximum score for this game
		player.addScore(score);									// add score to player's score list for this game
		scoreList.put(player, player.getPlayerScoreList());		// put update player score list in map
	}
	
	public PriorityQueue<Integer> returnPlayerScores(Player player) {
		return scoreList.get(player);
	}
	
	
	public int findHighScore() {
		return maxScore;
	}
	
	public double averageScore() {
		double average = 0.0;
		for (int score : allScores) {
			average += score;
		}
		average /= allScores.size();
		return average;
	}
	
	/*
	 * getName()
	 * @return the name of the Game object
	 */
	public String getName() {
		return gameName;
	}
	
	
	public static void main(String[] args) {
		Game test = new Game("Test Game");
		Player brandon = new Player("Brandon");
		System.out.println("Scores:");
		int min = 25;
		int max = 1000;
		for (int i = 0; i < 10; i++) {
			int randomScore = min + (int) (Math.random() * max);
			test.updatePlayerScoreList(brandon, randomScore);
		}
		PriorityQueue<Integer> brandonScores = brandon.getPlayerScoreList();
		for (int score : brandonScores) {
			System.out.println(score);
		}
		System.out.println("Max: " + test.findHighScore());
		System.out.println("Average: " + test.averageScore());
	}
}
