public class Girl {
   // TShirt outfit = new TShirt();
    private String name;

    
      public Girl(String name, IOutfit outfit) {
        this.name = name;
        this.outfit  = outfit;
    }
    private IOutfit outfit;
    public void showOutfit(){
        System.out.println("She is "+this.name);
       outfit.swear();
    }

  
 
}
