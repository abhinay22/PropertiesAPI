﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PropertiesAPI.DTO
{
    public class Negotiator
    {
        public int NegotiatorId { get; set; }
        public string Name { get; set; }
        public string? Email { get; set; }
        public string? WebSite { get; set; }
    }
}
