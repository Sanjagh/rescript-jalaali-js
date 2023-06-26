type t = {
  jy: float,
  jm: float,
  jd: float,
}

type gregorian = {
  gy: float,
  gm: float,
  gd: float,
}

@module("jalaali-js") external toJalaali: Js.Date.t => t = "toJalaali"
@module("jalaali-js")
external toGregorian: (float, float, float) => gregorian = "toGregorian"

let utcMillisToLocalDate = (millis: float) => millis->Js.Date.fromFloat->toJalaali

let toYYYYMMDD = ({jy, jm, jd}: t) =>
  Float.toString(jy) ++ ("/" ++ (Float.toString(jm) ++ ("/" ++ Float.toString(jd))))

let utcMillisToYYYYMMDD = millis => millis->utcMillisToLocalDate->toYYYYMMDD
