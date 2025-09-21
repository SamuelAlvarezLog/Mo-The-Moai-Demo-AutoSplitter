state("Mo The Moai") 
{  }
startup
{
	 vars.Helper =Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
      settings.Add("Orb1", false, "Magic Orb 1");
  settings.Add("Orb2", false, "Magic Orb 2");

  settings.Add("letter", false, "Love Letter");

  settings.Add("cupcake", false, "Cupcake");

  settings.Add("sandwich", false, "Sandwich");

timer.CurrentTimingMethod = TimingMethod.GameTime;
}
init
{

  vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
  {
   
  vars.Helper["StartTimer"] = mono.Make<bool>("LiveSplitData", "StartTimer");
 vars.Helper["StopTimer"] = mono.Make<bool>("LiveSplitData", "StopTimer");

 vars.Helper["sewers"] = mono.Make<bool>("LiveSplitData", "sewers");
 vars.Helper["sewer_exterior"] = mono.Make<bool>("LiveSplitData", "sewer_exterior");
 vars.Helper["MoHouse"] = mono.Make<bool>("LiveSplitData", "MoHouse");
vars.Helper["OutsideTree"] = mono.Make<bool>("LiveSplitData", "OutsideTree");
vars.Helper["InsideTree"] = mono.Make<bool>("LiveSplitData", "InsideTree");
vars.Helper["TopOfTheTree"] = mono.Make<bool>("LiveSplitData", "TopOfTheTree");
vars.Helper["end"] = mono.Make<bool>("LiveSplitData", "end");

vars.Helper["BigSister_Rose"] = mono.Make<bool>("LiveSplitData", "BigSister_Rose");
vars.Helper["Mother_Fruit"] = mono.Make<bool>("LiveSplitData", "Mother_Fruit");
vars.Helper["Mother_Sandwich"] = mono.Make<bool>("LiveSplitData", "Mother_Sandwich");
vars.Helper["Magic_Orb_1"] = mono.Make<bool>("LiveSplitData", "Magic_Orb_1");
vars.Helper["Magic_Orb_2"] = mono.Make<bool>("LiveSplitData", "Magic_Orb_2");

vars.Helper["falCount"] = mono.Make<int>("LiveSplitData", "falCount");
vars.Helper["jumpCount"] = mono.Make<int>("LiveSplitData", "jumpCount");   
vars.Helper["ThrowCount"] = mono.Make<int>("LiveSplitData", "ThrowCount"); 
vars.Helper["Loading"] = mono.Make<bool>("LiveSplitData", "Loading"); 
vars.Helper["RestartTeleport"] = mono.Make<bool>("LiveSplitData", "RestartTeleport"); 

    return true;
  });
}
start
{
   
  return !old.StartTimer && current.StartTimer;
}
isLoading
{
return current.Loading;
}
reset
{
  return !old.StopTimer && current.StopTimer;

}
split
{

 if(!old.sewer_exterior && current.sewer_exterior)
{
return true;
}
 if(!old.MoHouse && current.MoHouse)
{
return true;
}
 if(!old.OutsideTree && current.OutsideTree)
{
return true;
}
 if(!old.InsideTree && current.InsideTree)
{
return true;
}
 if(!old.TopOfTheTree && current.TopOfTheTree)
{
return true;
}
 if(!old.end && current.end)
{
return true;

}

  if (settings["Orb1"]&& !old.Magic_Orb_1 && current.Magic_Orb_1) {return true;  }

  if (settings["Orb2"]&&!old.Magic_Orb_2 && current.Magic_Orb_2 ) {return true;  }

  if (settings["letter"]&& !old.BigSister_Rose  && current.BigSister_Rose) { return true; }

  if (settings["cupcake"]&& !old.Mother_Fruit && current.Mother_Fruit) { return true;}

  if (settings["sandwich"]&&!old.Mother_Sandwich && current.Mother_Sandwich ) { return true; }


}
exit
{
	vars.Unity.Reset();
}

shutdown
{
	vars.Unity.Reset();
}
