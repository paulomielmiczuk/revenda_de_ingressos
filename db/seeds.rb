require "open-uri"
require 'date'

puts "Destroying all users..."
User.destroy_all

puts 'Creating users...'

user1 = User.create!(name: "Eventim", email: "eventim@gmail.com", password: "123456")
profile1 = URI.open("https://play-lh.googleusercontent.com/Qb-5p2u9Bj6IznvgMHf6bJtHXVrXVskKaYbD0kX4Cfve-kNveFZ4xaNX1JkoiGmiNYY")
user1.photo.attach(io: profile1, filename: "eventim.png", content_type: "image/png")
user1.save

user2 = User.create!(name: "Ticket Master", email: "ticketmaster@gmail.com", password: "123456")
profile2 = URI.open("https://media.licdn.com/dms/image/v2/D4D0BAQE3V2w8BWr1kg/company-logo_200_200/company-logo_200_200/0/1720021195008/ticketmasterbr_logo?e=2147483647&v=beta&t=agfv0DzP6oCxxjCeMvqaBQrl4VOpF50dsS4Qfc9blUQ")
user2.photo.attach(io: profile2, filename: "ticketmaster.png", content_type: "image/png")
user2.save

user3 = User.create!(name: "T4F", email: "t4f@gmail.com", password: "123456")
profile3 = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRG1rJH-vzt80_7ko4O1BzTq3wo2NqNgguGg&s")
user3.photo.attach(io: profile3, filename: "t4f.png", content_type: "image/png")
user3.save

user4 = User.create!(name: "Ingresse", email: "ingresse@gmail.com", password: "123456")
profile4 = URI.open("https://images.squarespace-cdn.com/content/v1/59d68fe3017db263203e4b79/1507233943500-PL0SQBRD1YH3ZW3J4GDH/Logo%403x.png")
user4.photo.attach(io: profile4, filename: "ingresse.png", content_type: "image/png")
user4.save

user5 = User.create!(name: "Sympla", email: "sympla@gmail.com", password: "123456")
profile5 = URI.open("https://play-lh.googleusercontent.com/fhp6lLE_9QC1jiY3UIKHqBJ9Vcul29L7AuWWlc4Teona2BcmPKGwNDpQjsfKOplzFJ8")
user5.photo.attach(io: profile5, filename: "sympla.png", content_type: "image/png")
user5.save

puts 'Users created!'

puts 'Creating events...'

event1 = Event.create!(title: "Paul McCartney Got Back", date: Date.new(2024, 10, 15), location: "Avenida Francisco Matarazzo, 1705, - Água Branca, São Paulo, São Paulo, Brasil", description: "Paul McCartney lançou sua turnê Got Back em 2022, completando 16 apresentações nos Estados Unidos. Em junho deste mesmo ano, fez uma apresentação histórica em Glastonbury, que foi definida pelo jornal British Times como o “melhor show de todos os tempos”. Em 2023, Paul levou a turnê para Austrália e México, fechando o ano com oito shows Brasil – Brasília, Belo Horizonte, São Paulo, Curitiba e Rio de Janeiro. Paul McCartney vem ao Brasil com a banda que o acompanha há vários anos - Paul 'Wix' Wickens (teclados), Brian Ray (baixo/guitarra), Rusty Anderson (guitarra) e Abe Laboriel Jr (bateria). A utilização de tecnologia de áudio e vídeo de última geração garante uma experiência inesquecível em todos os setores das venues selecionadas para as apresentações. Com grandes sucessos como 'Hey Jude', 'Live and Let Die', 'Band on the Run', 'Let It Be' e muitas outras, a experiência de um show ao vivo de Paul McCartney é muito mais do que qualquer amante da música poderia querer de um show de rock: horas dos melhores momentos dos últimos 60 anos de música, dezenas de canções da carreira solo de Paul, do período dos Wings e, claro, catálogos dos Beatles que formaram as trilhas sonoras de nossas vidas. paulmccartneygotback.com ", user: user1)
photo1 = URI.open("https://www.eventim.com.br/campaign/fileadmin/fm_br/campaigns/2024/paul-mccartney/PMC_2024_1080x1669px_v8.png")
event1.photo.attach(io: photo1, filename: "paul.png", content_type: "image/png")

event2 = Event.create!(title: "Elvis - A Musical Revolution", date: Date.new(2024, 12, 1), location: "Teatro Santander - Avenida Presidente Juscelino Kubitschek, 2041, São Paulo - São Paulo", description: " LETS’S ROCK! Chegou a vez do Brasil vivenciar a grandiosidade de 'Elvis: A Musical Revolution', uma megaprodução internacional que já encantou plateias ao redor do mundo, nos transporta pela incrível vida de ELVIS PRESLEY. Com passagens marcantes por Melbourne, Austrália, e nos Estados Unidos, o espetáculo é a biografia musical por trás do ícone, a narrativa entrelaça-se com figuras cruciais, como seus pais Vernon e Gladys, o astuto Coronel Parker, e inspirações como Ann-Margret e Priscilla Presley, desvendando os segredos e as histórias pessoais que moldaram o homem por trás da lenda. Uma jornada musical com os maiores sucessos do Rei do Rock, incluindo  'Jailhouse Rock', 'Hound Dog', 'Heartbreak Hotel' e 'Suspicious Minds' que ganham vida, pulsando com a energia eletrizante que definiu gerações.'Elvis: A Musical Revolution' é uma revolução musical liderada por Elvis Presley, é a celebração de um homem cuja música ecoa nos corações de gerações, marcando uma experiencia única e emocionante para o público no teatro. Elvis Aaron Presley, nascido em Tupelo, Mississippi, em 1935, influenciou o Rock com sua voz marcante, visual ousado e carisma incomparável. Popularizou o gênero em uma época de segregação racial nos EUA e recebeu 14 indicações ao Grammy. Seus hits, explorando rock, country, R&B e gospel, deixaram um legado duradouro. Com mais de 16 milhões de ouvintes mensais no Spotify e hits imortais, Elvis Presley continua vivo no imaginário dos fãs. ", user: user5)
photo2 = URI.open("https://assets.bileto.sympla.com.br/eventmanager/production/1enk16q2d2aorvv2hmfiv9q2male8fmqrragc5eo3cir8aj03dc8pt9kcru0vlp64jobh1ta4eknvka2q5m9gi8gf11e5vqrttc35ad.webp")
event2.photo.attach(io: photo2, filename: "elvis.png", content_type: "image/png")

event3 = Event.create!(title: "Cirque Du Soleil CRYSTAL", date: Date.new(2024, 10, 6), location: "Av. Queiroz Filho, 1315 - Vila Leopoldina - São Paulo, SP, Brasil", description: "o espetáculo integra a arte deslumbrante da patinação no gelo com acrobacias que desafiam a gravidade, estabelecendo um novo marco nos 40 anos de história da empresa. Esta produção única promete uma experiência imersiva que combina a beleza da patinação com a emoção das performances aéreas. O show apresenta acrobatas e patinadores que atuam perfeitamente no gelo e no ar, combinando múltiplas habilidades para criar uma experiência de entretenimento de altíssimo nível. O público pode esperar testemunhar patinação sincronizada, estilo livre e patinação extrema ao lado de atos de circo tradicionais, como trapézio, alças aéreas e apresentações corpo a corpo. Criado por Shana Carroll e Sebastien Soldevila, CRYSTAL leva o público a uma jornada emocionante de autodescoberta cheia de capricho e admiração. Sinta sua adrenalina subir ao mergulhar em um mundo de imaginação lúdica com a protagonista do show, Crystal, enquanto ela aprende a ver as coisas de maneira diferente e a se tornar quem sempre esteve destinada a ser: ela mesma. Usando projeções visuais grandiosas no gelo (uma estreia do Cirque du Soleil) e uma trilha sonora que combina perfeitamente música pop com o som característico do Cirque du Soleil, CRYSTAL transporta o público para uma experiência visual e auditiva inesquecível, cheia de magia e maravilha. Sinopse - Crystal é uma jovem criativa que se sente incompreendida e fora de sincronia consigo mesma. Para escapar de sua realidade, ela se aventura em um lago congelado e acaba caindo no gelo e chegando em um mundo invertido. Neste mundo subaquático da sua imaginação ela vê um reflexo de si mesma. Por lá, ela é guiada por seu reflexo por este novo mundo e a desperta para a sua própria criatividade. À medida que Crystal continua sua jornada, ela transforma suas peculiaridades em criatividade com um toque de sua caneta. Com esse novo poder recém-descoberto, ela é capaz de encontrar seu verdadeiro eu e fazer uma jornada de volta à realidade. O espetáculo CRYSTAL trata de olhar as coisas de novos ângulos, espiar através do verniz da vida cotidiana, reenquadrar a realidade diária para ver o que podemos ter perdido. Às vezes, a única maneira de apreciar as coisas é olhar para elas de outro ângulo. Descobrir a individualidade e a singularidade de alguém exige aventurar-se em gelo fino.", user: user1)
photo3 = URI.open("https://www.eventim.com.br/campaign/fileadmin/fm_br/campaigns/2024/cirque-crystal/CDS_CRY_Site_PopUp_900x1200.png")
event3.photo.attach(io: photo3, filename: "crystal.png", content_type: "image/png")

event4 = Event.create!(title: "Palipalan Festival 2024", date: Date.new(2024, 9, 7), location: "Pura Chapada - GO-239, km 12 - Zona rural, Alto Paraíso de Goiás - GO, 73770-000", description: "Line Up: 3030 - Paulo Beck - Mica - Chicco Aquino - Enrico & Carmo - Hoo - Albuquerque - Skiavoni - Blandim - Ray Ferreira - Menezes - Dudu Brígido - Luiz Antony & Pedro Perdiz - Leal - Menezes & Dudu Brígido - Maskavo. De 06 a 08 de Setembro convidamos você para uma festa que passa por Brasilidades, Disco, Afro House, Afropop, entre outros vertentes musicais, contemplando a natureza, arte, cultura e gastronomia da região. Teremos além das festas algumas atividades como Yoga, trilhas e vivências estarão disponíveis durante o período do festival.", user: user4)
photo4 = URI.open("https://event-kraken.s3.amazonaws.com/event/posters/73675/large.jpg")
event4.photo.attach(io: photo4, filename: "palipalan.png", content_type: "image/png")

event5 = Event.create!(title: "Incubus - São Paulo", date: Date.new(2025, 4, 10), location: "Espaço Unimed - Rua Tagipuru, 795, Barra Funda, São Paulo, SP", description: "Não faz nem um ano que a banda anunciou a regravação e o relançamento do aclamado álbum, na nova versão intitulado “Morning View XXIII” (Virgin Music Group), lançado em 10 de maio de 2024 e que, juntamente com a nova turnê, é o principal produto de um projeto que começou de forma despretensiosa em um live streaming em 2021 em comemoração ao 20º aniversário do disco. Na época, o Incubus retornou à casa onde gravou o álbum original e diretamente desse cenário, apresentou para uma audiência global todas as faixas, da primeira à última, pela primeira vez. A resposta dos fãs foi entusiasmada e a banda decidiu repetir a apresentação em outubro de 2023, dessa vez em um dos palcos mais importantes de sua cidade natal, o Hollywood Bowl, em noite lotada e claro, emocionante.", user: user3)
photo5 = URI.open("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiS5959_SshyR-KU81XCfybDs-CxBLntVbUVqffSXg_P84z_scqyXi5HwALYQhCaXT5rsHNj4QvwuMfdaqRz_do-aph013rMVBtytR1ICT-29HeXiofbnqbd3jE_Zw0VLW6s_DG3Sj-5gZVrEUsKcy1DlC1nfjWszE5LjAYmH6Lh78x0iuaMicH1cchdMXN/s550/EECDF4B3-8D96-4466-9FFD-D864BC80EA63.jpeg")
event5.photo.attach(io: photo5, filename: "incubus.png", content_type: "image/png")

event6 = Event.create!(title: "Hairspray", date: Date.new(2024, 9, 5), location: "Teatro Renault - Av. Brigadeiro Luís Antônio, 411, Bela Vista, São Paulo, São Paulo, Brasil", description: "Hairspray, o hit da Broadway, está de volta ao Brasil, em montagem original. O musical aclamado pela crítica chega a São Paulo, estrelado e dirigido por Tiago Abravanel e grande elenco.A partir do dia 05 de setembro no teatro Renault, em São Paulo, o premiado musical apresentado pelo Ministério da Cultura e Brasilprev, transportará a plateia para os Anos 60, com números musicais inesquecíveis, em uma história que é uma celebração da diversidade, aceitação e do poder da dança.O espetáculo nos transporta para a cidade norte-americana de Baltimore, nos anos 1960, onde a adolescente cheia de energia Tracy Turnblad sonha em dançar no programa de TV local, The Corny Collins Show. Desafiando as normas sociais e lutando contra a discriminação, Tracy se torna uma voz pela igualdade racial e pelo direito de todos dançarem juntos. Com humor, música e coreografias vibrantes, Hairspray aborda questões de inclusão, aceitação e amor próprio, enquanto Tracy e seus amigos trabalham para mudar a sociedade através da dança. Uma jornada musical cheia de diversão, celebração e mensagens poderosas que prometem muita comoção.", user: user3)
photo6 = URI.open("https://cooltours.s3.sa-east-1.amazonaws.com/images/preview/57157eec8d07912c019dd7721fe3e4944f0fcfd0597077d5a67fed2aee8676d9.jpg")
event6.photo.attach(io: photo6, filename: "hairspray.png", content_type: "image/png")

event7 = Event.create!(title: "Cateano & Bethânia", date: Date.new(2024, 12, 14), location: "Avenida Francisco Matarazzo, 1705, - Água Branca, São Paulo, São Paulo, Brasil", description: "A turnê Caetano & Bethânia tem um significado especial para a música popular brasileira, para a história dos dois irmãos e para os fãs que sonham em vê-los em um só espetáculo. Nascidos em Santo Amaro, no recôncavo baiano, Caetano Veloso e Maria Bethânia são reconhecidos como artistas essenciais à formação cultural de várias gerações, com trajetórias projetadas para além da música, inspirando criadores em todas as partes e em todas as artes.", user: user2)
photo7 = URI.open('https://cdn.getcrowder.com/images/cc54ae73-461a-43ed-ac31-6998b17692a0-cb1440x540novo.png')
event7.photo.attach(io: photo7, filename: "caetanoebethania.png", content_type: "image/png")

event8 = Event.create!(title: "Gilberto Gil | Tempo Rei", date: Date.new(2025, 3, 15), location: "Ladeira da Fonte das Pedras, s/n - Nazaré, 40050-565 Salvador", description: "Influenciado pela sonoridade da música do sertão, principalmente de Luiz Gonzaga, Gilberto Gil escolheu o acordeon como seu primeiro instrumento, ainda nos anos 50. Porém, assim que conheceu a bossa nova de João Gilberto e Dorival Caymmi, Gil deixou de lado o acordeon e pegou o violão e a guitarra elétrica, seus companheiros até hoje.", user: user1)
photo8 = URI.open("https://www.eventim.com.br/campaign/fileadmin/fm_br/campaigns/2024/gil-tempo-rei/GIL_TEMPO_REI_KV_Eventim_LP.png")
event8.photo.attach(io: photo8, filename: "gil.png", content_type: "image/png")

event9 = Event.create!(title: "Allianz Parque Experience Tour", date: Date.new(2024, 11, 17), location: "Avenida Francisco Matarazzo, 1705, - Água Branca, São Paulo, São Paulo, Brasil", description: "Já imaginou viajar pela história do Palmeiras, fazer o caminho dos vestiários até o gramado e viver uma experiência completa do que é estar na arena mais moderna da América Latina? Desde a sua fundação, em novembro de 2014, o Allianz Parque revolucionou o mercado do entretenimento no Brasil ao criar um espaço único no país, em que a maior paixão nacional, o futebol, convive de forma harmônica com os shows, sendo a arena que mais recebeu eventos no mundo em 2017 e 2018.", user: user5)
photo9 = URI.open("https://assets.bileto.sympla.com.br/eventmanager/production/2n331o8t2gap3vmk5dqdfsf2dsho1kaqf2cuhtu5qf17a6k4jqpncg1p6bfe6jacm8ao9qcg8lbmqa8vgnvma1t6n4baodfk9bklmua.webp")
event9.photo.attach(io: photo9, filename: "allianzparque.png", content_type: "image/png")

event10 = Event.create!(title: "Sesc Jazz - Egberto Gismonti", date: Date.new(2024, 10, 28), location: "R. Dr. Plínio Barreto, 285 - Bela Vista, São Paulo - SP, 01313-020", description: "Depois de três anos longe dos palcos, Egberto Gismonti volta a se apresentar com um projeto de piano que ele traz ao Sesc Jazz 2023. No show, apresentará uma prévia de seu CD duplo, ou triplo, que será lançado em breve. No repertório, composições de 20 anos antes e 40 anos depois da Semana de Arte Moderna de 1922, como Pelo Telefone, de Donga, Maracangalha, de Dorival Caymmi, Sinal Fechado, de Paulinho da Viola, e Bate Outra Vez, de Cartola, entre outras.", user: user4)
photo10 = URI.open("https://sescjazz.sescsp.org.br/wp-content/uploads/2023/10/banner_artistas11-1.jpg")
event10.photo.attach(io: photo10, filename: "egberto.png", content_type: "image/png")

event11 = Event.create!(title: "PaGGodin Salvador", date: Date.new(2024, 9, 15), location: "Av. Octávio Mangabeira, 5.490 - Boca do Rio, Salvador - BA, 41706-690", description: "PaGGodin, a turnê de Léo Santana que celebra o retorno do artista às suas origens musicais, o pagode!", user: user3)
photo11 = URI.open("https://event-kraken.s3.amazonaws.com/event/posters/73666/large.jpg")
event11.photo.attach(io: photo11, filename: "paggodin.png", content_type: "image/png")

event12 = Event.create!(title: "Lenny Kravitz", date: "2024-11-23", location: "Avenida Francisco Matarazzo, 1705, - Água Branca, São Paulo, São Paulo, Brasil", description: "O escritor, produtor, multi-instrumentista vencedor de quatro prêmios GRAMMY, Lenny Kravitz, anuncia seu retorno ao Brasil com a inclusão de uma apresentação em São Paulo da turnê mundial Blue Electric Light Tour 2024. O show acontece no dia 23 de novembro, no Allianz Parque", user: user3)
photo12 = URI.open("https://www.eventim.com.br/campaign/fileadmin/fm_br/campaigns/2024/lenny-kravitz/LENNYKRAVITZ_Eventim_EmailMkt.png")
event12.photo.attach(io: photo12, filename: "lennykravitz.png", content_type: "image/png")

event13 = Event.create!(title: "The weekend", date: Date.new(2024, 9, 7), location: " Praça Roberto Gomes Pedrosa, 01 – Morumbi, São Paulo, São Paulo, Brasil", description: " O Embaixador da Boa Vontade do Programa Mundial de Alimentos das Nações Unidas, Abel “The Weeknd” Tesfaye, fará novamente uma parceria com o Programa Mundial de Alimentos das Nações Unidas para contribuir com o Programa Humanitário XO, que apoia à crise global sem precedentes da fome . Com isso, o equivalente a US$ 1 de cada ingresso vendido será revertido para esta causa importante.", user: user2)
photo13 = URI.open("https://cdn.getcrowder.com/images/f7190f38-8110-4a52-a2ca-aa37c0d2937a-tmgrid640x640.png?w=960&format=webp")
event13.photo.attach(io: photo13, filename: "theweekend.png", content_type: "image/png")

event14 = Event.create!(title: "Bruno Mars", date: Date.new(2024, 10, 4), location: " Praça Roberto Gomes Pedrosa, 01 – Morumbi, São Paulo, São Paulo, Brasil", description: " Prepare-se para uma experiência inesquecível! Bruno Mars vai incendiar o Estádio do Morumbis! ", user: user1)
photo14 = URI.open("https://cdn.getcrowder.com/images/122a8928-9fec-495c-89b2-2f00e4e64d6c-bm1920x720sp-1-1.png")
event14.photo.attach(io: photo14, filename: "brunomars.png", content_type: "image/png")

event15 = Event.create!(title: "Conectado Mumuzinho", date: Date.new(2024, 10, 11), location: " Avenida Ayrton Senna, 3000 - Barra da Tijuca, Rio de Janeiro, Rio de Janeiro, Brasil", description: "Após mais de 10 anos da gravação do primeiro projeto audiovisual, o pagodeiro retorna com um grande álbum, que traz muito do seu amadurecimento enquanto cantor. O DVD Conectado possui 19 músicas inéditas e 7 regravações, acompanhado de participações de grandes nomes do pagode, sertanejo e trap.", user: user1)
photo15 = URI.open("https://cdns-images.dzcdn.net/images/cover/34638a2681def40a6c9b0424fcedead1/1900x1900-000000-80-0-0.jpg")
event15.photo.attach(io: photo15, filename: "mumuzinho.png", content_type: "image/png")

puts 'Events created!'

puts 'Creating tickets...'

ticket1 = Ticket.create!(user: user1, event: event1)
ticket2 = Ticket.create!(user: user2, event: event3)
ticket3 = Ticket.create!(user: user4, event: event8)

puts 'Tickets created!'
