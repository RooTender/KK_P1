Program ASCII; (* Wyswietla kody ASCII *)
Uses
   crt, dos;
{$I MyFile.inc}
Var
   i : Integer;
   c : Char;
   r : real;
   t : array[1..10] of integer;
   d :  record
	   rok, miesiac	: integer;
	   dzien	:  integer;
	end;
Const	(* zakres wyswietlanych znakow *)
   minASCII = 30;
   maxASCII = 255;
Begin
   ClrScr(); (* intro na czystym ekranie *)
   Write('Kody ASCII od 30 do 255: '); WriteLn('(po 20 w wierszu):');
   For i := minASCII To maxASCII Do (* wyswietlenie zadanych kodow ASCII *)
      Write( Chr( i ) : 4 );
   ReadKey; (* czekaj na nacisniecie klawisza *)
   r := 12.34e-12 * ( 56.0 + 0.78 ); { test liczb rzeczywistych }
   i := minASCII + 2 * (20 + maxASCII );
   t[10] := 1;
   for i := 9 downto 1 do t[i] := t[i+1] * i * i;
   d.rok := 2018;
   d.dzien := 1;
   d.miesiac := d.dzien * 10;
End.

