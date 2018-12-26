import 'dart:async';
import 'dart:convert';

import 'package:LoginUI/Routes.dart';
import 'package:LoginUI/main.dart';
import 'package:LoginUI/model/ReposModel.dart';
import 'package:LoginUI/network/Github.dart';
import 'package:flutter/material.dart';
import 'package:http/src/response.dart';

class RepoListProvider {
  static List<ReposModel> starredRepos;
  static List<ReposModel> myRepos;
  static List<ReposModel> userRepos;

  static List<Widget> reposList(List<dynamic> repos, String title) {
    return [
      new Container(
          child: new Text(title,
              style: new TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
              textAlign: TextAlign.start),
          padding: EdgeInsets.only(left: 15, top: 15),
          alignment: Alignment.centerLeft),
      getReposList(repos, true)
    ];
  }

  static StreamSubscription getMyRepos(
      int page, int max, String accessToken, Function func) {
    var stream = Github.getAllMyRepos(accessToken, max, page).asStream();
    return stream.listen((response) {
      var repos = json.decode(response.body) as List;
      var reposList = List<ReposModel>();
      repos.forEach((json) {
        reposList.add(ReposModel.fromJson(json));
      });
      func(reposList);
      myRepos = reposList;
    });
  }

  static StreamSubscription<Response> getUserRepos(int page,int max,
      String accessToken, String login, Function func) {
    var stream = Github.getUserRepos(page,max,accessToken, login).asStream();
    return stream.listen((response) {
      var repos = json.decode(response.body) as List;
      var reposList = List<ReposModel>();
      repos.forEach((json) {
        reposList.add(ReposModel.fromJson(json));
      });
      func(reposList);
      userRepos = reposList;
    });
  }

  static StreamSubscription<Response> getStarredRepos(
      int max, String username, Function func) {
    var stream = Github.getUserStarredRepos(username, max, 1).asStream();
    return stream.listen((response) {
      var repos = json.decode(response.body) as List;
      var reposList = List<ReposModel>();
      repos.forEach((json) {
        reposList.add(ReposModel.fromJson(json));
      });
      starredRepos = reposList;
      func(reposList);
    });
  }

  static ReposModel getRepoDetails(String repoId) {
    try {
      return myRepos.where((repo) {
        return repo.id.toString().compareTo(repoId) == 0;
      }).first;
    } catch (ex) {}

    try {
      return starredRepos.where((repo) {
        return repo.id.toString().compareTo(repoId) == 0;
      }).first;
    } catch (ex) {}

    try {
      return userRepos.where((repo) {
        return repo.id.toString().compareTo(repoId) == 0;
      }).first;
    } catch (ex) {}
  }

  static getReposList(
      @required List<ReposModel> repos, @required bool notScrollable,
      [ScrollController scrollController]) {
    return new ListView.builder(
        controller: scrollController,
        padding: new EdgeInsets.all(8.0),
        itemCount: repos == null ? 0 : repos.length,
        shrinkWrap: true,
        physics: notScrollable
            ? ClampingScrollPhysics()
            : AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
              onTap: () {
                Application.router.navigateTo(
                    context,
                    Routes.repoDetails.replaceFirst(
                        ":id", repos.elementAt(index).id.toString()));
              },
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new Image.network(
                        '${repos.elementAt(index).owner.avatarUrl}',
                        width: 40.0,
                        height: 40.0),
                    padding: EdgeInsets.all(10),
                  ),
                  getDetailView(repos.elementAt(index))
                ],
              ));
        });
  }

  static getDetailView(ReposModel repo) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            '${repo.name}',
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 16.0,
                color: Colors.black),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          new Text('Repo Type: ${(repo.private) ? "Private" : "Public"}',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14.0,
                  color: Colors.black87),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis)
        ]);
  }
}
