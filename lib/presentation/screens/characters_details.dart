import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../business_logic/cubit/characters_cubit.dart';
import '../../constants/colors.dart';
import '../../data/models/characters.dart' as models;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final models.Characters character;

  const CharactersDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name ?? 'No Name',
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.id ?? UniqueKey(),
          child: Image.network(character.image ?? '', fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: MyColors.myWhite, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      color: MyColors.myYellow,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget checkIfLocationLoaded(CharactersState state) {
    if (state is LocationsLoaded) {
      return displayRandomLocationOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomLocationOrEmptySpace(State) {
    var locations = (State).locations;
    if (locations.length != 0) {
      var randomLocation = Random().nextInt(locations.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ScrambleAnimatedText(
                'Location: ${locations[randomLocation].name}',
                speed: Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return Center(child: CircularProgressIndicator(color: MyColors.myYellow));
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getAlllocations();
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('species : ', character.species ?? ''),
                    buildDivider(305),
                    characterInfo('gender : ', character.gender ?? ''),
                    buildDivider(305),
                    characterInfo('episodes : ', character.episode!.join('/')),
                    buildDivider(290),
                    characterInfo('status : ', character.status ?? ''),
                    buildDivider(310),
                    character.type!.isEmpty
                        ? Container()
                        : characterInfo('type : ', character.type ?? ''),
                    character.type!.isEmpty ? Container() : buildDivider(325),
                    SizedBox(height: 20),
                    BlocBuilder<CharactersCubit, CharactersState>(
                      builder: (context, state) {
                        return checkIfLocationLoaded(state);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }
}
