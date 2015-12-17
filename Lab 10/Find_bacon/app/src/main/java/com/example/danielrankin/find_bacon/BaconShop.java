package com.example.danielrankin.find_bacon;

/**
 * Created by danielrankin on 11/17/15.
 */
public class BaconShop {
    private String baconShop;
    private String baconShopURL;

    private void setBaconInfo(String baconTypes) {
        switch (baconTypes) {
            case "thin sliced":
                baconShop = "Village Coffee Shop";
                baconShopURL = "http://www.villagecoffeeshopboulder.com";
                break;
            case "thick cut":
                baconShop = "Foolish Craigs";
                baconShopURL = "http://www.foolishcraigs.com";
                break;
            case "farm to table":
                baconShop = "The Huckleberry";
                baconShopURL = "http://thehuckleberry.com";
                break;
            case "shitty factory bacon":
                baconShop = "McDonalds";
                baconShopURL = "http://www.mcdonalds.com";
                break;
        }
    }

    public void setBaconShop(String baconTypes) {
        setBaconInfo(baconTypes);
    }

    public void setBaconShopURL(String baconTypes) {
        setBaconInfo(baconTypes);
    }

    public String getBaconShop() {
        return baconShop;
    }

    public String getBaconShopURL() {
        return baconShopURL;
    }


}

