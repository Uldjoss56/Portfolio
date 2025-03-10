enum DeviceType {
  smartphone,
  tablette,
  desktop,
}

DeviceType getDeviceType(double screenWidth) {
  final DeviceType deviceType;

  if (screenWidth < 600) {
    deviceType = DeviceType.smartphone;
  } else if (screenWidth < 1024) {
    deviceType = DeviceType.tablette;
  } else {
    deviceType = DeviceType.desktop;
  }
  return deviceType;
}
