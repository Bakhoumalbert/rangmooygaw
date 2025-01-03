package multiservice.sn.rangmooygaw.modele;

public class Ticket {
    private int ticketId;
    private int serviceId;
    private String localisation;
    private int positionInQueue;
    private int peopleAhead;
    private int currentNumberBeingServed;

    // Getters et setters
    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    public int getPositionInQueue() {
        return positionInQueue;
    }

    public void setPositionInQueue(int positionInQueue) {
        this.positionInQueue = positionInQueue;
    }

    public int getPeopleAhead() {
        return peopleAhead;
    }

    public void setPeopleAhead(int peopleAhead) {
        this.peopleAhead = peopleAhead;
    }

    public int getCurrentNumberBeingServed() {
        return currentNumberBeingServed;
    }

    public void setCurrentNumberBeingServed(int currentNumberBeingServed) {
        this.currentNumberBeingServed = currentNumberBeingServed;
    }
}
