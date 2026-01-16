import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../data/models/characters.dart' as models;
import 'package:flutter/material.dart';

class CharactersItem extends StatelessWidget {
  final models.Characters character;
  const CharactersItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          charactersDetailsScreen,
          arguments: character,
        ),
        child: Hero(
          tag: character.id ?? UniqueKey(),
          child: GridTile(
            footer: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.name}',
                style: TextStyle(
                  height: 1.3,
                  color: MyColors.myWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            child: Container(
              color: MyColors.myGrey,
              child: character.image != null && character.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/Loading Dots In Yellow.gif',
                      image: character.image!,
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset('assets/images/placeholder.png'),
            ),
          ),
        ),
      ),
    );
  }
}
