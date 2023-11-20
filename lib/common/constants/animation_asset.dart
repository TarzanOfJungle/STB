enum AnimationAsset {
  LOGIN("assets/animations/login.json"),
  REGISTRATION("assets/animations/registration.json"),
  NO_DATA("assets/animations/tumbleweed.json"),
  ERROR("assets/animations/error.json");

  final String url;
  const AnimationAsset(this.url);
}