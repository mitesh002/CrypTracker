import 'package:crypto/controllers/coin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CoinController coinController = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CrypTracker",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Expanded(
              child: Obx(
                () => coinController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : coinController.coinList.isEmpty
                        ? const Center(
                            child: Text(
                              "No data available",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: coinController.coinList.length,
                            itemBuilder: (context, index) {
                              final coin = coinController.coinList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 4,
                                                  )
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                  coin.image,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Icon(Icons.error,
                                                          color: Colors.red),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  coin.name,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "${coin.priceChangePercentage24H.toStringAsFixed(2)} %",
                                                  style: TextStyle(
                                                      color:
                                                          coin.priceChangePercentage24H >=
                                                                  0
                                                              ? Colors.green
                                                              : Colors.red,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "\$ ${coin.currentPrice}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            coin.symbol.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
