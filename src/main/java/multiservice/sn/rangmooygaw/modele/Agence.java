package multiservice.sn.rangmooygaw.modele;

public class Agence {
    private String name;
    private String localisation;

    // Constructeur
    public Agence(String name, String localisation) {
        this.name = name;
        this.localisation = localisation;
    }

    // Getters et Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    @Override
    public String toString() {
        return "Agence{name='" + name + "', localisation='" + localisation + "'}";
    }
}
