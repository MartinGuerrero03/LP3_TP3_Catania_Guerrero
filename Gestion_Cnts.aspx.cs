using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LP3_TP3_Catania_Guerrero
{
    public partial class Gestion_Cnts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                completarTabla();
            }
        }

        protected void btAgregar_Click(object sender, EventArgs e)
        {   
            dsABM.InsertParameters["descripcion"].DefaultValue = tbAgrMdf.Text;
            int resultado = dsABM.Insert();
            if (resultado > 0)
            {
                lbResultado.Text = "Cuenta agregada con éxito.";
                completarTabla();
                DropDownList1.DataBind();
                tbAgrMdf.Text = string.Empty;
            }
            else 
            {
                lbResultado.Text = "No se agregó la cuenta.";
                completarTabla();
            }
        }

        protected void completarTabla()
        {
            try
            {
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                if (dv != null && dv.Count > 0)
                {
                    // Rellenar cabecera
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Id";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Descripción";
                    headerRow.Cells.Add(headerCell2);

                    Table1.Rows.Add(headerRow);

                    // Rellenar las filas
                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["id"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell2);

                        Table1.Rows.Add(tableRow);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbAgrMdf.Text = DropDownList1.SelectedItem.ToString();
            completarTabla();
        }

        protected void btBorrar_Click(object sender, EventArgs e)
        {
            int resultado = dsABM.Delete();
            if (resultado > 0)
            {

                lbResultado.Text = "Cuenta eliminada.";
                completarTabla();
                DropDownList1.DataBind();
                tbAgrMdf.Text = string.Empty;
            }
            else
            {
                lbResultado.Text = "No se elimino la cuenta.";
                completarTabla();
            }
        }

        protected void btModificar_Click(object sender, EventArgs e)
        {
            int resultado = dsABM.Update();

            if (resultado > 0)
            {
                lbResultado.Text = "Cuenta actualizada.";
                completarTabla();
                DropDownList1.DataBind();
                tbAgrMdf.Text = string.Empty;
            }
            else
            {
                lbResultado.Text = "No se actualizó la cuenta.";
                completarTabla();
            }
        }
    }
}