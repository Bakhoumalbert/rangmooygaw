package multiservice.sn.rangmooygaw.modele;

public class Queue {
    private String location;
    private int currentNumber;
    private int lastIssuedNumber;

    public Queue(String location) {
        this.location = location;
        this.currentNumber = 0;
        this.lastIssuedNumber = 0;
    }

    public String getLocation() {
        return location;
    }

    public int getCurrentNumber() {
        return currentNumber;
    }

    public void incrementCurrentNumber() {
        this.currentNumber++;
    }

    public void decrementCurrentNumber() {
        if (this.currentNumber > 0) {
            this.currentNumber--;
        }
    }

    public int getLastIssuedNumber() {
        return lastIssuedNumber;
    }

    public void incrementLastIssuedNumber() {
        this.lastIssuedNumber++;
    }
}
