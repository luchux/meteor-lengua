#Given  a word return a list of pictures for the word
getImages = (word) ->
    key = "ae4e7c05462760fee4495f4953d36d36"
    secret = "b8d3dd37d9b2af87"
    query = word || 'bmw'

    iURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{key}&tags=#{query}&per_page=3&format=json&nojsoncallback=1"

    picturesArray = []

    result = HTTP.get iURL

    if result.statusCode is 200
        content = JSON.parse(result.content)
        array_pics = content.photos.photo

        _.each array_pics, (val, key) ->
            console.log val, key
            id = val.id
            farm = val.farm
            server = val.server
            secret = val.secret

            url = "http://farm#{farm}.static.flickr.com/#{server}/#{id}_#{secret}.jpg"
            picturesArray.push(url)

        console.log(picturesArray)
        return {success:picturesArray,error:false}

    else
        console.log 'error: ', error
        return {error:true}


getImages2 = (word) ->
    iURL = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{word}"
    console.log('looking to URL: ',iURL)
    result = HTTP.get iURL
    picturesArray = []

    if result.statusCode is 200
        content = JSON.parse(result.content)

        try
            _.each content.responseData.results, (val, key) ->
                picturesArray.push(val.url)

            return {success:picturesArray, error:false}
        catch e
            return{success: [], error:false}
    else
        return {error:true}


BASIC_WORDS = [
     "der Schauspieler"
     "schwarz"
     "Ton"
     "die Krankheit"
     "das Adjektiv"
     "blind"
     "sauberen"
     "Der Arzt"
     "die Erwachsenen"
     "das Blut"
     "sauberen"
     "der Hund"
     "die Katze"
     "Der Nachmittag"
     "blau"
     "Die Uhr"
     "Der Dollar"
     "die Luft"
     "Das Boot"
     "Schließen"
     "die Tür"
     "Der Flughafen"
     "Der Körper"
     "Kleidung"
     "der Punkt"
     "lebendig"
     "der Knochen"
     "The Club"
     "die Lage"
     "down"
     "das Tier"
     "Das Buch"
     "Der Mantel"
     "zeichnen"
     "Die Wohnung"
     "die Flasche"
     "der Kaffee"
     "Der Traum"
     "Der Apfel"
     "unten"
     "Kälte"
     "das Kleid"
     "April"
     "die Box"
     "die Farbe"
     "das Getränk"
     "trinken"
     "Arm"
     "Der Junge"
     "Der Computer"
     "der Antrieb"
     "Drive"
     "Die Armee"
     "Das Gehirn"
     "der Konsonant"
     "die Droge"
     "Die Kunst"
     "das Brot"
     "der Vertrag"
     "trocken"
     "Der Künstler"
     "brechen"
     "kochen"
     "Staub"
     "Der Angriff"
     "Das Frühstück"
     "cool"
     "das Ohr"
     "August"
     "Die Brücke"
     "Kupfer"
     "Die Erde"
     "Der Autor"
     "Bruder"
     "das Korn"
     "Der Osten"
     "das Baby"
     "braun"
     "Die Ecke"
     "essen"
     "hinten"
     "bauen"
     "count"
     "The Edge"
     "back"
     "Das Gebäude"
     "Das Land"
     "Das Ei"
     "schlecht"
     "brennen"
     "das Gericht"
     "Acht"
     "die Tasche"
     "Der Bus"
     "die Kuh"
     "achtzehn"
     "Der Ball"
     "buy"
     "Die Menge"
     "achtzig"
     "Die Banane"
     "der Kuchen"
     "cry"
     "Die Wahl"
     "Die Band"
     "Anruf"
     "die Tasse"
     "die Elektronik"
     "Die Bank"
     "Die Kamera"
     "gebogen"
     "eleven"
     "die Bar"
     "Das Lager"
     "Schnitt"
     "Die Energie"
     "Das Badezimmer"
     "Das Auto"
     "Tanz"
     "Motor"
     "The Beach"
     "die Karte"
     "dunkel"
     "Abend"
     "der Bart"
     "tragen"
     "Datum"
     "die Ausübung"
     "Beat"
     "die Katze"
     "Die Tochter"
     "teuer"
     "schön"
     "Fang"
     "Tag"
     "explodieren"
     "Das Bett"
     "die Decke"
     "tot"
     "Das Auge"
     "Das Schlafzimmer"
     "Die Zelle"
     "das Telefon"
     "taub"
     "das Gesicht"
     "das Rindfleisch"
     "Zentimeter"
     "der Tod"
     "fallen"
     "das Bier"
     "der Stuhl"
     "December"
     "fallen"
     "bend"
     "billig"
     "tiefe"
     "Die Familie"
     "das Getränk"
     "der Käse"
     "The Diamond"
     "berühmten"
     "das Fahrrad"
     "das Huhn"
     "sterben"
     "Fan"
     "groß"
     "groß"
     "das Kind"
     "graben"
     "der Lüfter"
     "The Bill"
     "Die Kirche"
     "Das Abendessen"
     "Der Bauernhof"
     "die Milliarden"
     "der Kreis"
     "die Richtung"
     "schnell"
     "der Vogel"
     "die Stadt"
     "schmutzig"
     "Vater"
     "2"
     "Februar-"
     "die Haare"
     "Die Küche"
     "Millionen"
     "füttern"
     "die Hälfte"
     "das Knie"
     "die Minute"
     "die weibliche"
     "die Hand"
     "das Messer"
     "Die Mischung"
     "das Aufsehen"
     "Fünfzehn"
     "hängen"
     "der See"
     "Montag"
     "fünfte"
     "Happy"
     "die Lampe"
     "Das Geld"
     "fünfzig"
     "harten"
     "Der Laptop"
     "Monat"
     "Der Kampf"
     "Der Hut"
     "Lachen"
     "Der Mond"
     "finden"
     "er"
     "der Anwalt"
     "der Morgen"
     "die Finger"
     "der Kopf"
     "das Blatt"
     "Die Mutter"
     "Das Feuer"
     "gesund"
     "lernen"
     "Der Berg"
     "erste"
     "hören"
     "links"
     "die Maus"
     "der Fisch"
     "fishing"
     "Das Herz"
     "das Bein"
     "der Mund"
     "fünf"
     "Wärme"
     "Die Zitrone"
     "Der Film"
     "die Wohnung"
     "der Himmel"
     "Der Brief"
     "Der Mord"
     "der Boden"
     "schweren"
     "Die Bibliothek"
     "Die Musik"
     "die Blume"
     "die Hölle"
     "Lüge"
     "down"
     "eng"
     "fliegen"
     "high"
     "Fahrstuhl"
     "Die Natur"
     "folgen"
     "der Hügel"
     "Hals"
     "das Essen"
     "das Loch"
     "Licht"
     "die Nadel"
     "der Fuß"
     "das Pferd"
     "das Licht"
     "der Nachbar"
     "der Fuß"
     "das Krankenhaus"
     "die Lippe"
     "Das Netzwerk"
     "Der Wald"
     "die heiße"
     "hören"
     ""
     "neue"
     "Die Gabel"
     "Das Hotel"
     "Ort"
     "Die Zeitung"
     "vierzig"
     "Stunde"
     "sperren"
     "nett"
     "vier"
     "Das Haus"
     "langen"
     "Die Nacht"
     "vierzehn"
     "Der Mensch"
     "lose"
     "neun"
     "vierte"
     "Hundert"
     "verlieren"
     "neunzehn"
     "Freitag"
     "der Mann"
     "laut"
     "neunzig"
     "der Freund"
     "I"
     "Liebe"
     "nein"
     "vorn"
     "das Eis"
     "niedrig"
     "The North"
     "Das Spiel"
     "Das Bild"
     "Das Mittagessen"
     "Die Nase"
     "Der Garten"
     "Zoll"
     "Das Magazin"
     "die Note"
     "das Papier"
     "das Benzin"
     "Die Verletzung"
     "männlich"
     "November"
     "Geschenk"
     "innen"
     "der Mann"
     "nuclear"
     "Das Mädchen"
     "das Instrument"
     "der Manager"
     "number"
     "das Glas"
     "Die Insel"
     "um die Karte"
     "das Meer"
     "go"
     "es"
     "März"
     "Oktober"
     "Gott"
     "Januar-"
     "Der Markt"
     "Das Büro"
     "Gold"
     "Der Auftrag"
     "Die Hochzeit"
     "das Öl"
     "gut"
     "Saft"
     "heiraten"
     "neue"
     "Großvater"
     "Juli"
     "das Material"
     "jung"
     "die Großmutter"
     "springen"
     "Mai"
     "Eins"
     "das Gras"
     "June"
     "mittlere"
     "offen"
     "grau"
     "Der Schlüssel"
     "die Medizin"
     "Orange"
     "grüne"
     "kill"
     "schmelzen"
     "das orange"
     "Der Boden"
     "Kilogramm"
     "The Metal"
     "außen"
     "wachsen"
     "The King"
     "Meter"
     "die Seite"
     "die Waffe"
     "Der Kuss"
     "die Milch"
     "3"
     "malen"
     "der Reis"
     "Sechs"
     "der Tee"
     "die Hose"
     "reich"
     "sechzehn"
     "lehren"
     "das Papier"
     "rechts"
     "sechzig"
     "Der Lehrer"
     "die Eltern"
     "The Ring"
     "Die Haut"
     "Das Team"
     "Der Park"
     "River"
     "der Rock"
     "die Träne"
     "der Pass"
     "Pass"
     "das Dach"
     "der Himmel"
     "Technologie"
     "Der Patient"
     "Das Zimmer"
     "Schlaf"
     "Telefon"
     "das Muster"
     "die Wurzel"
     "langsam"
     "Das Fernsehen"
     "bezahlen"
     "run"
     "klein"
     "kleine"
     "Temperatur"
     "der Frieden"
     "traurig"
     "riechen"
     "Zehn"
     "der Stift"
     "Salz"
     "smile"
     "Das Theater"
     "der Bleistift"
     "Sand"
     "Schnee"
     "sie"
     "die Person"
     "Samstag"
     "die Seife"
     "dick"
     "Die Fotografie"
     "Die Schule"
     "weichen"
     "dünn"
     "Das Stück"
     "die Wissenschaft"
     "der Boden"
     "Die Erde"
     "denken"
     "das Schwein"
     "der Bildschirm"
     "der Soldat"
     "dritte"
     "pink"
     "Meer"
     "Sohn"
     "dreizehn"
     "Das Flugzeug"
     "Die Saison"
     "Das Lied"
     "dreißig"
     "Die Anlage"
     "zweite"
     "The Sound"
     "Tausend"
     "Die Plastik"
     "zweite"
     "die Suppe"
     "drei"
     "die Platte"
     "Sekretär"
     "der Süden"
     "werfen"
     "Das Theaterstück"
     "Spiel"
     "sehen"
     "Donnerstag"
     "Der Spieler"
     "Die Saat"
     "sprechen"
     "sagen"
     "das Ticket"
     "die Tasche"
     "verkaufen"
     "der Löffel"
     "dicht"
     "das Gift"
     "September"
     "Der Sport"
     "Die Zeit"
     "Die Polizei"
     "Sieben"
     "die Feder"
     "der Reifen"
     "der Pool"
     "Seventeen"
     "das Quadrat"
     "der Zeh"
     "mangelhaft"
     "siebzig"
     "Fleck"
     "die Zunge"
     "Schweinefleisch"
     "stehen"
     "das Werkzeug"
     "das Pfund"
     "Sex"
     "Der Stern"
     "der Zahn"
     "Shake"
     "Der Stein"
     "top"
     "Der Präsident"
     "flachen"
     "aufhören"
     "Touch"
     "der Preis"
     "sie"
     "der Laden"
     "der Laden"
     "Die Stadt"
     "der Priester"
     "Das Schiff"
     "gerade"
     "Der Bahnhof"
     "das Gefängnis"
     "das T-Shirt"
     "The Road"
     "der Zug"
     "Die Station"
     "Programm"
     "die Schuhe"
     "starken"
     "Transport"
     "ziehen"
     "schießen"
     "der Schüler"
     "Der Baum"
     "drücken"
     "kurzen"
     "Zucker"
     "LKW"
     "The Queen"
     "kurzen"
     "Anzug"
     "Tuesday"
     "leise"
     "die Schulter"
     "Sommer"
     "Wende"
     "Das Rennen"
     "krank"
     "The Sun"
     "Zwölf"
     "Rasse"
     "die Seite"
     "Sonntag"
     "zwanzig"
     "das Radio"
     "schwitzen"
     "zwanzig"
     "Eins"
     "der regen"
     "das Zeichen"
     "schwimmen"
     "zwei"
     "red"
     "Silber"
     "das T-Shirt"
     "hässlich"
     "die Religion"
     "singen"
     "the"
     "Tisch"
     "Die Universität"
     "der Reporter"
     "die Schwester"
     "hoch"
     "up"
     "Das Restaurant"
     "sitzen"
     "Geschmack"
     "Tal"
     "Verb"
     "Die Uhr"
     "nassen"
     "das Holz"
     "Opfer"
     "Das Wasser"
     "Weiß"
     "Arbeit"
     "The Voice"
     "Die Welle"
     "breit"
     "die Welt"
     "der Vokal"
     "Wir"
     "die Frau"
     "schreiben"
     "der Kellner"
     "schwachen"
     "gewinnen"
     "Hof"
     "wake"
     "up"
     "Verschleiß"
     "Der Wind"
     "Das Jahr"
     "Spaziergang"
     "Die Hochzeit"
     "Das Fenster"
     "Gelb"
     "The Wall"
     "Mittwoch"
     "der Wein"
     "Ja"
     "Der Krieg"
     "Die Woche"
     "die Flügel"
     "Sie"
     "warm"
     "Gewicht"
     "Der Winter"
     "jung"
     "wash"
     "Der Westen"
     "die Frau"
     "Null"
]

BASIC_WORDS_EN = [
    "actor"
    "black"
    "Sound"
    "disease"
    "adjective"
    "blind"
    "clean"
    "Doctor"
    "adults"
    "blood"
    "clean"
    "dog"
    "Cat"
    "Afternoon"
    "blue"
    "Clock"
    "Dollar"
    "air"
    "Boat"
    "Close"
    "door"
    "airport"
    "Body"
    "Clothing"
    "Point"
    "alive"
    "Bone"
    "Club"
    "situation"
    "down"
    "beast"
    "Book"
    "Coat"
    "draw"
    "Apartment"
    "Bottle"
    "coffee"
    "Dream"
    "Apple"
    "bottom"
    "Cold"
    "dress"
    "April"
    "Box"
    "color"
    "drink"
    "drink"
    "Arm"
    "Boy"
    "Computer"
    "drive"
    "Drive"
    "Army"
    "Brain"
    "consonant"
    "drug"
    "Arts"
    "bread"
    "Contract"
    "dry"
    "Artist"
    "break"
    "cook"
    "Dust"
    "attack"
    "Breakfast"
    "cool"
    "ear"
    "August"
    "Bridge"
    "Copper"
    "Earth"
    "Author"
    "Brother"
    "grain"
    "East"
    "baby"
    "brown"
    "Corner"
    "eat"
    "rear"
    "build"
    "count"
    "Edge"
    "back"
    "building"
    "Land"
    "Egg"
    "bad"
    "burn"
    "court"
    "Eight"
    "bag"
    "Bus"
    "cow"
    "eighteen"
    "Ball"
    "buy"
    "crowd"
    "eighty"
    "Banana"
    "Cake"
    "cry"
    "Choice"
    "Band"
    "Call"
    "cup"
    "electronics"
    "Bank"
    "Camera"
    "bent"
    "eleven"
    "Bar"
    "camp"
    "Average"
    "Energy"
    "bathroom"
    "car"
    "Dance"
    "Motor"
    "Beach"
    "map"
    "dark"
    "Evening"
    "beard"
    "bear"
    "Date"
    "exercising"
    "Beat"
    "Cat"
    "Daughter"
    "expensive"
    "beautiful"
    "Fang"
    "Day"
    "explode"
    "bed"
    "ceiling"
    "dead"
    "Eye"
    "Bedroom"
    "Cell"
    "Phone"
    "deaf"
    "face"
    "beef"
    "Centimeters"
    "Death"
    "fall"
    "beer"
    "chair"
    "December"
    "fall"
    "bend"
    "cheap"
    "deep"
    "Family"
    "drink"
    "cheese"
    "Diamond"
    "famous"
    "bicycle"
    "Chicken"
    "die"
    "Fan"
    "large"
    "large"
    "child"
    "dig"
    "fan"
    "Bill"
    "Church"
    "Dinner"
    "Farm"
    "billions"
    "circle"
    "direction"
    "fast"
    "bird"
    "City"
    "dirty"
    "Father"
    "2"
    "February-"
    "hair"
    "Kitchen"
    "Millions"
    "feed"
    "half"
    "knee"
    "minute"
    "female"
    "hand"
    "blade"
    "Mix"
    "sensation"
    "Fifteen"
    "hang"
    "lake"
    "Monday"
    "fifth"
    "Happy"
    "lamp"
    "money"
    "fifty"
    "hard"
    "Notebook"
    "Month"
    "Battle"
    "Hat"
    "Laughter"
    "Moon"
    "find"
    "he"
    "law"
    "morning"
    "finger"
    "head"
    "Journal"
    "Mother"
    "Fire"
    "healthy"
    "learn"
    "Mountain"
    "first"
    "hear"
    "on the left"
    "mouse"
    "fish"
    "fishing"
    "Heart"
    "leg"
    "mouth"
    "five"
    "Heat"
    "Lemon"
    "film"
    "apartment"
    "sky"
    "Letter"
    "Murder"
    "ground"
    "heavy"
    "Library"
    "Music"
    "flower"
    "Hell"
    "Lie"
    "down"
    "closely"
    "fly"
    "high"
    "Elevator"
    "Nature"
    "follow"
    "hill"
    "Neck"
    "food"
    "hole"
    "Light"
    "needle"
    "foot"
    "horse"
    "Light"
    "neighboring"
    "foot"
    "hospital"
    "lip"
    "Network"
    "Forest"
    "hot"
    "hear"
    ""
    "new"
    "Fork"
    "Hotel"
    "Place"
    "newspaper"
    "forty"
    "Hour"
    "lock"
    "nice"
    "four"
    "House"
    "long"
    "Night"
    "fourteen"
    "Man"
    "loose"
    "nine"
    "fourth"
    "Hundred"
    "lose"
    "nineteen"
    "Friday"
    "man"
    "loud"
    "ninety"
    "friend"
    "I"
    "Love"
    "no"
    "front"
    "ice"
    "low"
    "North"
    "Game"
    "picture"
    "Lunch"
    "Nose"
    "Garden"
    "Customs"
    "Magazine"
    "note"
    "paper"
    "gasoline"
    "injury"
    "male"
    "November"
    "Gift"
    "inside"
    "man"
    "nuclear"
    "Girl"
    "Instrument"
    "Manager"
    "number"
    "glass"
    "Island"
    "map"
    "sea"
    "go"
    "e"
    "March"
    "October"
    "God"
    "January-"
    "market"
    "Office"
    "Gold"
    "job"
    "Wedding"
    "oil"
    "good"
    "Juice"
    "marry"
    "new"
    "Grandfather"
    "July"
    "material"
    "young"
    "grandmother"
    "jump"
    "Mai"
    "One"
    "grass"
    "June"
    "average"
    "Open"
    "gray"
    "Key"
    "Medicine"
    "Orange"
    "Green"
    "kill"
    "melt"
    "Orange"
    "floor"
    "Kilogram"
    "Metal"
    "outside"
    "grow"
    "King"
    "Meter"
    "Site"
    "gun"
    "Kiss"
    "milk"
    "3"
    "paint"
    "Rice"
    "Six"
    "tea"
    "pants"
    "rich"
    "sixteen"
    "teach"
    "paper"
    "on the right"
    "sixty"
    "Teacher"
    "parents"
    "Ring"
    "Skin"
    "Team"
    "Park"
    "River"
    "Rock"
    "tear"
    "pass"
    "Pass"
    "roof"
    "sky"
    "Technology"
    "Patient"
    "Room"
    "Sleep"
    "Telephone"
    "pattern"
    "root"
    "slow"
    "Television"
    "pay"
    "run"
    "small"
    "small"
    "Temperature"
    "Peace"
    "sad"
    "smell"
    "Ten"
    "pen"
    "Salt"
    "smile"
    "Theatre"
    "pencil"
    "Sand"
    "Snow"
    ""
    "person"
    "Saturday"
    "soap"
    "thick"
    "Photography"
    "School"
    "soft"
    "thin"
    "piece"
    "science"
    "ground"
    "Earth"
    "think"
    "Pig"
    "screen"
    "soldier"
    "third"
    "pink"
    "Sea"
    "Son"
    "thirteen"
    "plane"
    "Season"
    "song"
    "thirty"
    "system"
    "second"
    "Sound"
    "Thousand"
    "Plastic"
    "second"
    "soup"
    "three"
    "board"
    "Secretary"
    "south"
    "throw"
    "play"
    "Game"
    "see"
    "Thursday"
    "Gambler"
    "Seed"
    "speak"
    "say"
    "ticket"
    "bag"
    "sell"
    "spoon"
    "tight"
    "Gift"
    "September"
    "Sport"
    "Time"
    "Police"
    "Seven"
    "spring"
    "tire"
    "pool"
    "Seventeen"
    "square"
    "toe"
    "poor"
    "seventy"
    "Stain"
    "tongue"
    "Pork"
    "stand"
    "tool"
    "pound"
    "Sex"
    "Star"
    "tooth"
    "Shake"
    "Stone"
    "top"
    "President"
    "flat"
    "stop"
    "Touch"
    "price"
    ""
    "shop"
    "shop"
    "City"
    "priest"
    "Ship"
    "straight"
    "Station"
    "Prison"
    "T-Shirt"
    "Road"
    "train"
    "Station"
    "Program"
    "shoes"
    "strong"
    "Transport"
    "Pull"
    "shoot"
    "students"
    "Tree"
    "Push"
    "short"
    "Sugar"
    "Truck"
    "Queen"
    "short"
    "Suit"
    "Tuesday"
    "softly"
    "shoulder"
    "Summer"
    "Turnaround"
    "Race"
    "sick"
    "Sun"
    "Twelve"
    "Race"
    "Site"
    "Sunday"
    "twenty"
    "Radio"
    "sweat"
    "twenty"
    "One"
    "rain"
    "mark"
    "swim"
    "two"
    "Red"
    "Silver"
    "T-Shirt"
    "ugly"
    "religion"
    "sing"
    "they"
    "Table"
    "University"
    "reporter"
    "sister"
    "high"
    "up"
    "Restaurant"
    "sit"
    "Flavor"
    "Valley"
    "Verb"
    "Clock"
    "wet"
    "wood"
    "Victim"
    "Water"
    "White"
    "Work"
    "Voice"
    "Wave"
    "broad"
    "world"
    "vowel"
    "We"
    "woman"
    "write"
    "waiter"
    "weak"
    "win"
    "Hof"
    "wake"
    "up"
    "Wear"
    "Wind"
    "Year"
    "Walk"
    "Wedding"
    "Window"
    "Yellow"
    "Wall"
    "Wednesday"
    "wine"
    "Yes"
    "War"
    "Week"
    "wings"
    "You"
    "warm"
    "Weight"
    "Winter"
    "young"
    "wash"
    "West"
    "the woman"
    "Zero"
]

Meteor.methods
    get5Pictures: (word) ->
        array_pics = getImages2 word
        return array_pics

    get3PicturesRaw: () ->
        _.each BASIC_WORDS_EN, (word, key) ->
            array_pics = getImages2 word
            if array_pics.success
                WordCards.insert
                    word: word
                    pics: array_pics.success
                    views: 0
                    last: 0

        return {success:true}
