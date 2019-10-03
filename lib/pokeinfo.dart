import 'package:flutter/material.dart';
import 'package:pokedex/pokedata.dart';

class PokeInfo extends StatelessWidget {
  final Pokemon pokemon;

  PokeInfo(this.pokemon);

  Widget bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            top: MediaQuery.of(context).size.height * 0.1,
            left: 10,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 120),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: " + pokemon.height),
                  Text("Weight: " + pokemon.weight),
                  Text("Types"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((type) => FilterChip(
                              backgroundColor: Colors.amber,
                              label: Text(type),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  Text("Weakness"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((type) => FilterChip(
                              backgroundColor: Colors.redAccent,
                              label: Text(type),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  Text("Evolutions"),
                  pokemon.nextEvolution == null
                      ? FilterChip(
                          backgroundColor: Colors.grey,
                          label: Text("None"),
                          onSelected: (b) {},
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.nextEvolution
                              .map((evo) => FilterChip(
                                    backgroundColor: Colors.tealAccent,
                                    label: Text(evo.name),
                                    onSelected: (b) {},
                                  ))
                              .toList(),
                        )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
          backgroundColor: Colors.cyan,
          elevation: 0,
        ),
        backgroundColor: Colors.cyan,
        body: bodyWidget(context));
  }
}
