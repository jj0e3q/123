function CenterCircleInTriang(const P1, P2, P3: TPoint): TPoint;
{ Возвращает центр вписанной в треугольник окружности }

 function LineSize(const X0, X1, Y0, Y1: Integer): Extended;
 begin
   if X0 = X1 then
     Result := Abs(Y0 - Y1)
   else if Y0 = Y1 then
     Result := Abs(X0 - X1)
   else
     Result := Sqrt(Sqr(X1 - X0) + Sqr(Y1 - Y0));
 end;

var
 a, b, c, Perim: Extended;
begin
 a := LineSize(P1.X, P2.X, P1.Y, P2.Y);
 b := LineSize(P2.X, P3.X, P2.Y, P3.Y);
 c := LineSize(P3.X, P1.X, P3.Y, P1.Y);
 Perim := a + b + c;
 if Round(Perim) > 0 then
 begin
   Perim := 1 / Perim;
   Result := Point(Round((b * P1.x + c * P2.x + a * P3.x) * Perim),
                   Round((b * P1.y + c * P2.y + a * P3.y) * Perim));
 end
 else
   Result := P1;
end;
