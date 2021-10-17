%{
#include <stdio.h> /* printf() */
#include <string.h> /* strcpy */
#include <stdlib.h> /* atoi(), atof() */
#include "common.h" /* MAX_STR_LEN */
#include "p.tab.h" /* deklaracja symboli końcowych */

int process_token(const char *text, const char *TokenType,
                  const char *TokenVal, const int TokenID); 

int comm_beg = 0; /* wiersz rozpoczęcia komentarza */
%}


/* deklaracja dodatkowych warunków początkowych analizatora leksykalnego */
/* (nie deklarujemy domyślnego warunku początkowego INITIAL */
/* ..................... */

%x  ST_COMMENT_1 ST_COMMENT_2 ST_TEXT_CONST


%%




%%

/* Nazwa:	strnncpy
 * Cel:		Kopiuje zadaną liczbę znaków napisu umieszczając na końcu
 *		znak o kodzie 0.
 * Parametry:	dst		- (o) napis, do którego ma nastąpić kopiowanie;
 *		src		- (i) napis, który ma być kopiowany;
 *		n		- (i) maksymalna liczba znaków do kopiowania.
 * Zwraca:	dst.
 * Uwagi:	strncpy nie umieszcza znaku o kodzie 0 za kopiowanym napisem.
 *		Napis docelowy musi mieć miejsce na dodatkowy n+1 znak.
 */
char *
strnncpy(char *dst, const char *src, const int n)
{
  if (n > 0) {
    strncpy(dst, src, n);
  }
  dst[n] = '\0';
  return dst;
}/*strnncpy*/

/* Nazwa:       process_token
 * Cel:         Wypisanie informacji o wykrytym elemencie i przekazanie
 *              tej informacji wyżej z ewentualną wartością elementu, jeśli
 *              takowa występuje.
 * Parametry:   text            - (i) tekst, do którego nastąpiło dopasowanie;
 *              TokenType       - (i) napis będący tekstową reprezentacją
 *                                      nazwy typu elementu;
 *              TokenVal        - (i) wartość elementu, o ile występuje;
 *              TokenID         - (i) identyfikator typu elementu zadeklarowany
 *                                      za pomocą dyrektywy %token
 *                                      w pliku p.y lub kod pojedynczego
 *					znaku (w pliku analizatora składniowego
 *					występuje ujęty w apostrofy).
 * Zwraca:      Identyfikator typu elementu (TokenID).
 * Uwagi:       Informacja o wykrytym elemencie zwracana jest
 *              w trzech kolumnach. W pierwszej wypisywany jest tekst,
 *              do którego nastąpiło dopasowanie, w drugiej - typ elementu,
 *              w trzeciej - wartość elementu (o ile występuje).
 */
int process_token(const char *text, const char *TokenType,
                  const char *TokenVal, const int TokenID)
{
  int l;
  printf("%-20.20s%-15s %s\n", text, TokenType, TokenVal);
  switch (TokenID) {

  case INTEGER_CONST:
    yylval.i = atoi(TokenVal); break;

  case FLOAT_CONST:
    yylval.d = atof(TokenVal); break;

  case IDENT:
    strncpy(yylval.s, TokenVal, MAX_STR_LEN); break;

  case STRING_CONST:
    l = strlen(text);
    strncpy(yylval.s, TokenVal+1, l - 2 <= MAX_STR_LEN ? l - 1 : MAX_STR_LEN);
    break;

  case CHARACTER_CONST:
    yylval.i = TokenVal[1]; break;

  }
  return(TokenID);
}/*process_token*/


int yywrap( void )
{ /* funkcja wywoływana po napotkaniu końca strumienia wejściowego */

	/* sprawdzenie, czy bieżący warunek początkowy automatu YY_START */
	/* różni się od warunku początkowego INITIAL. Jeżeli tak, */
	/* to oznacza to niezamknięty komentarz lub stałą tekstową - */
	/* wypisujemy informację o błędzie.*/
	/* ..................... */


	return( 1 ); /* koniecznie, by analiza nie rozpoczęła się od nowa */
}

