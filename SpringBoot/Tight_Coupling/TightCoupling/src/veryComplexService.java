public class veryComplexService {
   private ISortAlgorithm sortAlgorithm ;

    public veryComplexService(ISortAlgorithm sortAlgorithm) {
        this.sortAlgorithm =sortAlgorithm;
    }

    //Ham xu ly rat phuc tap
    //Mot trong so do la viec sap xep du lieu dau vao (Tang dan)
    public void complexFunction(int[] numbers){
    sortAlgorithm.sort(numbers);
    //Xu ly cac logic phuc tap

    }
}
