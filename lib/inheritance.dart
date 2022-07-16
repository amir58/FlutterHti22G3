void main() {
  var one = ScreenOne("ScreenOne");
  one.printScreenName();

  var two = ScreenTwo();
  two.printScreenName();
}

abstract class BaseScreen implements IAnimations {
  void getData();

  String screenName;

  BaseScreen(this.screenName);

  void printScreenName() {
    print(screenName);
  }

  isWifiOn() => false;

  bool isDataOn() {
    return true;
  }

  void navigateToMainScreen() {}

  void navigateToLoginScreen() {}
}

class IAnimations {
  void startAnimations() {
    print('start');
  }

  void stopAnimations() {
    print('stop');
  }
}

class ScreenOne extends BaseScreen {
  ScreenOne(super.screenName);

  void build() {
    if (super.isWifiOn()) {
      super.navigateToLoginScreen();
      return;
    }

    if (super.isDataOn()) {
      super.navigateToMainScreen();
    }
  }

  @override
  void printScreenName() {
    super.printScreenName();
    print('= = = = = = = = = =');
  }

  @override
  void getData() {
    // TODO: implement getData
  }

  @override
  void startAnimations() {
    // TODO: implement startAnimations
  }

  @override
  void stopAnimations() {
    // TODO: implement stopAnimations
  }

}

class ScreenTwo extends BaseScreen {
  ScreenTwo() : super("ScreenTwo");

  void build() {
    if (super.isWifiOn()) {
      super.navigateToLoginScreen();
      return;
    }

    if (super.isDataOn()) {
      super.navigateToMainScreen();
    }
  }

  @override
  void printScreenName() {
    // super.printScreenName();
    print('- - - - - - - - - -');
    print('=> ${super.screenName} <=');
    print('- - - - - - - - - -');
  }

  @override
  void getData() {
    // TODO: implement getData
  }

  @override
  void startAnimations() {
    // TODO: implement startAnimations
  }

  @override
  void stopAnimations() {
    // TODO: implement stopAnimations
  }
}
