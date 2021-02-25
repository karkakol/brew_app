import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/home_page/home_model.dart';
import 'package:brew_crew/screens/home/settings/settings_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final HomeModel model;

  HomeScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: model.brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: _buildAppBar(context),
        body: _buildBody(context),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  void _showSettingsPanel(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: 320,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: SettingsCoordinator(),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Brew Crew'),
      backgroundColor: Colors.brown[400],
      elevation: 0.0,
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          onPressed: () async {
            model.signOut;
          },
          label: Text('logout'),
        ),
        FlatButton.icon(
          onPressed: () => _showSettingsPanel(context),
          icon: Icon(Icons.settings),
          label: Text('settings'),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/coffee_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BrewList(),
    );
  }
}
