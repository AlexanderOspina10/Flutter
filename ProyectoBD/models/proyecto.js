const {Schema, model } = require('mongoose')

const ProyectoSchema = ({
    nombreProyecto:{
        type: String,
        unique:true,
        required:[true, 'El nombre de Proyecto es requirido']
    },

    puntajeProyecto:{
        type: Number,
        required:[true, 'El Precio Proyecto es requirido']
    },

    Foto: {
        type:String,
        required:[true, 'El Iva Proyecto es requirido']
    },

});

module.exports = model('Proyecto', ProyectoSchema);