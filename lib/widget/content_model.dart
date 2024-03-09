class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: 'خدمة عاملات منزليات مدربات بكل مهارة وإتقان \nويعملن بأعلى همه لضمان معايير الجودة',
      image: "images/cleaning service-amico.png",
      title: ' تطبيق خدمات عون لطلب عمالة منزلية '),
  UnboardingContent(
      description: 'الخدمات العمالية للقطاع المنزلي الآمنة والصحية\n  مدربة على تقديم الخدمات التي يحتاجها المجتمع',
      image: "images/cleaning service-pana.png",
      title: 'الشركة الرائدة في توفير الأيدي العاملة'),
  UnboardingContent(
      description: 'لأنك تستحق الراحة. يمكنكم الاعتماد على خدماتنا\n عاملات مقيمة وعاملات  بالساعة.',
      image: "images/cleaning service-rafiki.png",
      title: 'استمتعوا بخدمات ومزايا لا نهائية')
];
