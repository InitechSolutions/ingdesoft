# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Se agregan por defecto los logros que pueden tener los usuarios, en un futuro
# estos logros pueden ser cambiados segun necesiten los administradores de la
# pagina web
logros = Logro.create ([{ nombre: 'Politico' , min:-999 ,max:-1}])
logros = Logro.create ([{ nombre: 'Observador' , min:0 ,max:0}])
logros = Logro.create ([{ nombre: 'Buen Tipo' ,  min:1 ,max:1}])
logros = Logro.create ([{ nombre: 'Gran Tipo' ,  min:2 ,max:5}])
logros = Logro.create ([{ nombre: 'Tipazo' ,  min:6 ,max:10}])
logros = Logro.create ([{ nombre: 'Heroe' ,  min:11 ,max:20}])
logros = Logro.create ([{ nombre: 'Nobleza Gaucha' ,  min:21 ,max:50}])
logros = Logro.create ([{ nombre: 'Dios' ,  min:51 ,max:999}])
#Se agregan los favores existentes en el blog anterior
Favor.create ([{ descripcion: 'La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?', lugar: '-', titulo: 'Restaurar obra de arte'}])
Favor.create ([{ descripcion: 'Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones. Es muy juguetón y muy buena compañía.', lugar: '-', titulo: 'Karl'}])
Favor.create ([{ descripcion: 'El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo. Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.', lugar: '-', titulo: 'Busco testigo falso'}])
Favor.create ([{ descripcion: 'Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico. Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo. *la foto es del 2004, Ramirez puede haber cambiado un poco', lugar: 'lp', titulo: 'Reencontrarme con Ramirez'}])
Favor.create ([{ descripcion: 'Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño. Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente. * Condición fundamental: debe cebar buenos mates', lugar: 'lp', titulo: 'Busco acompañante de viaje'}])
