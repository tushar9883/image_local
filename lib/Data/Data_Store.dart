class Data_Model_Story {
  final String name;
  final int like;
  final int comment;
  final int view;
  final int day;
  final String profilepic;
  final String commmentss;
  final String postphoto;

  Data_Model_Story(
      this.like, this.comment, this.view, this.commmentss, this.day,
      {required this.name, required this.profilepic, required this.postphoto});
}

// dummy data to show Profile post and story image and Name of the account user.
List<Data_Model_Story> dummyStoryData = [
  Data_Model_Story(2, 25, 5, "hi", 5,
      name: "Rajat Palankar",
      postphoto:
          "https://d1kkg0o175tdyf.cloudfront.net/large/m_d2c4766b1ede-2019-01-27-14-00-16-000106.jpg",
      profilepic:
          "https://pbs.twimg.com/profile_images/1243950916362895361/Z__-CJxz_400x400.jpg"),
  Data_Model_Story(
      4,
      35,
      20,
      " ccxzcxz gnh gfhfg gfnjhfg hello hello hello hello hello hello hello hello hello hello",
      2,
      name: "Vines",
      postphoto:
          "https://user-images.githubusercontent.com/90302599/172352849-4b9ab8d6-6d89-45ce-b10e-8fddc6e5d328.png",
      profilepic:
          "https://images-na.ssl-images-amazon.com/images/I/711q+ma1FQL.png"),
  Data_Model_Story(6, 40, 15, "nice click", 1,
      name: "Ashish",
      postphoto:
          "https://assets.entrepreneur.com/content/3x2/2000/20200217104953-Ashish1.jpeg",
      profilepic:
          "https://yt3.ggpht.com/a/AATXAJwZGPuuePGI6Mr887w6f6ZxsnoDl-Xf10gKPKIOeg=s900-c-k-c0xffffffff-no-rj-mo"),
  Data_Model_Story(2, 85, 10, "send me", 4,
      name: "Angry Prash",
      postphoto:
          "https://cdn.pixabay.com/photo/2014/02/27/16/10/tree-276014_960_720.jpg",
      profilepic:
          "https://i.picsum.photos/id/1060/200/300.jpg?hmac=xYtFmeYcfydIF3-Qybnra-tMwklX69T52EtGd-bacBI"),
  Data_Model_Story(7, 5, 20, "nice ", 7,
      name: "Carryminati",
      postphoto: "https://i.ytimg.com/vi/zzwRbKI2pn4/maxresdefault.jpg",
      profilepic:
          "https://m.media-amazon.com/images/M/MV5BM2NlNzUyODUtZDgyNS00ZjU3LWI5NGUtOWFkYmQwMGVlNGRmXkEyXkFqcGdeQXVyMTE2MTc3MzU1._V1_.jpg"),
  Data_Model_Story(9, 1, 48, "hey", 1,
      name: "Leo",
      postphoto:
          "https://cdn.pixabay.com/photo/2013/05/15/06/10/autumn-111315_960_720.jpg",
      profilepic:
          "https://cdn.pixabay.com/photo/2016/11/29/02/28/attractive-1866858__340.jpg"),
  Data_Model_Story(10, 6, 2, "cool", 3,
      name: "Jack",
      postphoto:
          "https://cdn.pixabay.com/photo/2017/01/19/23/46/church-1993645_960_720.jpg",
      profilepic:
          "https://cdn.pixabay.com/photo/2017/06/26/02/47/people-2442565__340.jpg"),
  Data_Model_Story(12, 14, 84, "nice", 2,
      name: "Amelia",
      postphoto:
          "https://cdn.pixabay.com/photo/2020/10/14/18/35/sign-post-5655110_960_720.png",
      profilepic:
          "https://cdn.pixabay.com/photo/2018/01/24/19/49/people-3104635__340.jpg"),
];
