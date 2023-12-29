abstract class SocialloginState{}
class SocialloginInitalState extends SocialloginState{}
class SocialloginloadingState extends SocialloginState{}
class SocialloginSuccessState extends SocialloginState{}
class SocialloginErrorState extends SocialloginState{
  final String Error;
  SocialloginErrorState(this.Error);
}
class SocialChangePassword extends SocialloginState{}