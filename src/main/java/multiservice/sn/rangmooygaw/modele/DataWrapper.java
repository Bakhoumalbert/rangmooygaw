package multiservice.sn.rangmooygaw.modele;

import java.util.List;

public class DataWrapper {
    private List<Service> services;
    private List<Localisation> localisations;
    private List<Ticket> tickets;

    // Getters et setters
    public List<Service> getServices() {
        return services;
    }

    public void setServices(List<Service> services) {
        this.services = services;
    }

    public List<Localisation> getLocalisations() {
        return localisations;
    }

    public void setLocalisations(List<Localisation> localisations) {
        this.localisations = localisations;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }
}
