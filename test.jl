for arg in ARGS
    println(arg)
    print(1)
end
print(1)

resultat = begin
              x = 5;
              y = 7;
              x+y
            end
 println(resultat)

 println("\t\tProgramm zur Berechnung der Quadratwurzel\n\n")
print("Zahl? ") # einfaches prompt
eingabe = parse(Float64, readline()) # einlesen über readline()

try
    println("Das Resultat ist $(sqrt(eingabe))") # berechnung + ausgabe
catch e
    println("Negative Eingabe: Sie erhalten ein komplexes Ergebnis!") # warnhinweis
    println("Resultat ist $(sqrt(complex(eingabe)))") # berechnung + ausgabe
end
