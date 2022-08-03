public class App {
    //Bai toan: Phat trien1 tinh nang  phuc tap nhat the gioi
    public static void main(String[] args) throws Exception {
        BubbleSort bubbleSort = new BubbleSort();
        ThanhSort thanhSort = new ThanhSort();
     veryComplexService service = new veryComplexService(thanhSort);
     int [] numbers = new int[]{2,1,4,5,3};
     service.complexFunction(numbers);
    }
}
