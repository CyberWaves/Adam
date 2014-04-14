using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AdminData;


namespace AdminLogic
{
    public class LogicAcademicYear
    {
       private readonly AdamEntities _ctx = new AdamEntities();

        public List<tblAcademicYear> GetAcademicYear()
        {
            if (_ctx.tblAcademicYears != null) return _ctx.tblAcademicYears.ToList();
            
            return null;

        }
    }
}
