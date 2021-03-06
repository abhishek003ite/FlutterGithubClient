class UserProfile {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;
  String name;
  String company;
  String blog;
  String location;
  String email;
  bool hireable;
  String bio;
  int publicRepos;
  int publicGists;
  int followers;
  int following;
  String createdAt;
  String updatedAt;
  int privateGists;
  int totalPrivateRepos;
  int ownedPrivateRepos;
  int diskUsage;
  int collaborators;
  bool twoFactorAuthentication;
  Plan plan;

  UserProfile(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt,
      this.privateGists,
      this.totalPrivateRepos,
      this.ownedPrivateRepos,
      this.diskUsage,
      this.collaborators,
      this.twoFactorAuthentication,
      this.plan});

  UserProfile.fromJson(Map<String, dynamic> json) {
    login = json['login']?? "";
    id = json['id']?? "";
    nodeId = json['node_id']?? "";
    avatarUrl = json['avatar_url']?? "";
    gravatarId = json['gravatar_id']?? "";
    url = json['url']?? "";
    htmlUrl = json['html_url']?? "";
    followersUrl = json['followers_url']?? "";
    followingUrl = json['following_url']?? "";
    gistsUrl = json['gists_url']?? "";
    starredUrl = json['starred_url']?? "";
    subscriptionsUrl = json['subscriptions_url']?? "";
    organizationsUrl = json['organizations_url']?? "";
    reposUrl = json['repos_url']?? "";
    eventsUrl = json['events_url']?? "";
    receivedEventsUrl = json['received_events_url']?? "";
    type = json['type']?? "";
    siteAdmin = json['site_admin']?? "";
    name = json['name']?? "";
    company = json['company']?? "";
    blog = json['blog']?? "";
    location = json['location']?? "";
    email = json['email']?? "";
    hireable = json['hireable']?? false;
    bio = json['bio']?? "";
    publicRepos = json['public_repos']?? 0;
    publicGists = json['public_gists']?? 0;
    followers = json['followers']?? 0;
    following = json['following']?? 0;
    createdAt = json['created_at']?? "";
    updatedAt = json['updated_at']?? "";
    privateGists = json['private_gists']?? 0;
    totalPrivateRepos = json['total_private_repos']?? 0;
    ownedPrivateRepos = json['owned_private_repos']?? 0;
    diskUsage = json['disk_usage']?? 0;
    collaborators = json['collaborators']?? 0;
    twoFactorAuthentication = json['two_factor_authentication']?? false;
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['site_admin'] = this.siteAdmin;
    data['name'] = this.name;
    data['company'] = this.company;
    data['blog'] = this.blog;
    data['location'] = this.location;
    data['email'] = this.email;
    data['hireable'] = this.hireable;
    data['bio'] = this.bio;
    data['public_repos'] = this.publicRepos;
    data['public_gists'] = this.publicGists;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['private_gists'] = this.privateGists;
    data['total_private_repos'] = this.totalPrivateRepos;
    data['owned_private_repos'] = this.ownedPrivateRepos;
    data['disk_usage'] = this.diskUsage;
    data['collaborators'] = this.collaborators;
    data['two_factor_authentication'] = this.twoFactorAuthentication;
    if (this.plan != null) {
      data['plan'] = this.plan.toJson();
    }
    return data;
  }

  getName() {
    if(name.isEmpty){
      return login;
    }else{
      return name;
    }
  }
}

class Plan {
  String name;
  int space;
  int collaborators;
  int privateRepos;

  Plan({this.name, this.space, this.collaborators, this.privateRepos});

  Plan.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    space = json['space'];
    collaborators = json['collaborators'];
    privateRepos = json['private_repos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['space'] = this.space;
    data['collaborators'] = this.collaborators;
    data['private_repos'] = this.privateRepos;
    return data;
  }
}


/* 
{
    "login": "barykaed",
    "id": 1313194,
    "node_id": "MDQ6VXNlcjEzMTMxOTQ=",
    "avatar_url": "https://avatars0.githubusercontent.com/u/1313194?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/barykaed",
    "html_url": "https://github.com/barykaed",
    "followers_url": "https://api.github.com/users/barykaed/followers",
    "following_url": "https://api.github.com/users/barykaed/following{/other_user}",
    "gists_url": "https://api.github.com/users/barykaed/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/barykaed/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/barykaed/subscriptions",
    "organizations_url": "https://api.github.com/users/barykaed/orgs",
    "repos_url": "https://api.github.com/users/barykaed/repos",
    "events_url": "https://api.github.com/users/barykaed/events{/privacy}",
    "received_events_url": "https://api.github.com/users/barykaed/received_events",
    "type": "User",
    "site_admin": false,
    "name": "Kishore Babu",
    "company": "@MutualMobile",
    "blog": "",
    "location": "India",
    "email": "barykaed@gmail.com",
    "hireable": true,
    "bio": "I'm an Android Developer",
    "public_repos": 23,
    "public_gists": 1,
    "followers": 19,
    "following": 27,
    "created_at": "2012-01-08T16:31:07Z",
    "updated_at": "2018-09-04T12:03:21Z",
    "private_gists": 4,
    "total_private_repos": 0,
    "owned_private_repos": 0,
    "disk_usage": 14302,
    "collaborators": 0,
    "two_factor_authentication": false,
    "plan": {
        "name": "free",
        "space": 976562499,
        "collaborators": 0,
        "private_repos": 0
    }
}

 */