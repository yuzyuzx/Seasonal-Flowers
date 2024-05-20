import Foundation

extension Flower {
  static let flowers: [Flower] = [
    Flower(
      id: "001",
      name: "サクラ",
      description: "サクラはヒマラヤ原産と考えられ、ヒマラヤザクラの2万5000年前の化石がある。ユーラシア大陸中南部から、シベリア、日本、中国、米国・カナダなど、主に北半球の温帯に広範囲に自生している。歴史的に日本文化に馴染みの深い植物であり、その変異しやすい特質から特に日本で花見目的に多くの栽培品種が作出されてきた（#日本における栽培品種と品種改良、#日本人とサクラ）。このうち観賞用として最も多く植えられているのがソメイヨシノである。鑑賞用としてカンザンなど日本由来の多くの栽培品種が世界各国に寄贈されて各地に根付いており（日本花の会、キューガーデン、全米桜祭りなど参照）、英語では桜の花のことを「Cherry blossom」と呼ぶのが一般的であるが、日本文化の影響から「Sakura」と呼ばれることも多くなってきている。\n\nサクラの果実はサクランボまたはチェリーと呼ばれ、世界中で広く食用とされる。日本では、塩や梅酢に漬けた花も食用とされる。\n\nサクラ全般の花言葉は「精神の美」「優美な女性」、西洋では「優れた教育」も追加される。桜では開花のみならず、散って桜吹雪が舞う雅な様を日本人の精神に現した。\n\n国の天然記念物に指定されているサクラは、沖縄県から東北地方まで25都道府県に39件あり、このうち狩宿の下馬ザクラと大島のサクラ株は特別天然記念物に指定されている。",
      imageName: "001",
      season: .spring
    ),
    Flower(
      id: "002",
      name: "スミレ",
      description: "スミレの説明",
      imageName: "dummy",
      season: .spring
    ),
    Flower(
      id: "003",
      name: "ヒマワリ",
      description: "ヒマワリの説明",
      imageName: "dummy",
      season: .summer
    ),
    Flower(
      id: "004",
      name: "アジサイ",
      description: "アジサイの説明",
      imageName: "dummy",
      season: .summer
    ),
  ]
  
  static let flowerGroup: [String: [Flower]] = Dictionary(grouping: Flower.flowers, by: {$0.season.rawValue})
}
