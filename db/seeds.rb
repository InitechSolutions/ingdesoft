# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
logros = Logro.find_or_create_by([{ nombre: 'Politico' ,min:-999 , max:-1}])
logros = Logro.find_or_create_by ([{ nombre: 'Observador' , min:0 ,max:0}])
logros = Logro.find_or_create_by ([{ nombre: 'Buen Tipo' ,  min:1 ,max:1}])
logros = Logro.find_or_create_by ([{ nombre: 'Gran Tipo' ,  min:2 ,max:5}])
logros = Logro.find_or_create_by ([{ nombre: 'Tipazo' ,  min:6 ,max:10}])
logros = Logro.find_or_create_by ([{ nombre: 'Heroe' ,  min:11 ,max:20}])
logros = Logro.find_or_create_by ([{ nombre: 'Nobleza Gaucha' ,  min:21 ,max:50}])
logros = Logro.find_or_create_by ([{ nombre: 'Dios' ,  min:51 ,max:999}])
#favors = Favor.find_or_create_by([{titulo: "Restaurar obra de arte", descrpcion: "La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?", fecha:29/08/2016}])
#favors = Favor.find_or_create_by([{titulo: "Karl", descrpcion: "Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones. Es muy juguetón y muy buena compañía.", fecha:29/08/2016}])
#favors = Favor.find_or_create_by([{titulo: "Busco testigo falso", descrpcion: "El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo. Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.", fecha:29/08/2016}])
#favors = Favor.find_or_create_by([{titulo: "Reencontrarme con Ramirez", descrpcion: "Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico. Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo. *la foto es del 2004, Ramirez puede haber cambiado un poco", fecha:29/08/2016}])
#favors = Favor.find_or_create_by([{titulo: "Busco acompañante de viaje", descrpcion: "Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño. Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente. * Condición fundamental: debe cebar buenos mates", fecha:2016,08,29}])
