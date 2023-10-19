using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LP3_TP3_Catania_Guerrero
{
    public partial class Registros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                completarTabla();
            }
        }

        protected void completarTabla()
        {
            try
            {
                DataView dv = (DataView)dsGetTransacciones.Select(DataSourceSelectArguments.Empty);
                if (dv != null && dv.Count > 0)
                {
                    // Rellenar cabecera
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Cuenta";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Descripción";
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Monto";
                    headerRow.Cells.Add(headerCell3);

                    TableCell headerCell4 = new TableCell();
                    headerCell4.Text = "Tipo";
                    headerRow.Cells.Add(headerCell4);

                    Table1.Rows.Add(headerRow);

                    // Rellenar las filas
                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["idCuenta"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = row["monto"].ToString();
                        tableRow.Cells.Add(cell3);

                        TableCell cell4 = new TableCell();
                        bool tipo = (bool)row["tipo"];
                        if (tipo)
                            cell4.Text = "Haber";
                        else
                            cell4.Text = "Debe";
                        tableRow.Cells.Add(cell4);


                        Table1.Rows.Add(tableRow);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void dlTransacciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)dsGetTransacciones.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                dlCuentas.SelectedValue = row["idCuenta"].ToString();
                txDescripcion.Text = row["descripcion"].ToString();
                txMonto.Text = row["monto"].ToString();
                dlTipo.SelectedValue = row["tipo"].ToString();
            }
            completarTabla();
        }

        protected void btAgregar_Click(object sender, EventArgs e)
        {
            int resultado = dsABMRegistros.Insert();
            if (resultado > 0)
            {
                lbResultado.Text = "Transacción agregada con éxito.";
                completarTabla();
                dlTransacciones.DataBind();
                txDescripcion.Text = string.Empty;
                txMonto.Text = string.Empty;
            }
            else
            {
                lbResultado.Text = "No se agregó la transacción.";
                completarTabla();
            }
        }

        protected void btModificar_Click(object sender, EventArgs e)
        {
            int resultado = dsABMRegistros.Update();

            if (resultado > 0)
            {
                lbResultado.Text = "Transacción actualizada.";
                completarTabla();
                dlTransacciones.DataBind();
                txDescripcion.Text = string.Empty;
                txMonto.Text = string.Empty;
            }
            else
            {
                lbResultado.Text = "No se actualizó la transacción.";
                completarTabla();
            }
        }

        protected void btEliminar_Click(object sender, EventArgs e)
        {
            int resultado = dsABMRegistros.Delete();
            if (resultado > 0)
            {

                lbResultado.Text = "Registro eliminado.";
                completarTabla();
                dlTransacciones.DataBind();
                txDescripcion.Text = string.Empty;
                txMonto.Text = string.Empty;
            }
            else
            {
                lbResultado.Text = "No se eliminó el registro.";
                completarTabla();
            }
        }

        protected void dlCuentas_SelectedIndexChanged(object sender, EventArgs e)
        {
            completarTabla();
        }
    }
}