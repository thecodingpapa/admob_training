import 'dart:convert';

///
/// 테스트를 위한 데이터들입니다!!
///
class Dummy {
  Dummy.fromJson(dynamic json) {
    profile = json['profile'] ?? "";
    name = json['name'] ?? "";
    sub = json['sub'] ?? "";
  }

  late final String profile;
  late final String name;
  late final String sub;
}

final List<dynamic> dummies =
    jsonDecode(jsonStr).map((map) => Dummy.fromJson(map)).toList();

const jsonStr =
    '''[{"profile":"https://robohash.org/cumqueducimusodio.jpg?size=50x50&set=set1","name":"Nancey Broxup","sub":"Account Executive"},
{"profile":"https://robohash.org/sequipariaturfugiat.jpg?size=50x50&set=set1","name":"Honoria Adrian","sub":"VP Product Management"},
{"profile":"https://robohash.org/commodiducimusvoluptatem.jpg?size=50x50&set=set1","name":"Brewer Morrel","sub":"Human Resources Assistant III"},
{"profile":"https://robohash.org/noniddelectus.jpg?size=50x50&set=set1","name":"Garrik Chimienti","sub":"Cost Accountant"},
{"profile":"https://robohash.org/consequunturmolestiaeipsa.jpg?size=50x50&set=set1","name":"Scottie McNabb","sub":"Research Associate"},
{"profile":"https://robohash.org/culpatotamet.jpg?size=50x50&set=set1","name":"Roze De Vuyst","sub":"Chemical Engineer"},
{"profile":"https://robohash.org/occaecaticonsequaturet.jpg?size=50x50&set=set1","name":"Lolita Tresvina","sub":"Assistant Professor"},
{"profile":"https://robohash.org/sintdeseruntofficia.jpg?size=50x50&set=set1","name":"Merrielle Francescone","sub":"General Manager"},
{"profile":"https://robohash.org/quiaodioin.jpg?size=50x50&set=set1","name":"Willdon Tonkes","sub":"Safety Technician IV"},
{"profile":"https://robohash.org/iddistinctioassumenda.jpg?size=50x50&set=set1","name":"Renato Galbreath","sub":"Associate Professor"},
{"profile":"https://robohash.org/etrerumlaborum.jpg?size=50x50&set=set1","name":"Alejandra Gepson","sub":"Actuary"},
{"profile":"https://robohash.org/solutacumvoluptas.jpg?size=50x50&set=set1","name":"Kyla Galero","sub":"Speech Pathologist"},
{"profile":"https://robohash.org/exdistinctioquisquam.jpg?size=50x50&set=set1","name":"Modesta Erik","sub":"Nurse Practicioner"},
{"profile":"https://robohash.org/abmaximevelit.jpg?size=50x50&set=set1","name":"Nikki Moore","sub":"Engineer I"},
{"profile":"https://robohash.org/delectusquiadipisci.jpg?size=50x50&set=set1","name":"Malorie Umney","sub":"Associate Professor"},
{"profile":"https://robohash.org/nisiiustocum.jpg?size=50x50&set=set1","name":"Lelah Abramamov","sub":"Sales Representative"},
{"profile":"https://robohash.org/eumvoluptatibusreiciendis.jpg?size=50x50&set=set1","name":"Dode Peret","sub":"Teacher"},
{"profile":"https://robohash.org/vitaeuttotam.jpg?size=50x50&set=set1","name":"Hartley Thecham","sub":"Graphic Designer"},
{"profile":"https://robohash.org/estatiusto.jpg?size=50x50&set=set1","name":"Ivett Kettlestringe","sub":"Paralegal"},
{"profile":"https://robohash.org/dolorvoluptatemenim.jpg?size=50x50&set=set1","name":"Arlen Gallandre","sub":"Recruiting Manager"},
{"profile":"https://robohash.org/minuspariaturtempore.jpg?size=50x50&set=set1","name":"Armand Lent","sub":"Database Administrator I"},
{"profile":"https://robohash.org/doloressequised.jpg?size=50x50&set=set1","name":"Garland Sacchetti","sub":"Sales Representative"},
{"profile":"https://robohash.org/exercitationemverodolorum.jpg?size=50x50&set=set1","name":"Kiah Speak","sub":"Teacher"},
{"profile":"https://robohash.org/providentquianumquam.jpg?size=50x50&set=set1","name":"Ricki Tootin","sub":"Account Executive"},
{"profile":"https://robohash.org/inminusmodi.jpg?size=50x50&set=set1","name":"Cesaro Lethbury","sub":"Account Executive"},
{"profile":"https://robohash.org/quosverorecusandae.jpg?size=50x50&set=set1","name":"Johnette Worlidge","sub":"Associate Professor"},
{"profile":"https://robohash.org/autemautempariatur.jpg?size=50x50&set=set1","name":"Miguela Jennions","sub":"Biostatistician III"},
{"profile":"https://robohash.org/sedbeataeaccusamus.jpg?size=50x50&set=set1","name":"Andriana Talby","sub":"Teacher"},
{"profile":"https://robohash.org/sednonsaepe.jpg?size=50x50&set=set1","name":"Elisabet Garvagh","sub":"Data Coordiator"},
{"profile":"https://robohash.org/dictaconsequaturmolestiae.jpg?size=50x50&set=set1","name":"Kliment Walcot","sub":"Data Coordiator"},
{"profile":"https://robohash.org/rationelaborequia.jpg?size=50x50&set=set1","name":"Earle Braganca","sub":"Structural Engineer"},
{"profile":"https://robohash.org/pariaturnonet.jpg?size=50x50&set=set1","name":"Gabriello Franzolini","sub":"Executive Secretary"},
{"profile":"https://robohash.org/quianecessitatibusreprehenderit.jpg?size=50x50&set=set1","name":"Haley Plumridge","sub":"Geological Engineer"},
{"profile":"https://robohash.org/enimadut.jpg?size=50x50&set=set1","name":"Court Jakubovits","sub":"Associate Professor"},
{"profile":"https://robohash.org/iureprovidentconsequatur.jpg?size=50x50&set=set1","name":"Hedvige Rorke","sub":"Geological Engineer"},
{"profile":"https://robohash.org/eligendinihilaliquam.jpg?size=50x50&set=set1","name":"Ive Dyne","sub":"Graphic Designer"},
{"profile":"https://robohash.org/rerumquosexpedita.jpg?size=50x50&set=set1","name":"Gardy Boake","sub":"Technical Writer"},
{"profile":"https://robohash.org/doloremqueminusillo.jpg?size=50x50&set=set1","name":"Jeniffer Beaten","sub":"Nuclear Power Engineer"},
{"profile":"https://robohash.org/istesuscipitconsequatur.jpg?size=50x50&set=set1","name":"Pauli Gatus","sub":"Assistant Manager"},
{"profile":"https://robohash.org/pariaturquiaexercitationem.jpg?size=50x50&set=set1","name":"Alvina Gentery","sub":"Financial Advisor"},
{"profile":"https://robohash.org/quiillumdebitis.jpg?size=50x50&set=set1","name":"Cherlyn Macken","sub":"Occupational Therapist"},
{"profile":"https://robohash.org/omnisetvoluptatibus.jpg?size=50x50&set=set1","name":"Renato Harbron","sub":"Human Resources Assistant IV"},
{"profile":"https://robohash.org/repellataliasut.jpg?size=50x50&set=set1","name":"Baldwin McHardy","sub":"Software Test Engineer II"},
{"profile":"https://robohash.org/sitipsaminus.jpg?size=50x50&set=set1","name":"Loralyn Coleridge","sub":"Account Executive"},
{"profile":"https://robohash.org/quodquidicta.jpg?size=50x50&set=set1","name":"Adelle Donaway","sub":"Research Nurse"},
{"profile":"https://robohash.org/estnonet.jpg?size=50x50&set=set1","name":"Matteo Falk","sub":"Occupational Therapist"},
{"profile":"https://robohash.org/eosnostrumsint.jpg?size=50x50&set=set1","name":"Tomas Deakins","sub":"VP Quality Control"},
{"profile":"https://robohash.org/providentquia.jpg?size=50x50&set=set1","name":"Ragnar Jirik","sub":"Help Desk Technician"},
{"profile":"https://robohash.org/sequireprehenderitquia.jpg?size=50x50&set=set1","name":"Bliss Kettell","sub":"Analog Circuit Design manager"},
{"profile":"https://robohash.org/quianatusmaxime.jpg?size=50x50&set=set1","name":"Alberta Gradley","sub":"Structural Analysis Engineer"}]''';
