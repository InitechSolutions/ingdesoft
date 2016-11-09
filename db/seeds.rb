# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
logros = Logro.create ([{ nombre: 'Politico' ,min:-999 , max:-1}])
logros = Logro.create ([{ nombre: 'Observador' , min:0 ,max:0}])
logros = Logro.create ([{ nombre: 'Buen Tipo' ,  min:1 ,max:1}])
logros = Logro.create ([{ nombre: 'Gran Tipo' ,  min:2 ,max:5}])
logros = Logro.create ([{ nombre: 'Tipazo' ,  min:6 ,max:10}])
logros = Logro.create ([{ nombre: 'Heroe' ,  min:11 ,max:20}])
logros = Logro.create ([{ nombre: 'Nobleza Gaucha' ,  min:21 ,max:50}])
logros = Logro.create ([{ nombre: 'Dios' ,  min:51 ,max:999}])
favors = Favor.create([{titulo: "Restaurar obra de arte", descrpcion: "La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?"}])
