# Index of lessons

----------------------------------------------

- [Index of lessons](#index-of-lessons)
  - [05/03/2021: Introduzione  a PowerShell (storia e caratteristiche) e tool di sviluppo VsCode](#05032021-introduzione--a-powershell-storia-e-caratteristiche-e-tool-di-sviluppo-vscode)
  - [12/03/2021: .Net Interactive, Git e GitHub, introduzione sintassi PowerShell e definizione funzioni](#12032021-net-interactive-git-e-github-introduzione-sintassi-powershell-e-definizione-funzioni)
  - [19/03/2021: Esempio utilizzo con MSTeams](#19032021-esempio-utilizzo-con-msteams)
  - [02/04/2021: Credenziali PS, caricamento dll .NET](#02042021-credenziali-ps-caricamento-dll-net)
  - [09/04/2021: Remoting PowerShell](#09042021-remoting-powershell)
  - [16/04/2021: Pattern di programmazione PowerShell](#16042021-pattern-di-programmazione-powershell)
  - [23/04/2021: Espressioni regolari](#23042021-espressioni-regolari)
  - [07/05/2021: Docker e containers](#07052021-docker-e-containers)
  - [14/05/2021: Docker e containers: debug](#14052021-docker-e-containers-debug)
  - [21/05/2021: Storia .NET](#21052021-storia-net)
  - [28/05/2021: Servizi web .NET](#28052021-servizi-web-net)
  - [11/06/2021: Caso di studio: Eligere](#11062021-caso-di-studio-eligere)
  - [09/07/2021: Caso di studio: Eligere - MVC, ORM e accesso ad i dati](#09072021-caso-di-studio-eligere---mvc-orm-e-accesso-ad-i-dati)
  - [23/07/2021:  Caso di studio: Eligere - Programmazione dichiarativa, marshalling e unmarshalling](#23072021--caso-di-studio-eligere---programmazione-dichiarativa-marshalling-e-unmarshalling)

----------------------------------------------

## [05/03/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210305_100215-Registrazione%20della%20riunione.mp4): Introduzione  a PowerShell (storia e caratteristiche) e tool di sviluppo VsCode

- PowerShell come strumento open source e multi piattaforma (cambio di direzione Microsoft); influenza da shell unix ma orientato alla composizione di oggetti.
- Storia PowerShell:
  - nel 2000, windows scripting host - eseguiva javascript fuori dal browser. Le shell linux sono un modo per comporre e orchestrare software che sono gia precompilato. Se due cose sono comandi, tramite il pipelining ottengo un comando. Sostanzialmente è un algebra (perl, awk ecc ..).
  - Le shell unix si sono evoluti in linguaggi di scripting che consente qualcosa in più della semplice pipeline.
  - Il modello di shell di windows è diverso e parte dal modello Component Object Model (COM) - te lo compili vs te lo componi. COM, standard legato c++, interfacce binarie a puntatori a funzioni: consente di invocare funzioni senza conoscerle a tempo di compilazione (conoscendo solo l'interfaccia) - possibile programmare (le parti di word).
  - Esempio gist per generare pdf per ogni elemento di una stampa unione. è possibile perché word è di fatto un componente: un oggetto software che espone delle API. Creo oggetto COM (lo rendo visibile) e chiamo le funzioni da lui esposte - parti che costituiscono word.
  - COM ha serie di problematiche legati alla definizione dei tipi indipendenti dal linguaggio.
  - Microsoft ha sviluppato per molto tempo in modo di comporre software che, invece di comporre processi che eseguono e condividono uno stream di caratteri, ha un modello in cui carichi i componenti e ne chiami le API.
  - Per gestire la sicurezza di eseguire binari che non conosci sono stati introdotti i concetti di InProcess (caricato dentro il processo che chiama) e OutOfProcess (viene tirato su un altro processo che comunica tramite un proxy) in modo da mantenere le corrette separazioni.
  - Microsoft ho introdotto il concetto di registro dei componenti: il registro di Windows nasce, non per le configurazioni, ma per fare il registro dei componenti registrati nel sistema (identificabili tramite GUID - generabili in modo distribuito su scala globale con bassa probabilità di clash).
  - Nascita di .NET come risposta a causa di Sun su Java (perché MS voleva esporre COM a a Java, facendo venire meno l'indipendenza dalla piattaforma).
  - Navigazione nel registro di windows alla ricerca di COM.
  - ObjShell scritta da Cisternino per invocare COM da Javascript.
  - Essendo PowerShell basato su .NET è necessario conoscere qualcosa di .NET
  - Primo Esempio: di script PowerShell: Get-NetAdapter, Export-Csv, esempio di caricamento namespace .NET. Non tutte le funzioni fanno ricorso ad eseguibili (come shell unix - dove anche sort è un eseguibile) ma sono esposte dal framework. Se bisogna fare qualcosa di complesso in PowerShell si cerca come farlo da .NET. Non è un pipe di stream caratteri ma un pipe di oggetti. Utilizzo di select per selezionare solo le colonne/properties a cui sono interessato. Le select (alias per Select-Object) consentono di utilizzare gli oggetti, in stile SQL, come fossero oggetti righe di un db. Scarica il marshalling/unmarshalling (traduzione di oggetti in stringa e viceversa - compito pervasivo in shell unix) sulla shell/runtime. I primi CmdLet si potevano scrivere solo in C# (non era un algebra chiusa); ora si può fare CmdLet ed intere librerie in pwsh. Il fatto che gli script siano auto contenuti (senza binari fuori di pwsh) è un vantaggio perché facilita la portabilità (non richiede altro installato sul sistema). Inoltre pwsh beneficia del sistema di pacchetti .net chiamato nuget. I pacchetti si usano solo per cose specifiche perché la maggior parte dei task sono auto contenuti nella powershell.
  - Su linux pwsh sempre più usata per i cron in quando permette di avere script auto contenuti
  - Dicitura "Core": .NET standard fu standardizzate e rilasciati i sorgenti del Common Language Runtime (CLR) - Xamarin rilasciò Mono; con il fallimento di Windows Mobile si è rotto il monopolio del client di Microsoft e ha forzato Microsoft a supportare altre piattaforme. Azure gli garantisce di guadagnare non dal software ma da i cicli macchini. Prima .NetFramework, poi .Net core fino alle 3, la prima matura; poi fine di .NetCore per .Net5, unica versione sviluppata open source. PowerShell ha sempre il suffisso core per motivi storici, finché la vecchia non verrà dismessa. Tutti i sorgenti di PowerShell è accessibile su GitHub (in sotto progetti).
- Tools di sviluppo: Microsoft ha storicamente i più potenti strumenti di sviluppo. Ultimamente ha creato e sviluppato open source un editor multi piattaforma VsCode, nato da Atom, scritto in javascript usando il browser. Si integra nativamente con git (processo di versionamento dei sorgenti).
  - Interfaccia minimale
  - Sistema a moduli; le estensioni abilitano lo sviluppo in vari ambiti. Riconosce le viarie estensioni dei file e suggerisce le estensioni da installare.
  - Non cè più il progetto; tutto il contenuto della cartella è il progetto. Il primo passo è "open folder".
  - Esempio di creazione di uno script PowerShell. Opportunità di selezionare parti di codice ed valutarle/eseguirle (consente di creare una soluzione per approssimazioni successive). Ha intellisense che fa l'auto completamento e mostra la documentazione. F5  = debug. F8 = esegui la parte di codice selezionato.
- Esempio (gist) di script (CmdLet) PowerShell che verifica la scadenza dei certificati
  
## [12/03/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210312_120021-Registrazione%20della%20riunione.mp4): .Net Interactive, Git e GitHub, introduzione sintassi PowerShell e definizione funzioni

- .net interactive:
  - oggetto interessante che supporta tra gli altri anche powershell
  - literate programming: scrivere documenti che siano anche eseguibili; può essere utile per documentare parti di scripting e supportare la didattica nei laboratori
  - jupyther: ambiente web oriented che consente di eseguire codice
  - installazione estensione .netinteractive su vscode
  - aperture notebook .netinteractive; scelta del tipo di codice
  - esempio analisi dei dati COVID-19:
    - installazione pacchetti nuget
    - uso di più linguaggi (ps, c#, js)
  - far girare container sul cloud usando un container tramite jupyther tramite mybinder.com
- Repository condiviso github.com con codice del corso <https://github.com/Unipisa/PowerShellTraining>
- Accordo enterprise Unipisa@GitHub.com
- Gist su github
- Creazione git, clone, commit, pull request
- Ambiente di Sviluppo PowerShell in vscode con integrazione git (source control - notazione U = untracked)
- Base sintassi powershell
  - variabili $ ($ per S per Scalare)
  - le variabili hanno sempre un tipo; il tipo viene inferito dal runtime a seconda valore che in un certo momento è associato (fortemente tipato ma non staticamente tipato)
  - è possibile fare espansione "stringa $variabile"
  - f8 per valutare
  - stringhe con singoli apici, non hanno espansione; doppi apici hanno espansione
  - stringe sono multiple (posso andare a capo)
  - escape " con doppio ""
  - troviamo tutti i tipi di .net
  - array a = (1, 2, 3) readonly (+= crea un nuovo array), liste e dizionari
  - Write-Output per standard output - redirezionabile su file vs Write-Host
  - foreach, if
  - operatore come command line (si usa -eq per uguaglianza ); espande il confronto a operazioni che non avrebbero un espressione
  - range 0 .. 100 = da 0 a 100
  - parametri: con - l'intellisense mostra tutti i parametri; alcuni sono opzionali, alcuni hanno un valore di default
  - introduzione a definizione di funzioni
  - il risultato di CmdLet è sempre un oggetto; nel caso restituisca del testo, l'oggetto è un array di stringhe. Gli oggetti possono essere poi trattati in pipeline, facendoci ad esempio | select * per vedere tutto l'oggetto. | Out-GriView lo vedo tramite un interfaccia grafica tabellare.

## [19/03/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210319_120403-Registrazione%20della%20riunione.mp4): Esempio utilizzo con MSTeams

- Pervasività di Powershell in quanto multi piattaforma (gira su raspberry 2 e 3)
- Trasformazione di script PowerShell in notebook .NetInteractive: file .dib: si scrive #!markdown per le parti di commento (usando linee commentate powershell #) e #!pwsh per le parti di codice.
- Ripasso lezioni precedente: variabili con $, linguaggio tipato, stringhe con espansione e valutazione di espressioni "string $espansione $(2+2) $(obj.n)", escape con doppi apici come SQL, iterazioni, intro CmdLet e sintassi Verb-Object, moduli come librerie
- Esempio con MSTeam:
  - con Install-Module scarico un modulo (MicrosoftTeams)
  - con Get-Installed module vedo i moduli installati
  - con Import-Module carico tutti i comandi del modulo
  - con Get-Commands vedo tutti i comandi installati; Get-Command Get-* solo i comandi che iniziano con Get-
  - Connect-MicrosoftTeams; per l'autenticazione federata fa passare tramite l'autenticazione con browser dando un OneTimeCode.
  - Get-Team -User aXXXXX@unipi.it da tutti i teams di cui sono utente
  - Documentazione del modulo MicrosoftTeams
  - @{} creo un dizionario vuoto, @($v) crea un array di un elemento
  - Aggiungo elementi ad array `$a[$i]+= $v`(non efficientissimo)
  - \$array | where {$_ \<property\> -eq \<valore\>} equivalente $array | Group-Object \<property\>
  - $array | measure fa tutte le misure di un array
  - hash table (dizionario) non è un oggetto tabellare, come invece è l'array. Per avere l'array corrispondente si fa $dizionario | Values
  - trasformazione di dizionario in oggetto tabellare di PsCustomObject
  - Foreach-Object == map
  - Export-csv -Delimiter ';' e Import-csv : si fa marshalling un unmarshalling con csv, ma il tipo cambia da oggetti di tipo MSTeams a PSCustomObject
  
## [02/04/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210402_120425-Registrazione%20della%20riunione.mp4): Credenziali PS, caricamento dll .NET

- come condividere codice tramite GitHub e  MS Teams IT@Unipisa tramite notepad Sviluppo
- vista a repository GitHub formazione <https://github.com/Unipisa/PowerShellTraining>
- vista a notepad Sviluppo dentro il Team IT@Unipisa con breve descrizione e link al Gist su GitHub
- vista a Gist su GitHub
- vista documentazione PowerShell ovvero PowerShell Reference: Get-Member, note sul pipelining
- credenziali:
- PS si è evoluta per chiedere le credenziali federate che richiedono un browser per autenticarsi
- Get-Credential fa la richiesta di credenziali in modo sicuro e le mette in un oggetto
- La password è memorizzata come SecureString crittografia con chiave dipendente dalla macchina utilizzata
- È un meccanismo per migliorare la sicurezza delle password tramite gestione dei permessi dei files
- La password come SecureString ConvertFrom-SecureString (ho una SecureString e voglio la string) dalla credenziale.Password. Si ottiene una rappresentazione testuale della password che può essere messa in chiaro insieme a l'utente in uno script in modo sicuro.
- Ci sono script (più standard) che richiedono una SecureString, ci sono script più vecchi che la vogliono come rappresentazione testuale. Non è un hash è totalmente invertibile (sulla stessa macchina).
- Per riottenere le credenziali dopo aver una rappresentazione testuale della secure sting ConvertTo-SecureString (ho una stringa e voglio ottenere la SecureString)
- Avendo un oggetto di tipo SecureString e riottenere la rappresentazione in chiaro [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($spwd)) . La SecureString viene crittografata in memoria e tenuta per essere decifrata solo al momento dell'uso in modo che attacchi alla memoria del processo non leggano la password in chiaro. L'unico modo per avere la password in chiaro è quella di avere accesso allo script e alla macchina su cui è stata generata la SecureString di cui nello script c`è la rappresentazione testuale. Da usare solo se le API che si usano non hanno la possibilità di prendere Credential.
- Esempio di script utilizzato per inviare email per CRUI con Send-MailKitMessage che prende credenziali già crittografate con -Credential
- Per assemblare le credenziali: (1) $uid (2) $spwd da get credential e incollo il `.password` (3) `$cred = New-Object System.Management.Automation.PSCredential ($uid, $spwd)`
- Credential ha quindi il vantaggio
  (1) di avere le credenziali crittografate in memoria
  (2) di poter mettere la versione testuale della pass crittografata nello script in sicurezza (se si copia lo script non si ha accesso alla password)
- Il modo per vedere se una API prende le credential è Get-Help \<comando\> per vedere i tipi (che possono essere PSCredential, SecureString o string)
- Richiamo a come si specificano i tipi tra quadre come visto in <https://github.com/Unipisa/PowerShellTraining/blob/main/azuread.ps1>
- Sintassi per chiamare dll del runtime di .NET e ispezionare i metodi tramite reflection
- Esercizio di stampa di una credenziale decifrata
- chiamata del metodo .GetType() - tutti gli oggetti PS essendo oggetti .NET hanno il metodo
- [nome del tipo]::metodo statico.Funzione - es [System.DateTime]::Now.AddDays(1).ToString("yyyy-MM-dd")
- come trovare documentazione su .NET (ricercare con keyword C#)
- Creazione windows forms da PowerShell
- Necessità di caricare l'assembly di windows forms con Add-Type "System.Windows.Forms" passandogli la path oppure, per gli assembly di sistema gli do il nome e lui lo va a cercare con [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
- È possibile aprire e chiudere la form con $form = new-object System.Windows.Forms.Form; $form.Show(); $form.Close()
- In realtà c'è bisogno di avviare il thread di gestione degli eventi
- Il punto è che si può caricare qualunque dll .NET

## [09/04/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Ciclo%20di%20seminari%20su%20PowerShell-20210409_120329-Registrazione%20della%20riunione.mp4): Remoting PowerShell

- limiti su unix (al momento) ma vantaggi dovuti ad integrazione cloud, sintassi discutibile ma programmazione più strutturata dei linguaggi di scripting tradizionali unix, stabilità dato che i cmdlet sono integrati nella shell e quindi mantenuti
- amministrazione remota con powershell - remoting di powershell. Windows è diventato ssh friendly solo di recente - dal 2016 si può installare senza interfaccia grafica, core edition. Il remoting di ps è nato per questo. L'autenticazione remota si può fare con meccanismi di kerberos e si porta dietro di dover conoscere tutte le capabilities dei ruoli.
- abilitare il remoting della powershell: per default su i server è attivo e si usano le credenziali active directory. enter-pssession \<nome server\> - usa il token kerberos, equivalente di autenticazione con chiave ssh
- sconfig non lo fa fare perché non apre una console remote ma fra streaming dei comandi quindi non supporta un interfaccia grafica a console
- parentesi su sconfig: utility server config per configurare un server core edition. Offre tutti gli strumenti : join dominio, cambiare nome computer, aggiungere amministrazione, configurare amministrazione remota, remote desktop, impostazioni di rete interamente a console. È fatto in windows scripting quindi tutte le funzioni possono anche essere chiamate direttamente da console. Esempi di indagine su schede di rete su una macchina remota.
- mi posso collegare a una macchina linux e fare le stesse cose ma usando i comandi di sistema anziché i cmdlet: il vantaggio rispetto a a farlo in modo tradizionale con ssh è che poi, come output, abbiamo oggetti power shell anziché stringhe.
- select-string (vs select-object o select che è un alias) si possono fare pattern match sul piping di stringhe.
- `\$_` è l'oggetto corrente quando si scorre un oggetto enumerabile (ad esempio in `| where {$_.<campi> -match <regex>}` dove dietro cè un foreach)
- foreach-object se voglio iterare e restituire un oggetto e posso con in -Replace posso anche modificare le cose altre che fare matching
- fare remoting è comodo per collegarsi al pc di un utente - se ha fatto join al dominio - (stile ssh ma mantenendo i layer di sicurezza - a meno di non cambiare utente con cacls.exe = Change Access Control Lists) guardando log o lanciando comandi
- Invoke-Command -ComputerName \<nome\> -ScriptBlock {ls} = equivale a lanciare un comando remoto. Il comando remoto però restituisce gli oggetti (tramite marshalling) e posso usali localmente (al contrario di ssh che restituisce stringe).
- Comodo perché posso fare il foreach di un comando su n server: 1 .. 9 | foreach-object -Process { Invoke-Command -ComputerName cn0$ -ScriptBlock {ls}} . Il risultato è l'unione di tutti i comandi (mentre con ssh ho il problema di mettere insieme le stringhe restituite).
- È possibile fare il remoting parallelo con -Parallel sulla foreach-object, ovvero:  1 .. 9 | foreach-object -Parallel -Process { Invoke-Command -ComputerName cn0$ -ScriptBlock {ls}}
- La parte della sicurezza di PS è molto complicata; spesso si finisce per fare senza
- PowerShell remoting over SSH; originariamente si usa winRM (windows remote management) - SSH non supporta tutta una serie di funzioni (non essenziali, tra cui il sandboxing) - È possibile fare Get-Command New-PSSession passando una chiave ssh. Esiste una guida ufficiale per installare il server SSH su windows. È supportato ufficialmente come feature di windows. Per installarlo si una Get-WindowsCapability in stile packet manager. Get-WindowsCapability -Online | ? Name -like 'OpenSSH'. Poi Add-WindowsCapability -Online -Name OpenSSH.Client o Server
- Ci sono delle limitazioni (es: il sudo non va su linux, non ha accesso a $profile), ma verrà sviluppato perché cè grande interesse in quanto consente di gestire con uno strumento solo macchine sia windows sia linux sia mac.  
- Il remote command è molto utile per mettere insieme i log di N server: ad esempio per vedere il log di exchange: esempio di consultazione di codice per consultare log relativi alla posta.
- Connessione a uno degli 8 nodi di exchange server.
- Get-Mailbox `<utente>` per ottenere l'oggetto che corrisponde alla mailbox di un utente. con
- Get-MailboxStatistics ottengo le statistiche.
- Get-MessageTrackingLog per i log dei messaggi; esegue su un singolo server. È necessario lanciarlo con una foreach su ogni server
- Esempio di codice usato per migrare la posta:
- WinnerSelection: seleziona 5 utenti per polo
- Caricamento supporto exchange
- SimpleSQL: consente di collegarsi a molti database, qualche cmdlet, restituisce oggetti con cui si può fare pipelining
- System.DirectoryServices.Protocols che è l'implementazione .net di LDAP (esempio traduzione codice da c# a PS)
- creo le credenziali come NetworkCredential
- faccio il binding e faccio la search request con il search scope che mi interessa
- per ciascun oggetto della entry LDAP mi faccio un PSCustom object con solo i campi che mi interessano
- creo una mail html e la mando ad i 5 selezionati
- esempio di OpenMysSQLConnection e Invoke-SQLUpdate
- cambio di attributo LDAP

## [16/04/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210416_103809-Registrazione%20della%20riunione.mp4): Pattern di programmazione PowerShell

- powershell come integrazione di applicazioni: via di mezzo tra sviluppo e attività sistemistica
- paradigmi di programmazione:
  - programmazione imperativa: c, si da soluzione ad un problema mediante modifiche successive ad uno stato condiviso
  - programmazione ad oggetti: scambio di messaggi tra oggetti che mutano il proprio stato interno
  - programmazione funzionale: si decompone il problema in una serie di applicazioni di funzioni che per loro natura sono non mutevoli, non hanno un proprio stato interno. Le funzioni sono valori che e possono essere applicate da altre funzioni
- tutti i linguaggi odierni hanno introdotto elementi di programmazione funzionale (high order function): powershell ha elementi di programmazione funzionale. Non si scrivono più i while, si definisce uno schema di iterazione e il corpo si passa come argomento (gli schemi sono sempre gli stessi quindi non si scrivono)
- analisi codice usato per raccolta dati su partecipazione progetto sviluppo anticorpi - in 10 righe in una shell con oggetti nativi, si può scaricare sulla shell il compito di fare parsing e esportazione (marshalling e unmarshalling - convertTo e convertFrom):
  - si crea una microsoft form che riconosce l'utente: da un foglio excel con dati utente e due checkbox
  - importo dati csv (Import-Csv) in oggetti powershell; creo un dizionario (posta elettronica -> oggetto) - come prassi consentiamo di rispondere più volte, l'ultima è quella che vale. Gli oggetti forms sono $_."Testo della domanda"
  - scorro i valori e tramiti pipelining = tratto della programmazione funzionale: scorro i valori e li trasformo passando il risultato alla prossima funzione; entrano oggetti, escono credenziali, il resto lo butto
  - per ogni credenziale faccio un Invoke-RestMethod per chiamare un api rest passando sugli header un beamer token (un secret che è possibile far scadere). Il rest metodo (contrariamente a invoke http che ritorna l'html) assume che il risultato sia json e lo parsa in oggetti powershell. chiamo il servizio anagrafico di Ateneo
  - scorro i risultati e gli esporto in csv con tutti i dettagli anagrafici
- esempio di creazione di un oggetto [v = [PsCustomObject]{ e passo dizionario} ] e convertToXml (campo OuterXml) e convertFrom (tramite cast [xml])
- prossimamente pubblicato il portale delle API di Ateneo (Borgioli e Bianchi)
- Uso di Powershell attaccata ad un processo in modo da avere l'output del processo come oggetti (ridirezione di output come ridirezione di pipe di oggetti anziché pipe di byte) - GetProcess, Stop-Process, Start-Process, Wait-Process, Debug-Process, operatori > e >> - Stop-Process -Name consente di killare i processi su unix senza passare dal pid.  Start-Process equivalente a run in background (&)
- Gestione dei servizi (di windows ad ora) con Get-Services
- Concetto di PowerShell Drives- Get-PSDrive: contrariamente a unix dove tutto è un file, su windows essendo orientato a gli oggetti è possibile avere dei drive che puntano ad altro (esempio: certificati, variabili di ambiente, il registry di windows). È possibile creare drive con New-PSDrive. Per quello c`è Get-ChildItems invece di dir, perché si enumerano cose varie, non necessariamente files. Ogni drive ha un provider; possono essere dischi, registry, . Con Set-Location HKLM:Software mi ritrovo a spostarmi dentro il registri.
- Altri meccanismi negli esempi : lavorare con le stampanti windows, rete, lavorare con l'output, dev null, Out-Printer - genera anche un pdf, Out-File -FilePath con i vari format si può cambiare il formato
- Set-PSDebug consente di mettere breakpoint,il trace , lo stepping

## [23/04/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210423_120252-Registrazione%20della%20riunione.mp4): Espressioni regolari

- espressioni regolari definizione formale e cosa si può fare (con focus dentro visual studio code)
- spesso consente di lavorare con l'editor senza scrivere codice - spesso lo la pigrizia nel non voler fare lo sforzo di capire e creare correttamente un espressione regolare si paga con ore di copia/incolla; una cosa è l'impegno un cosa è la produttività)
- utili anche in powershell. per motivi storici (pre- PEARL) la shell unix ha espressioni regolari più limitate = linguaggi regolari
- la definizione delle regex ha a che fare con la teoria dei linguaggi e delle grammatiche. Uno dei primi problemi in informatica era darà una semantica ad i linguaggi di programmazione, il più delle volte nati dell'implementazione. Automi - meccanismi automatici di verifica  dell'appartenenza ad un linguaggio di un testo.
- esempio di sessione di lavoro tramite regex in vscode
- i regex hanno lo scopo di definire in modo generativo degli insiemi di stringe di un linguaggio
- esempio: il linguaggio dei codici fiscali sintatticamente validi : 3 lettere cognome, 3 lettere nome, 2 cifre anno, 1 lettera mese/sesso, 2 cifre giorno, 1 lettera seguita da 3 cifre - codice Belfiore del comune, 1 lettera codice di controllo
- definiamo un alfabeto; dato un alfabeto possiamo usare alcune operazioni per generare tutte le possibili stringhe;
- le operazioni sono:
  - l'ALTERNATIVA "|" - or = unisce due linguaggi differenti,
  - la SEQUENZA "." = prima uno di tutte le stringe di un linguaggio seguita da una di tutte le stringhe di un altro linguaggio,
  - la RIPETIZIONE 0 o più volte "\*" = l\* è l'insieme vuoto, oppure l.l, oppure l.l.l ecc = 0 o più volta la concatenazione di l - stella di Kleene,
[la RIPETIZIONE 1 o più volte "+" ]
- nelle shell se si usa "\*" è una contrazione (\<qualsiasi_cosa\>*); a* = a seguito da qualsiasi cosa, 0 o più volte
- per i linguaggi regolari è possibile generare un automa che gli identifica. I linguaggi regolari non sono turing equivalenti  (pumping lemma) = con i linguaggi regolari si possono generare solo programmi che fanno uso del for e non del while. Sono meno espressivi delle grammatiche. Esistono dei linguaggi generabili da grammatiche che non possono essere riconosciti utilizzando i linguaggi regolari.
- non è possibile fare un espressione regolare (linguaggio regolare) che riconosca il bilanciamento delle parentesi - necessario al tokenizer, primo passo della compilazione dei linguaggi di programmazione
- awk consente di trasformare stringhe, uno stream di caratteri e sostituirlo con un altro stream di caratteri; perl nasce da awk sorpassando i suoi limiti, poi è stato sorpassato anche esso perché i linguaggi di scripting sistemistico si sono evoluti verso i linguaggi di programmazione
- riconoscimento greedy (ingordo) dei linguaggi regolari: riconosce la parte più grande possibile. Se uso .* arriva sempre in fondo al file.
- Sintassi delle regex su vscode:
  - a : carattere a
  - . : qualsiasi carattere (di default non match il ritorno a capo; si ragiona una linea alla volta)
  - [ab] : o il carattere a o il carattere b = un carattere nell'insieme specificato da [] = classe di caratteri
  - normalmente sono case sensitive
  - [a-z] : un carattere nell'insieme di tutti i caratteri dalla alla z; [a-zA-Z0-9] un carattere tra i carattere alfabetici minuscoli o maiuscoli o una cifra
  - \w : word, parola, senza spazi
  - \s : spaces, spazi (spazio, a capo, tab)
  - \d : decimals=, numeri
  - `\\`, `\[`, `\]` : caratteri "\\", "[" e "]"
  - \S : not spaces: tutto tranne spazzi
  - nelle classe dei caratteri il ^ significa not, esclude es [^ab] = non a o b
  - a|b = composizione di regex in alternativa = il carattere a o il carattere b
  - ab = sequenza (associa di più di alternativa - ab|bc != a(b|b)c )
  - lo spazio è un carattere, non possiamo mettere spazi
  - a* = zero o più volte a
  - a+ = una o più volta a
  - a+? o a*? = il più piccolo match; introdotto da Pearl
  - a{min,max}, a{5} = esattamente 5 a , a{2,} = minimo 2 a ma quante ne voglio, a{,5} = da 0 a 5 a, a{2,5} = da 2 a 5 ab
  - (^ inizio riga,) $ fine riga, per assicurarsi che sulla riga non ci sia altro
  - esempio di utilizzo di regex su vscode: mostra in tempo reale i match.
  - match codice fiscale e cattura dell'anno: se metto le parentesi per individuare una sottoespressione il sistema gli da un numero e lo recupero con `$1` - `[A-Za-z]{6}(\d\d\)[A-Za-z]\d\d[A-Za-z]\d{3}[A-Za-z]` sostituito con $1 ritorna il codice fiscale
- trasformazione di una estrazione da db in un array di oggetti powershell
- in powershell -match -imatch per la condizione di soddisfare regex case sensitive e case insensitive rispettivamente
- in perl o javascript le regex si scrivono tra  / /, con i si leva il case sentivi, con s si controlla il single line

## [07/05/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210507_120423-Registrazione%20della%20riunione.mp4): Docker e containers

- tecnologia docker e containers:  oggetto semplice, difficile capire quando si usano e quando no;
- un container si base sul concetto di cgroup del kernel linux.
- in generale, in un so, un processo p usando le syscall interagisce con il kernel (al cui interno ha strutture dati come la tabella dei processi, i file handle ecc) il quale espone tutte le risorse del sistema tabellizzate (in modo tale che una shell possa fare ps e vedere i processi in esecuzione). Il problema è sempre stato quello di non far abusare delle proprie risorse: impedire che possa killare, accedere a file o risorse non consentite, ma le tabelle del kernel sono sempre state leggibili al processo. Questo è un problema per quanto riguarda la sicurezza perché analizzando le tabelle del kernel è possibile capire cosa è in esecuzione e trarre informazioni da cui trarre vantaggio in modo malevolo.
- chroot storico comando che consente di esporre al processo anziché la root un altro path come root facendo vedere un filesystem diverso ad ogni processo. molto popolare nel mondo del web per impedire che il web server veda il filesystem della macchina e quindi non possa accedervi. chroot per molto tempo considerato sufficiente perché su unix tutte le risorse sono astratte come files. gli attacchi si sono evoluti e anche vedere solo la lista di processi è risultato un problema consentendo attacchi tipo side channel; usare effetti indiretti per dedurre informazioni sullo stato di un elemento di calcolo si può fare dal livello di so fino al processore (spectre e meltdown): si possono eseguire sequenze di istruzioni che forzano il processore a scrivere dati in certe zone e poi cercare di leggere (spectre e meltdown a che vedere con il design intrinseco dei processori iperscalare).
- cgroup nasce come generalizzazione di chroot: è possibile assegnare ad ogni cgroup i diritti di lettura ad una parte delle risorse tabellare ed inibirne altre. ogni processo appartenente ad un cgroup eredita queste restrizioni - il resto è come se non esistesse. si può costruire una proiezione dello stato del kernel che nasconde parte delle risorse in dotazione al so, ed in particolare la parte dei processi.
- tratto essenziale è dei container è il meccanismo del cgroup
- i container non sono linux only: su windows ce ne sono 2 tipi - o usando i container linux usando il linux subsystem - o usando i container di windows
- i container su windows sono implementati in modo interessante. Il kernel di win nasce fine anni 80 con esperienza di unix già nota (Dave Cutler di digital) con windows nt, molti dei concetti della sicurezza legati a so digital (oltre al backslash). (Inizialmente non era a kernel monolitico ma a micro kernel - poi dato che i se si schiantava qualche micro kernel fondamentale bisognava fare reboot, tanto valeva un kernel monolitico.) Ha il kernel il cui funzionamento è molto simile a quello di linux ma sopra ha i subsystem. Un processo nasce collegato ad un sottosistema (nei descrittori del processo); il ruolo del sottosistema è tradurre le chiamate del processo a chiamate al kernel. Questo perché si cercava lo standard posix, nato per omogenizzare i so unix. Il grosso su windows è il sotto sistema win32 che implementa le api di windows. NTFS è case sensitive ed è compito dle subsystem win32 trasformarli in case insensitive - se un processo usa il subsystem unixServices può creare due files con case diverso che appaiono agli utenti come con lo stesso nome. I container windows non è implementato come subsystem unix perché un grosso problema dei subsystem è una parte di risorse non è visibile tra un subsystem e un altro e ad esempio se voglio creare un sistema a finestre su subsystem unix non è visibile a win32. Per implementare cgroup su windows si utilizzano più istanze del subsystem win32. Questo implica che il processo vede un kernel unico (Vs macchine virtuale - un kernel per vm).
- Le API dei kernel sono stabili; possono esserci aggiunte per i drivers. Il processo non chiama mai il kernel, interagisce o con runtime del linguaggio o utilizza librerie .so .dll che fanno le chiamate al kernel. Gli aggiornamenti del sistema operativo avviene a livello di librerie che si interfacciano con il kernel non all'interno del kernel, con numerosi vantaggi. I vari flavour di linux differiscono per queste librerie e per la struttura del filesystem. Il container può cambiare le librerie dinamiche, mantenendo la semantiche delle chiamate al kernel, e consentire a due container di vedere il mondo - ciò che è percepito come sistema operativo- come distribuzioni diverse. Anche il sottosistema unix di windows utilizza lo stesso meccanismo.
- Il secondo ingrediente dei container è un filesystem differenziale: al filesystem di base ci attacco delle differenze (aggiungo e cambio delle parti). Il container, che coincide con il file che lo contiene, introduce un filesystem differenziale - ogni implementazione ha usato una tecnologia differente. per i dischi - il formato di immagine - esiste uno standard, un formato comune.
- docker non è l'unico: es docker se si blocca il servizio coordinatore di container si blocca tutto - per coreos, rocket, i container continua a funzionare anche senza coordinatore. L'immagine di un container non è efficiente.
- Le prestazioni del disco dell'immagine del container sono pessime e non vanno bene per la produzione. Il container ha la possibilità di montare un mount point del filesystem locale con performance di scrittura ordinarie, senza overhead tipico delle macchine virtuali.
- I containers non hanno overhead delle vm, al costo di un minore isolamento / protezione da attacchi side-channel (es. vm si può mettere in pausa, il container può provare a stressare la cpu per capire il carico della macchina, può fare delle chiamate per vedere come il sistema risponde. Spesso le cose vengono usate insieme - vm per isolamento e container per minor costo per servizio. Si usa spesso un mix-and-match. Ad esempio nella gestione della rete, i container, non avendo un virtual switch, condividono lo stesso ip sullo stesso host: finché sono client non ci sono servizi, se invece erogano servizi si pongono tutti i problemi relativi ad erogare servizi dietro un NAT.
- Si sono molto diffusi anche perché consentono di portarsi dietro uno stack software, e quindi far coesistere stack software diversi sullo stesso kernel. Inoltre grazie al fatto che le immagini hanno un formato standard di costruire repository di immagini, come i packet manager ma con granularità enorme. Diventa una sorta di installer. Grazie al mount dei dati l'aggiornamento risulta molto semplice, dovendo sostituire solo un immagine.
- Docker su windows; quello con linux subsystem 2 usa un kernel hyper-v
- Dockerhub, immagini disponibili, immagini ufficiali
- esempio di applicazione interessante 1 : mybinder : progetto open supportato da Google (eseguito gratuitamente su google cloud). Un modo per eseguire container assemblandoli da Git.
- esempio di applicazione interessante 2 : schedulare più containers (google kubernetes, wm-ware tamzu ecc) ovvero runtime che consente di schedulare container su un cluster
0- esempio di dockerfile, ovvero set di istruzioni per assemblare un immagine di container
- in ambiente accademico utile in ambiente di sviluppo per agilità spostamento multi piattaforma e velocità deployment, in ambiente di supporto alla ricerca in modo che ognuno si porti il suo stack senza pestarsi i piedi a vicenda, in ambiente di gestione di aule di laboratorio per lo stesso motivo

## [14/05/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210514_120548-Registrazione%20della%20riunione.mp4): Docker e containers: debug

- container come filesystem differenziale con visione limitata delle risorse del sistema; assomiglia ad una macchina virtuale anche se meno isolato. spesso usato insieme a vm. utilizzo container bare metal su hpc (altre tecnologia come singularity). Sta diventando un sostituto degli installer (installare con dipendenze e disinstallarlo in modo idempotente).
- sviluppo di container con debugging con microsoft. Il container presenta delle difficoltà (efficiente l'accesso al disco aggirabile tramite il mount - stesso vale per le porte, arginabili tramite nat): il debug in quanto in un insieme di librerie completamente differenti dalla macchina su cui ospiti.
- Creazione progetto di web application C# con VisualStudio dentro docker linux (su host windows).
- Docker for windows e Linux subsystem
- Esecuzione e debug. Andando nella GUI di docker for windows vedo il container in esecuzione e lo posso ispezionare e collegarmi. Nella finestra di visualstudio vedo le porte e il filesystem. Visualstudio Si configura come debugger remoto rispetto alla macchina nel container: posso mettere breakpoint, fermare l'esecuzione.
- Accenno a swagger e consumo di api tramite powershell
- Meccanismo container first: invece che ricreare il container ad ogni sessione di debug i sorgenti vengono montati nel container.
- Concetto di entry point dei container, concetto di versione e di immagine differenziale, analisi del dockerfile e della costruzione del container : workdir, porte esposte, - prende il runtime di asp dotnet e lo chiama base, prende immagine del sdk e lo chiama build, copia il progetto nel container esegue il processo dotnet restore e dotnet build (il container è un albero di processi). Chiamo il build come publish ed eseguo dotnet publish per assemblare l'applicazione web (buttando i file intermedi e tenendo solo i binari). Prendiamo base e ci copio la directory publish dal container publish. Poi butto i container intermedi che non servono più. Imposto entry point dotnet con la dll creata dai sorgenti.
- analisi docker file di dotnet interactive <https://github.com/dotnet/interactive> per la creazione di notebook JupytherHub  
- esempio di assemblaggio ed esecuzione manuale del container creato da visualstudio

## [21/05/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Ciclo%20di%20seminari%20su%20PowerShell-20210521_120852-Registrazione%20della%20riunione.mp4): Storia .NET

- Powershell per controllo files caricati da eligere: lettura files, misura ed esportazione su csv
- Commenti su exploit di hypervisor di hyperV e active directory. Scritto in powershell. Sfrutta backdoor per lanciare powershell e aprire una backdoor ad un sistema che faceva mining. Bloccava rcp e dcom. Powershell anche per decodificare attacchi windows based.
- Storia di .NET di 25 anni. Novembre 1996. Nasce per aggirare causa per JVM Microsoft. COM e Object Linking and embedding e tentativi di emulazione in ambito linux. Performance dei linguaggi di programmazione (espressività vs performance). Bytecode vs compilato vs just in time compiler. MS aveva modificato Java per esportare COM dentro Java, in che rompeva la missione di Java di essere portatile multi piattaforma. Storia della nascita di Java e Javascript. Ritorno del problema della multi piattaforma (arm - x86) e dell'interesse per i linguaggi con bytecode multi piattaforma vs linguaggi interpretati. .NET vs Java per invocazione di librerie esterne native della piattaforma. Digressione su linguaggi Perl, Python, Visual Basic, Fortran. Unity: prende implementazione open source dotnet mono. MS perde monopolio del client (Apple e Android) non riesce più a garantire la piattaforma (codice su windows runs forever); per continuare a garantire la piattaforma investono su dotnet - codice dotnet runs forever. Virare verso open source. Reboot della piattaforma: dotnet core, open source multi piattaforma, staccato anche come gestione politica dall'azienda ,migrazione  dei principali progetti (winforms, WPS, ASP.NET)
- Download SDK e Runtime; VScode
- setup di un applicazione web dotnet. comando dotnet. C# e F# e CLR. restore e nuget.org. Esempio di metodo esposto tramite web con kestrel. Strutture di tipo dichiarativo: non ho la responsabilità di garantire l'integrità dell'esecuzione. Inferenza di tipo anche su C#.

## [28/05/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210528_121350-Registrazione%20della%20riunione.mp4): Servizi web .NET

- reboot open-source piattaforma .NET e motivi della scelta come piattaforma di sviluppo (maggior produttività e condivisione)
- problematiche attuali sviluppo web
- come fare un servizio web con .net (template disponibili: grafica nativa, unit testing, razor/codewaver frammenti html+codice, MVC, blazor - tecnologia client side, ASP.NET e universo di ecosistemi collegato)
- creazione web api (dotnet new web api) - dotnet build - dotnet run per far partire il web server kestel
- web api come sottoinsieme MVC ha solo controller non il le viste e il modello
- classe di startup che ha dei servizi (alcuni parte di asp dotnet core, altri si possono aggiungere); cè lo swagger
- analisi del weather webcast controller
- overview su codice .net: - classi come algebra = dati + operazioni su dati; - annotazioni - [httpget] che trasforma il metodo in qualcosa che può essere invocato tramite web
- Rotta `<Nome>Controller` come `/<Nome>` che restituisce il dato - la get la trasforma la richiesta nel invocazione di un metodo
- swagger per recuperare informazioni sulle api secondo standard openApi /swagger/swagger.json e /swagger/index.html per l'interfaccia grafica di swagger
- mi concentro sul comportamento (il metodo) mentre il runtime genera gli strumenti - ora integrati nel runtime invece di usare strumenti esterni
- creazione e anatomia di un app MVC - Modelli (struttura di un dato) , Viste (resp della visualizzazione) , Controller (definisce le azioni che trasformano il modello che poi viene proiettato sulla vista) - wwwroot per la parte statica - stesso startup di web api ma con cose differenti: autorizzazione, routing (mappa url a codice scritto- default come `<nome controller>/<nome metodo>/<parametro/>` - alcuni metodi restituiscono una vista: un frammento di html con razor (stile php ma possibilità di for annidati) - meccanismi di templating: layout standard e renderbody, dizionario view_data
- primo sguardo a <https://github.com/Unipisa/eligere>
- accenno containers e kubernetes

## [11/06/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Riunione%20in%20_Formazione_-20210611_122736-Registrazione%20della%20riunione.mp4): Caso di studio: Eligere

- template di default di dotnet: appsettings.json, dove si mettono le configurazioni dell'applicazione con possibilità di avere delle impostazioni per sviluppo e per produzione
- inizio analisi codebase di eligere: file con la struttura del db, file .sln, file di progetto csproj - spiega come compilare il sorgente, accenno a unit test e importanza per regressione (controllo dopo modifica che tutto funzioni sempre); particolarmente importante per sviluppo a micro servizi
- 2 progetti principali election_system e voting_system, guardiamo election_system
- startup, session (stato tramite scambio cookie con il client) e application (stato condiviso tra moduli - qui assente perché indipendente dallo specifico web server), localization (file razor in più lingue), il MVC (model view controller), autenticazione con openId con istanze specifiche per autenticazione multi tenant con Azure, db context - rappresentazione in oggetti del db
- controller (home/index come default)
- utilizzo dei ruoli: cambia il menù a secondo dei ruoli this.User.IsInRole
- intro a Linq (mappare triangoli - classi - in quadrati - tabelle db) e oggetti anonimi
- tuple in c#
- accenno async
- pattern dichiarativi: leggibilità del codice per open source e possibilità di essere ispezionato da terze parte
- annotazioni Authorize per scaricare su runtime la gestione della sicurezza
- programmazione generica: trasformazione query in dizionario

## [09/07/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Ciclo%20di%20seminari%20su%20PowerShell-20210709_123511-Registrazione%20della%20riunione.mp4): Caso di studio: Eligere - MVC, ORM e accesso ad i dati

- modello di accesso ad i dati in MVC per servizi di Ateneo
- implementazione (ORM) Object Relation Manager (oggetti in memoria degli oggetti in database) di .net: non si scrive più SQL vantaggi di sicurezza
- utilizzo di entity framework in eligere: driver model per linq - si scrive linq, viene generato l'albero di sintassi astratta e viene passato ad un provider di db; generazione di codice da tool che si collega al db e genera il mapping tabelle db/classi - dotnet e db context scaffold `<stringa di connessione>` (scritto nel readme updateDBSchema.txt)
- studio controller; gli viene passato il db context dallo startup generato dallo scaffolding
- sintassi e funzionamento LINQ: l'albero sintattico delle query può essere applicato anche non al db ma ad oggetti in memoria
- oggetti anonimi in C#
- operazioni fatte in memoria con caching fino a save changes in cui vengono inviate le modifiche al db (evita di stressare il db)
- alternativa al database: <https://github.com/facebook/rocksdb> - hashtable persistente per avere su disco una tabella hash - consente di memorizzare in modo persistente oggetti sul disco
  
## [23/07/2021](https://unipiit.sharepoint.com/sites/ITUnipisa/Shared%20Documents/Formazione%20sviluppo/Recordings/Ciclo%20di%20seminari%20su%20PowerShell-20210723_120721-Registrazione%20della%20riunione.mp4):  Caso di studio: Eligere - Programmazione dichiarativa, marshalling e unmarshalling

- meta programmazione su codice di Eligere
- encrypted (c++ in javascript)
- passaggio di funzioni ad altre funzioni
- meccanismi di caricamento dinamico per funzioni del framework/runtime
- marshalling e unmarshalling (dato strutturato <-> dato consumabile - testuale)
- compilazione in bytecode mantenendo la struttura del sorgente: demo di ILDASM e utilizzo della reflection per leggere le annotazioni del codice stesso; comportamenti non funzionali del codice utilizzando le librerie e le annotazioni
- async/promises e programmazione asincrona; programmazione non rientrante; gestione trasparente da parte del runtime
- creazione di API tramite an annotazioni (url come data model)
- programmazione dichiarativa: si dichiara cosa si vuole fare, come viene fatto è delegato al runtime che sono runtime standard
- viste cshtml con filosofica razor: si sposta lo stato, l'interfaccia dell'applicazione sul client, tutta l'interazione con il server avviene tramite api - si usano token per invocare le api in modo sicuro
