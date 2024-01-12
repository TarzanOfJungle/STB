enum AnimationAsset {
  LOGIN("assets/animations/login.json"),
  REGISTRATION("assets/animations/registration.json"),
  NO_DATA("assets/animations/empty_bag.json"),
  ERROR("assets/animations/error.json");

  final String url;
  const AnimationAsset(this.url);
}