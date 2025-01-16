import 'package:airdrop_flutter/controllers/ecosystem_controller.dart';
import 'package:airdrop_flutter/storage/user_storage.dart';
import 'package:airdrop_flutter/utils/fromNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EarnEcosystem extends StatefulWidget {
  EarnEcosystem({Key? key}) : super(key: key);

  @override
  State<EarnEcosystem> createState() => _EarnEcosystemState();
}

class _EarnEcosystemState extends State<EarnEcosystem> {
  final EcosystemController controller = Get.put(EcosystemController());
  final storage = Get.find<StorageService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ecosystem',
            style: TextStyle(
                color: Color(0XFFFFFFFF),
                fontSize: 24.sp,
                fontWeight: FontWeight.w700),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16.w),
            child: Text(
              'Those Ecosystems that Cooperate with AirDrop Coins',
              style: TextStyle(
                  color: Color(0XFFFFFFFF).withOpacity(0.65),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Obx(() {
            if (storage.assetsList.value?.isNotEmpty ?? false) {
              var items = storage.assetsList.value;
              return Column(
                children: items.map((item) {
                  int index = items.indexOf(item);
                  return Container(
                    width: 343.w,
                    // height: 202.w,
                    margin: EdgeInsets.only(bottom: 8.w),
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, top: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Color(0XFFFFFFFF).withOpacity(0.15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              // width: 92.w,
                              // height: 22.w,
                              margin: EdgeInsets.only(right: 5.w),
                              padding: EdgeInsets.only(
                                  left: 12.w,
                                  right: 12.w,
                                  top: 6.w,
                                  bottom: 6.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21.r),
                                  color: Color(0XFF000000).withOpacity(0.5)),
                              child: Text(
                                'Collaborative Ecosystem',
                                style: TextStyle(
                                    color: Color(0XFFE5B045),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5.w),
                              padding: EdgeInsets.only(
                                  left: 12.w,
                                  right: 12.w,
                                  top: 6.w,
                                  bottom: 6.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21.r),
                                  color: Color(0XFF000000).withOpacity(0.5)),
                              child: Text(
                                'Pool Donations',
                                style: TextStyle(
                                    color: Color(0XFFE5B045),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.w, bottom: 8.w),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 8.w),
                                child: Image.network(
                                  '${item['icon']}',
                                  width: 32.w,
                                  height: 32.w,
                                ),
                              ),
                              Text(
                                '${item['name']}',
                                style: TextStyle(
                                    color: Color(0XFFFFFFFF),
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${_getTextForItem(item['name'])}',
                          style: TextStyle(
                              color: Color(0XFFFFFFFF),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.w, bottom: 20.w),
                          child: Text(
                            'Prize pool contribution: ${formatNumber(item['maxSupply'], decimalPlaces: 0)} \$${item['name']}',
                            style: TextStyle(
                                color: Color(0XFFFC7700),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              );
            } else {
              return Container(
                child: Text('NULL Data'),
              );
            }
          })
        ],
      ),
    );
  }
}

String _getTextForItem(String name) {
  switch (name) {
    case 'ADT':
      return 'Global Coin Change is an innovative interactive platform where users can earn airdrop boxes by completing tasks, playing games, and inviting friends, with a chance to unlock a variety of meme coins, mainstream cryptocurrencies, airdrop tokens ADT, and NFTs upon opening the boxes.';
    case 'GCC':
      return 'An important token in the GCC ecosystem, it can be used in the ADT section and withdrawn for on-chain transactions.';
    case 'BNB':
      return 'BNB Chain is a leading blockchain ecosystem designed to support the growing demands of the decentralized web (Web3). Offering a unique combination of speed, scalability, and affordability, BNB Chain has become a popular choice for developers building decentralized applications (DApps) and for users seeking to participate in the world of decentralized finance (DeFi).';
    case 'TON':
      return 'The Open Network (TON) is a decentralized and open internet platform made up of several components. These include: TON Blockchain, TON DNS, TON Storage, and TON Sites. TON Blockchain is the core protocol that connects TON’s underlying infrastructure together to form the greater TON Ecosystem.';
    case 'DOGE':
      return 'Dogecoin is a cryptocurrency based on the Scrypt algorithm, known for its unique cultural background and community support.';
    case 'SHIB':
      return 'SHIB is a virtual currency, known for its massive circulation and community-driven characteristics, aiming to become the \"Dogecoin Killer\".';
    case 'PEPE':
      return 'PEPE is a MemeCoin issued on Ethereum, paying homage to the Pepe the Frog internet meme created by Matt Furie.';
    case 'BONK':
      return 'BONK is a dog-themed cryptocurrency built on the Solana blockchain, designed to support the Solana community and integrate multiple sectors.';
    case 'KOMA':
      return 'Koma Inu is the son of Shiba Inu and the guardian of BNB; it is a dog-themed token based on community-driven decentralization and charity initiatives. Its arrival is intended to make BNB great again.';
    case 'ai16z':
      return 'ai16z is a venture capital firm that supports bold artificial intelligence agents in building the future through autonomous technology.';
    case 'PENGU':
      return 'PENGU, as the official token of Pudgy Penguins, symbolizes the evolution of NFT projects from collectibles to practical tokenization.';
    case 'BOME':
      return 'BOOK OF MEME is the first MEME token on the Solana blockchain';
    case 'PNUT':
      return 'PEANUT lives on. #JusticePeanut. Squirrel Peanut is a meme token on SOlana';
    case 'ACT':
      return 'Act I is one of the few projects exploring how to go beyond the cold one-to-one user/assistant model and interact with artificial intelligence in the form of an egalitarian network.';
    case 'GOUT':
      return 'GOUT Coin represents more than just a meme token—it symbolizes victory from struggle. Built with the spirit of overcoming, \$GOUT unites those daring to dream, creating a decentralized community for winners.';
    default:
      return 'This is a blockchain network with a variety of use cases.';
  }
}
