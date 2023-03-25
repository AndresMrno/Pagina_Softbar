import { Categoria } from "./categoria";

export class Producto {

    id_producto : number;
    nombre_producto : String;
    id_categoria : Categoria;
    precio : number;
    descripcion: String;
    cantidad: number;
}

