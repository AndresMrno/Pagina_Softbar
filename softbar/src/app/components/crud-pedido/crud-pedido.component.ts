import { Component, OnInit } from '@angular/core';
import { Domicilio } from 'src/app/models/Domicilio/domicilio';
import { Pedido } from 'src/app/models/Domicilio/pedido';
import {PedidoService} from 'src/app/services/domicilio/pedido.service'
import Swal from 'sweetalert2';

@Component({
  selector: 'app-crud-pedido',
  templateUrl: './crud-pedido.component.html',
  styleUrls: ['./crud-pedido.component.scss']
})
export class CrudPedidoComponent implements OnInit {

  domicilios : Domicilio[] = [];
  pedidos : Pedido[] = [];

  constructor(private pedidoService : PedidoService) { }

  ngOnInit(): void {

    this.pedidoService.getPedido()
    .subscribe(response => this.pedidos=response);
  }

  eliminarPedido(id_pedido){
    this.pedidoService.eliminarPedido(id_pedido)
    .subscribe(response=>{
      if(response===true){
        this.pedidos.pop();
      }
      Swal.fire('Pedido Eliminado','Pedido eliminado con exito','success');
    })
  }

  
}
