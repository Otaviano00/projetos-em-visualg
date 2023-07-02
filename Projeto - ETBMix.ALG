algoritmo "Projeto - ETBMix"
var
   mat_forma: vetor[1..30,1..30] de caractere
   mat_grafico: vetor[0..30,0..30] de caractere
   i,j, k1, k2, k3, k4, k6, veri, esc, n2, n3, l, m, m1,m2: inteiro
   alt, comp, comp2, h1, n1, num, a, b, c: real

procedimento menu_formas()
inicio
   escreval("============ CRIAÇÃO DE FORMAS ============")
   escreval()
   escreval("[1] - RETÂNGULOS")
   escreval("[2] - TRIÂNGULO RETÂNGULO")
   escreval("[3] - TRAPÉZIO")
   escreval("[4] - VOLTAR")
   escreval()
   escreva("Escolha uma opção: ")
   leia(esc)
   limpatela
fimprocedimento

procedimento menu_grafico()
inicio
   escreval()
   escreval("f(x) = a*x^2 + b*x + c")
   escreval()
   escreva("Digite o valor de a: ")
   leia(a)
   escreva("Digite o valor de b: ")
   leia(b)
   escreva("Digite o valor de c: ")
   leia(c)
   limpatela
fimprocedimento

procedimento menu_geral()
inicio
   repita
      escreval("============ MENU DE COISAS LEGAIS ============")
      escreval()
      escreval("[1] - CRIAR FORMAS GEOMÉTRICAS")
      escreval("[2] - CRIAR GRÁFICOS")
      escreval("[3] - SAIR")
      escreval()
      escreva("Escolha uma opção: ")
      leia(esc)
      escreval()
      limpa_f()
      escolha esc
      caso 1
         limpatela
         esc_forma()
      caso 2
         limpatela
         esc_grafico()
      caso 3
         escreva()
      outrocaso
         escreval("Opção não encontrada.")
         confirma()
         se (veri = 2) entao
            esc := 3
         fimse
      fimescolha
      escreval("Tudo bem! Até a proxima.")
   ate (esc = 3)

fimprocedimento

procedimento limpa_f()
inicio
   para i := 1 ate m faca
      para j := 1 ate m faca
         mat_forma[i,j] := "  "
      fimpara
   fimpara
fimprocedimento

procedimento forma()
inicio
   escreval("============ FORMAS GEOMÉTRICAS ============")
   escreval()
   escolha esc
   caso 1
      escreval("Altura: ",alt:1)
      escreval("Comprimento: ",comp:1)
      escreval()
   caso 2
      escreval("Altura: ",alt:1)
      escreval("Comprimento: ",comp:1)
      escreval()
   caso 3
      escreval("Altura: ",alt:1)
      escreval("Base maior: ",comp:1)
      escreval("Base menor: ",comp2:1)
      escreval()
   caso -1
      escreval("Raio: ",alt:1)
   fimescolha
   para i := k1-1 ate 1 passo -1 faca
      para j := 1 ate m faca
         mat_forma[i,j] := "  "
      fimpara
   fimpara
   para i := k2+1 ate m faca
      para j := 1 ate m faca
         mat_forma[i,j] := "  "
      fimpara
   fimpara
   para j := k3-1 ate 1 passo -1 faca
      para i := 1 ate m faca
         mat_forma[i,j] := "  "
      fimpara
   fimpara
   para j := k4+1 ate m faca
      para i := 1 ate m faca
         mat_forma[i,j] := "  "
      fimpara
   fimpara

   para i := 1 ate m faca
      para j := 1 ate m faca
         escreva(mat_forma[i,j])
      fimpara
      escreval()
   fimpara
fimprocedimento

funcao converter (x: real): inteiro
var
   a: inteiro
inicio
   enquanto (a <> x) faca
      a := a+1
   fimenquanto
   retorne a

fimfuncao

procedimento quadrado()
inicio
   se (alt mod 2 = 0) entao
      h1 := alt/2
      k1 := m1 - converter(h1) +2
      k2 := m2 + converter(h1)
   senao
      h1 := alt/2 + 1/2
      k1 := m1 - converter(h1) +2
      k2 := m2 + converter(h1) -1
   fimse

   se (comp mod 2 = 0) entao
      h1 := comp/2
      k3 := m1 - converter(h1) +2
      k4 := m2 + converter(h1)
   senao
      h1 := comp/2 + 1/2
      k3 := m1 - converter(h1) +2
      k4 := m2 + converter(h1) -1
   fimse

   para i := k1 ate k2 faca
      mat_forma[i,k3] := "* "
      mat_forma[i,k4] := "* "
   fimpara

   para i := k3 ate k4 faca
      mat_forma[k1,i] := "* "
      mat_forma[k2,i] := "* "
   fimpara

fimprocedimento

procedimento triang()
inicio
   se (alt mod 2 = 0) entao
      h1 := alt/2
      k1 := m1 - converter(h1) +2
      k2 := m2 + converter(h1)
   senao
      h1 := alt/2 + 1/2
      k1 := m1 - converter(h1) +2
      k2 := m2 + converter(h1) -1
   fimse

   se (comp mod 2 = 0) entao
      h1 := comp/2
      k3 := m1 - converter(h1) +2
      k4 := m2 + converter(h1)
   senao
      h1 := comp/2 + 1/2
      k3 := m1 - converter(h1) +2
      k4 := m2 + converter(h1) -1
   fimse


   num := 0
   para i := k1 ate k2 faca
      mat_forma[i,k3] := "* "
   fimpara
   para i := k3 ate k4 faca
      mat_forma[k2,i] := "* "
   fimpara
   se (k2-k1 = k4-k3) entao
      num := (k2-k1)/(k4-k3)
      i := k2+1
      para j := k4 ate k3 passo -1 faca
         i := i-1
         mat_forma[i,j] := "* "
      fimpara
   senao
      se ((k2 - k1) < (k4-k3)) entao
         num := (k4-k3+1)/(k2-k1+1)
         n1 := -1.5
         n2 := 0
         repita
            n1 := n1 + 1
            n2 := n2 + 1
            se (n1 = 0.5) entao
               n2 := 1
            fimse
         ate (num >= n1) e (num < (n1 + 1))
         i := k2+1
         para j := k4+1 ate k3+1 passo -n2 faca
            i := i-1
            para l := 1 ate n2 faca
               n3 := j-l
               se (j-l <= 0) entao
                  n3 := 1
               fimse
               se ( i <= 0) entao
                  i := 1
               fimse
               mat_forma[i,n3] := "* "
            fimpara
         fimpara
      senao
         num := (k2-k1+1)/(k4-k3+1)
         n1 := -1.5
         n2 := 0
         repita
            n1 := n1 + 1
            n2 := n2 + 1
            se (n1 = 0.5) entao
               n2 := 1
            fimse
         ate (num >= n1) e (num < (n1 + 1))
         j := k4+1
         para i := k2+1 ate k1+1 passo -n2 faca
            j := j-1
            para l := 1 ate n2 faca
               n3 := i-l
               se (i-l <= 0) entao
                  n3 := 1
               fimse
               se (j <= 0) entao
                  j := 1
               fimse
               mat_forma[n3,j] := "* "
            fimpara
         fimpara
      fimse
   fimse
fimprocedimento

procedimento trap()
inicio
   se (alt mod 2 = 0) entao
      h1 := alt/2
      k1 := m1 - converter(h1) +2
      k2 := m2 + converter(h1)
   senao
      h1 := alt/2 + 1/2
      k1 := m1 - converter(h1) +2
      k2 := m2 + converter(h1) -1
   fimse

   se (comp mod 2 = 0) entao
      h1 := comp/2
      k3 := m1 - converter(h1) +2
      k4 := m2 + converter(h1)
   senao
      h1 := comp/2 + 1/2
      k3 := m1 - converter(h1) +2
      k4 := m2 + converter(h1) -1
   fimse

   k6 := k3 +converter (comp2)-1


   num := 0
   para i := k1 ate k2 faca
      mat_forma[i,k3] := "* "
   fimpara
   para i := k3 ate k4 faca
      mat_forma[k2,i] := "* "
   fimpara
   para i := k3 ate k6 faca
      mat_forma[k1,i] := "* "
   fimpara

   se (k2-k1 = k4-k6) entao
      num := (k2-k1)/(k4-k6)
      i := k2+1
      para j := k4 ate k6 passo -1 faca
         i := i-1
         mat_forma[i,j] := "* "
      fimpara
   senao
      se ((k2 - k1) < (k4-k6)) entao
         num := (k4-k6+1)/(k2-k1+1)
         n1 := -1.5
         n2 := 0
         repita
            n1 := n1 + 1
            n2 := n2 + 1
            se (n1 = 0.5) entao
               n2 := 1
            fimse
         ate (num >= n1) e (num < (n1 + 1))
         i := k2+1
         para j := k4+1 ate k6 passo -n2 faca
            i := i-1
            para l := 1 ate n2 faca
               n3 := j-l
               se (j-l <= 0) entao
                  n3 := 1
               fimse
               se ( i <= 0) entao
                  i := 1
               fimse
               se ((j = k6) e (n3 <= k6)) entao
                  j := j+1
               fimse
               mat_forma[i,n3] := "* "
            fimpara
         fimpara
      senao
         num := (k2-k1+1)/(k4-k6+1)
         n1 := -1.5
         n2 := 0
         repita
            n1 := n1 + 1
            n2 := n2 + 1
            se (n1 = 0.5) entao
               n2 := 1
            fimse
         ate (num >= n1) e (num < (n1 + 1))
         j := k4+1
         para i := k2+1 ate k1+1 passo -n2 faca
            j := j-1
            para l := 1 ate n2 faca
               n3 := i-l
               se (i-l <= 0) entao
                  n3 := 1
               fimse
               se (j <= 0) entao
                  j := 1
               fimse
               se ((j = k6) e (n3 <= k6)) entao
                  j := j+1
               fimse
               mat_forma[n3,j] := "* "
            fimpara
         fimpara
      fimse
   fimse



fimprocedimento

procedimento confirma()
inicio
   repita
      escreval()
      escreval("Gostaria de continuar? ")
      escreval("[1] - SIM")
      escreval("[2] - NÃO")
      escreval()
      leia(veri)
      escreval()
      escolha veri
      caso 1
         limpatela
      caso 2
         limpatela
      outrocaso
         limpatela
         escreval("Opção não encontrada.")
         confirma()
      fimescolha
   ate (veri = 1) ou (veri = 2)

fimprocedimento

procedimento esc_forma()
inicio
   repita
      menu_formas()
      escolha esc
      caso 1
         repita
            escreval("============ CRIAÇÃO DE RETÂNGULOS ============")
            escreval("Não utilize valores quebrados ou negativos.")
            escreval("Escolha valores entre 1 e 29")
            escreval()
            escreva("Digite o valor da altura: ")
            leia(alt)
            escreva("Digite o valor do comprimento: ")
            leia(comp)
            limpatela
            se (alt <= 0) ou (comp <= 0) entao
               escreval("Não é possível criar formas com valores negativos.")
               confirma()
            senao
               quadrado()
               forma()
               confirma()
               limpa_f()
            fimse
            se (veri = 2) entao
               veri := 3
            fimse
         ate (veri = 3)
      caso 2
         repita
            escreval("============ CRIAÇÃO DE TRIÂNGULOS ============")
            escreval("Use apenas valores inteiros e positivos.")
            escreval("Escolha valores entre 1 e 29")
            escreval()
            escreva("Digite o valor da altura: ")
            leia(alt)
            escreva("Digite o valor do comprimento: ")
            leia(comp)
            limpatela
            se (alt <= 0) ou (comp <= 0) entao
               escreval("Valor negativo ou Nulo.")
               confirma()
            senao
               triang()
               forma()
               confirma()
               limpa_f()
            fimse
            se (veri = 2) entao
               veri := 3
            fimse
         ate (veri = 3)
      caso 3
         repita
            escreval("============ CRIAÇÃO DE TRAPÉZIOS ============")
            escreval("Use apenas valores inteiros e positivos.")
            escreval("Escolha valores entre 1 e 29")
            escreval()
            escreva("Digite o valor da altura: ")
            leia(alt)
            escreva("Digite o valor da base maior: ")
            leia(comp)
            escreva("Digite o valor da base menor: ")
            leia(comp2)
            limpatela
            se (comp2 > comp) entao
               n1 := comp
               comp := comp2
               comp2 := n1
            fimse
            se (alt <= 0) ou (comp <= 0) ou (comp2 <= 0) entao
               escreval("Valor negativo ou Nulo.")
               confirma()
            senao
               trap()
               forma()
               confirma()
               limpa_f()
            fimse
            se (veri = 2) entao
               veri := 3
            fimse
         ate (veri = 3)
      caso 4
         veri := 2
      caso -1
         repita
            escreval("============ CRIAÇÃO DE CÍRCULOS ============")
            escreval()
            escreval("Área em construção ainda :(")
            escrevaL()
            confirma()
            se (veri = 2) entao
               veri := 3
            fimse
         ate (veri = 3)
      outrocaso
         escreval("Opção não encontrada.")
         confirma()
      fimescolha
   ate (veri = 2)

fimprocedimento

procedimento esc_grafico()
inicio
   veri := 1
   enquanto (veri = 1) faca
      a := 0
      b := 0
      c := 0
      para i := m ate 0 passo -1 faca
         escreva(i:3,"|")
         para j := 0 ate m faca
            escreva(mat_grafico[i,j])
         fimpara
         escreval()
      fimpara
      escreva()
      escreva("    ")
      para i := 0 ate m faca
         escreva("---")
      fimpara
      escreval()
      escreva("    ")
      para i := 0 ate m faca
         se (i < 10) entao
            escreva(" ",i:1," ")
         senao
            escreva(" ",i:1)
         fimse
      fimpara
      escreval()
      menu_grafico()
      processo_grafico()
      grafico()
      confirma()
      limpa_g()
   fimenquanto

fimprocedimento

procedimento processo_grafico()
inicio
   para j := 0 ate m faca
      num := a*j^2 + b*j + c
      n1 := -1,5
      n2 := -1
      se (num >= 0) entao
         repita
            n1 := n1 + 1
            n2 := n2 + 1
         ate ((num >= n1) e (num < (n1 + 1))) ou (n2 > m)
      senao
         num := -1
      fimse
      para i := 0 ate m faca
         se (num = -1) entao
            mat_grafico[i,j] := "   "
         senao
            se (i = n2) entao
               mat_grafico[i,j] := " * "
            senao
               mat_grafico[i,j] := "   "
            fimse

         fimse
      fimpara
   fimpara
fimprocedimento

procedimento grafico()
inicio
   para i := m ate 0 passo -1 faca
      escreva(i:3,"|")
      para j := 0 ate m faca
         escreva(mat_grafico[i,j])
      fimpara
      escreval()
   fimpara
   escreva()
   escreva("    ")
   para i := 0 ate m faca
      escreva("---")
   fimpara
   escreval()
   escreva("    ")
   para i := 0 ate m faca
      se (i < 10) entao
         escreva(" ",i:1," ")
      senao
         escreva(" ",i:1)
      fimse
   fimpara
   escreval()
   escreval("f(x) = ",a:3,"*x^2 + ",b:3,"*x +",c:3)
fimprocedimento

procedimento limpa_g()
inicio
   para i := m ate 0 passo -1 faca
      para j := 0 ate m faca
         mat_grafico[i,j] := "   "
      fimpara
   fimpara
fimprocedimento

inicio
   m := 30
   m1 := converter(m/2)
   m2 := converter(m/2 + 1)
   menu_geral()
fimalgoritmo