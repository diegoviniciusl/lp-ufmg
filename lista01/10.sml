datatype Planets = Mercurio | Venus | Terra | Marte | Jupiter | Saturno | Urano | Netuno;

fun planetAge (months: int, planet: Planets) = 
  let
    val years = months div 12
  in
    case planet of
      Mercurio => years * 88
      | Venus => years * 225
      | Terra => years * 365
      | Marte => years * 687
      | Jupiter => years * 4332
      | Saturno => years * 10760
      | Urano => years * 30681
      | Netuno => years * 60190
  end;

planetAge(24, Jupiter);