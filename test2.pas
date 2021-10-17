Program ASCII; (* Wyswietla kody ASCII *)
Uses
	crt, dos;
{$I MyFile.inc}
Var
	i : Integer;
	c : Char;
	r : real;
Const	(* zakres wyswietlanych znakow *)
	minASCII = 30;
	maxASCII = 255;
Begin
	ClrScr(); (* intro na czystym ekranie *)
	Writeln( 'Kody ASCII od 30 do 255: (po 20 w wierszu):' );
	For i := minASCII To maxASCII Do (* wyswietlenie zadanych kodów ASCII *)
		Write( Chr( i ) : 4 );
	ReadKey; (* czekaj na nacisniecie klawisza *)
	r := 12.34 * ( 56.0 + 0.78 ); { test liczb rzeczywistych }
	i := minASCII + 2 * (20 + maxASCII );
	*) { nieotwarty komentarz }
	}  { nieotwarty komentarz }
	{ komentarz
	wielowierszowy 1 }
	(* komentarz
	wielowierszowy 2 *)
	{ niezamkniety komentarz ...
End.
