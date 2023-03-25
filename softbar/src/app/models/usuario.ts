import { Rol } from "./rol";

export class Usuario {

    id_usuario : number;
    nombre : String;
    apellido : String;
    fecha_nacimiento : Date;
    edad : number;
    correo : String;
    contrasena : String;
    telefono : number;
    direccion : String;
    identificacion : number;
    id_rol : Rol;
}
