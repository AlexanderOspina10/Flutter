const {response} = require('express')

const Proyecto = require('../models/proyecto')

const getProyecto = async(req, res) => {

    const Proyectos = await Proyecto.find(); //Obtener todos los documentos de una colección
    res.json({
        msg: Proyectos
    })
}

const postProyecto = async(req, res) => {
    const datos = req.body //Capturar datos de la url-postman
    let mensaje = 'Inserción exitosa'
    try {
        const proyecto = new Proyecto(datos) //Instanciar el objeto
        await proyecto.save() //Guardar en la base de dato
        console.log(proyecto)
    } catch (error) {
        mensaje = error
        console.log(error)
    }
    res.json({
        msg: mensaje
    })
}

const putProyecto = async (req, res) => {
    const { _id, nombreProyecto, puntajeProyecto, Foto } = req.body; // desestructura el array con los datos
    let mensaje = '';

    try {
        const proyecto = await Proyecto.findOneAndUpdate(
            {_id: _id}, // Búsqueda
            { nombreProyecto, puntajeProyecto, Foto }, // Campos a editar
            { new: true } // Para obtener el documento actualizado
        );
        
        if (!proyecto) {
            return res.status(404).json({ mensaje: 'No se encontró el Proyecto' });
        }
    
        mensaje = 'Actualización exitosa';
        return res.status(200).json({ mensaje });
    } catch (error) {
        return res.status(500).json({ mensaje: 'Error en el servidor' });
    }
}


const deleteProyecto = async (req, res) => {
    const { id } = req.query;
    let mensaje = '';

    try {
        const proyecto = await Proyecto.findByIdAndDelete(id); // Encuentra y elimina el documento por su _id
        if (!proyecto) {
            return res.status(404).json({ mensaje: 'No se encontró la exportación' });
        }
        mensaje = 'Eliminación exitosa';
    } catch (error) {
        mensaje = error.message;
        return res.status(500).json({ mensaje });
    }

    res.json({ msg: mensaje });
}


module.exports = {
    getProyecto,
    postProyecto,
    putProyecto,
    deleteProyecto
}

