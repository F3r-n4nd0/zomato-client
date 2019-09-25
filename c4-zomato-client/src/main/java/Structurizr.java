import com.structurizr.Workspace;
import com.structurizr.api.StructurizrClient;
import com.structurizr.api.StructurizrClientException;
import com.structurizr.model.*;
import com.structurizr.view.*;

public class Structurizr {

    private static final long WORKSPACE_ID = Long.parseLong(System.getenv("WORKSPACE_ID"));
    private static final String API_KEY = System.getenv("API_KEY");
    private static final String API_SECRET = System.getenv("API_SECRET");

    private static final String EXISTING_SYSTEM_TAG = "Existing System";
    private static final String WEB_BROWSER_TAG = "Web Browser";
    private static final String DATABASE_TAG = "Database";
    private static final String PIPE_TAG = "Pipe";
    private static final String MICROSERVICE_TAG = "Microservice";


    public static void main(String[] args) throws Exception {

        Workspace workspace = new Workspace("Zomato Client", "This is a model of my software system.");
        Model model = workspace.getModel();

        Person customer = model.addPerson("Customer", "A customer of the Zomato services.");

        SoftwareSystem zomatoAppClient = model.addSoftwareSystem("Zomato Client System", "Allows to use the zomato api.");
        customer.uses(zomatoAppClient, "Search for restaurants.");

        SoftwareSystem zomatoAPI = model.addSoftwareSystem("Zomato API", "API to search for restaurants.");
        zomatoAPI.addTags(EXISTING_SYSTEM_TAG);
        zomatoAppClient.uses(zomatoAPI, "Search for restaurants");

        ViewSet views = workspace.getViews();

        SystemContextView systemContextView = views.createSystemContextView(zomatoAppClient, "SystemContext", "The system context diagram for the System.");
        systemContextView.setEnterpriseBoundaryVisible(false);
        systemContextView.addNearestNeighbours(zomatoAppClient);
        systemContextView.setPaperSize(PaperSize.A5_Landscape);

        Container iosApp = zomatoAppClient.addContainer("IOS APP", "Provides functionality to customers via their mobile application to use the zomato services.", "Swift");
        iosApp.addTags(WEB_BROWSER_TAG);
        customer.uses(iosApp, "Uses", "Search");
        iosApp.uses(zomatoAPI, "Uses", "JSON/HTTPS");

        ContainerView containerView = views.createContainerView(zomatoAppClient, "Containers", "The container diagram for the restaurant.");
        containerView.add(customer);
        containerView.addAllContainers();
        containerView.add(zomatoAPI);
        containerView.setPaperSize(PaperSize.A3_Landscape);

        Component listCategories = iosApp.addComponent("List categories", "Get a list of categories.", "Swift");
        customer.uses(listCategories, "Get all categories");
        listCategories.uses(zomatoAPI, "Uses", "JSON/HTTPS");

        Component findCities = iosApp.addComponent("Find cities", "Lind the Zomato ID and other details for a city.", "Swift");
        customer.uses(findCities, "Get all cities by name");
        findCities.uses(zomatoAPI, "Uses", "JSON/HTTPS");

        Component listCuisinesByLocation = iosApp.addComponent("List cuisines by location", "List of popular cuisines and nearby restaurants around the given coordinates", "Swift");
        customer.uses(listCuisinesByLocation, "Get  cuisines y location");
        listCuisinesByLocation.uses(zomatoAPI, "Uses", "JSON/HTTPS");

        ComponentView componentView = views.createComponentView(iosApp, "Components - IOS App", "The component diagram for the IOS App.");
        componentView.add(zomatoAppClient);
        componentView.addAllComponents();
        componentView.add(listCategories);
        componentView.add(findCities);
        componentView.add(listCuisinesByLocation);
        componentView.add(zomatoAPI);
        componentView.add(customer);
        componentView.setPaperSize(PaperSize.A4_Landscape);

        setStyle(views);
        setWorkspaceToStructurizr(workspace);

    }

    private static void setStyle(ViewSet views) {
        Styles styles = views.getConfiguration().getStyles();
        styles.addElementStyle(Tags.ELEMENT).color("#ffffff");
        styles.addElementStyle(Tags.SOFTWARE_SYSTEM).background("#1168bd");
        styles.addElementStyle(Tags.CONTAINER).background("#438dd5");
        styles.addElementStyle(Tags.COMPONENT).background("#85bbf0").color("#000000");
        styles.addElementStyle(Tags.PERSON).background("#08427b").shape(Shape.Person).fontSize(22);
        styles.addElementStyle(EXISTING_SYSTEM_TAG).background("#999999");
        styles.addElementStyle(WEB_BROWSER_TAG).shape(Shape.WebBrowser);
        styles.addElementStyle(DATABASE_TAG).shape(Shape.Cylinder);
        styles.addElementStyle(PIPE_TAG).shape(Shape.Pipe);
        styles.addElementStyle(MICROSERVICE_TAG).shape(Shape.Hexagon);

    }

    private static void setWorkspaceToStructurizr(Workspace workspace) throws StructurizrClientException {
        StructurizrClient structurizrClient = new StructurizrClient(API_KEY, API_SECRET);
        structurizrClient.putWorkspace(WORKSPACE_ID, workspace);
    }

}