import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.PriorityQueue;

public class Player {
	private String name;
	private PriorityQueue<Integer> scores;
	public final int SCORE_LIST_MAX = 50; // maximum count of scores per game
	public Player(String name) 
	{
		this.name = name;
		// Collections.reverseOrder() provides a Comparator that would sort the elements opposite
		// allows for using the peek() and poll() methods to obtain the maximum score element
		scores = new PriorityQueue<Integer>(SCORE_LIST_MAX, Collections.reverseOrder());
	}
	
	public String getName() {
		return name;
	}
	
	public void addScore(int score) {
		scores.add(score);
	}
	
	/*
	 * Used to store scores temporarily before putting into hash map in game object
	 */
	public PriorityQueue<Integer> getPlayerScoreList() {
		return scores;
	}
}
