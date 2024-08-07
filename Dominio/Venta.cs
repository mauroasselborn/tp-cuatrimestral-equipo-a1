﻿using System;
using System.Collections.Generic;

namespace Dominio
{
    public class Venta
    {
        public int Id { get; set; }
        public string nroFactura { get; set; }
        public List<ItemVenta> Items { get; set; }
        public Cliente cliente { get; set; }
        public DateTime FechaVenta { get; set; }
        public MetodoPago MetodoPago { get; set; }
        public float Total { get; set; }
        public int? CantidadCuotas { get; set; }

    }
}
