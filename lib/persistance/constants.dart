bool get inMemoryPersistence => _inMemoryPersistence;
bool _inMemoryPersistence = false;

/// This setting will affect all NO SQL databases to reside only in the memory.
set inMemoryPersistence(final bool value) {
  if (_inMemoryPersistence == value) {
    return;
  }
  _inMemoryPersistence = value;
}

bool get isUnderTest => _isUnderTest;
bool _isUnderTest = false;

/// Indicates if the system is currently under test
set isUnderTest(final bool value) {
  if (_isUnderTest == value) {
    return;
  }
  _isUnderTest = value;
}
