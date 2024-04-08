const {Router} = require('express')

const route = Router()

//Listar todos los datos
const {getProyecto, postProyecto,putProyecto,deleteProyecto} = require('../controllers/proyecto') //Importando el controlador

route.get('/', getProyecto)

route.post('/', postProyecto)

route.put('/', putProyecto)

route.delete('/', deleteProyecto)


module.exports = route