# FlutterProject
Progetto per esame ASPDM - Università degli Studi di Urbino Carlo Bo
Prof. Lorenz Cuno Klopfenstein

Studente: Andrea Cogorno
matricola n.309848
username GitHub: cogo71
URL: https://github.com/cogo71/FlutterProject

PPRESENTAZIONE
L'applicazione Ultimate List, nasce dall'idea di sostituire i foglietti scritti a mano per la lista della spesa.

CASI D'USO
Nella pagina principale l'utente può inserire i prodotti da acquistare utilizzando il bottone "+".
All'occorrenza è possibile "ripulire" la lista cancellando tutti i prodotti già inseriti con il bottone "dismiss all".
Con un tap sull’articolo desiderato è possibile entrare nel dettaglio del prodotto per editarne il nome.
Trascinando invece verso sinistra la “tile” che contiene il nome del prodotto sarà possibile eliminarlo dalla lista.
Il Drawer invece consente l’accesso a due pagine: la prima con le istruzioni per l’utilizzo dell’applicazione ed una seconda pagina di informazioni.
Scenario di utilizzo.
È possibile creare una lista con i prodotti egli articoli che l’utente vuole acquistare, ad esempio per la spesa di generi alimentari. Durante gli acquisti man mano che gli articoli vengono posti nel carrello sarà possibile “depennarli” dall’elenco ed avere sempre sotto controllo quanti articoli ancora mancano per terminare la spesa.

ESPERIENZA UTENTE
Conoscendo lo scopo dell’applicazione, il suo utilizzo risulta piuttosto intuitivo: l’utilizzo di ElevatedButton (divenuti ormai di uso comune) per la gestione dell’elenco rende immediata l’aggiunta di nuovi articoli. Il tap sul nome di un articolo consente di personalizzare al massimo la descrizione del singolo prodotto inserendo eventualmente anche brand di interesse o la quantità desiderata. La cancellazione ottenuta attraversamento il trascinamento del prodotto verso destra “simula” il gesto di depennare con una biro l’articolo appena comperato. La presenza del drawer consente in ogni momento di avere accesso alle istruzioni per l’utilizzo dell’applicazione.

TECNOLOGIA
Per la gestione dello stato globale dell’applicazione è stata utilizzata la libreria “provider”. Questa libreria consente una gestione semplificata dello stato dei widget, infatti attraverso le classi introdotte da questo pacchetto è possibile per ogni foglia dell’albero dei widget accedere allo stato globale dell’applicazione senza che la sua gestione debba essere coordinata manualmente. In particolare, ChangeNotifier notifica gli eventuali cambiamenti di stato e attraverso notifylistener vengono ricostruiti gli oggetti interessati dal cambiamento.
