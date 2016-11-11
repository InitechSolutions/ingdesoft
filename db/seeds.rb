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
logros = Logro.find_or_created_by (nombre: 'Politico' , min:-999 ,max:-1)
logros = Logro.find_or_created_by (nombre: 'Observador' , min:0 ,max:0)
logros = Logro.find_or_created_by (nombre: 'Buen Tipo' ,  min:1 ,max:1)
logros = Logro.find_or_created_by (nombre: 'Gran Tipo' ,  min:2 ,max:5)
logros = Logro.find_or_created_by (nombre: 'Tipazo' ,  min:6 ,max:10)
logros = Logro.find_or_created_by (nombre: 'Heroe' ,  min:11 ,max:20)
logros = Logro.find_or_created_by (nombre: 'Nobleza Gaucha' ,  min:21 ,max:50)
logros = Logro.find_or_created_by (nombre: 'Dios' ,  min:51 ,max:999)
#Se agregan los favores existentes en el blog anterior
Favor.create descripcion: 'La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?', lugar: '-', titulo: 'Restaurar obra de arte', user_id:1, imagen: 'http://68.media.tumblr.com/1896249806d9782c28ff10189280cc01/tumblr_oco56fpa3O1ve7p69o1_500.jpg'
Favor.create descripcion: 'Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones. Es muy juguetón y muy buena compañía.', lugar: '-', titulo: 'Karl', user_id:1, imagen: 'http://68.media.tumblr.com/de91daf5796e0b24cf56a1b9bbf751de/tumblr_oco43ijzOj1ve7p69o1_1280.jpg'
Favor.create descripcion: 'El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo. Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.', lugar: '-', titulo: 'Busco testigo falso', user_id:1, imagen: 'http://68.media.tumblr.com/avatar_28012e5b8492_128.png'
Favor.create descripcion: 'Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico. Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo. *la foto es del 2004, Ramirez puede haber cambiado un poco', lugar: 'lp', titulo: 'Reencontrarme con Ramirez', user_id:1, imagen: 'http://68.media.tumblr.com/19f28ea147374e0468cf1bcf6d6ce5ad/tumblr_oco4vrOoFU1ve7p69o2_1280.jpg'
Favor.create descripcion: 'Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño. Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente. * Condición fundamental: debe cebar buenos mates', lugar: 'lp', titulo: 'Busco acompañante de viaje', user_id:1, imagen: 'http://68.media.tumblr.com/avatar_28012e5b8492_128.png'

User.create! nombre: 'Nancy', apellido: 'Ulises', email: 'ulisesynancy@hotmail.com', password: '123456', password_confirmation: '123456', nacimiento:'1980-04-20', admin: true, telefono: '2217362737', localidad: 'La Plata', created_at: '2015-02-06 14:02:10', puntos:0, updated_at: '2015-02-06 14:02:10', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", imagen: 'http://hinnaa.com/wp-content/uploads/2014/08/la-sabiduria-de-la-vieja.-Consejos-de-vieja.jpg'
