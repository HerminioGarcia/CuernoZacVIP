using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Text;
using System.Xml;
using System.Xml.Xsl;

public partial class _Default : System.Web.UI.Page
{
    public string menuCuernoVip = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] == null)
        {
            menuCuernoVip = "0";
        }
        else
        {
            menuCuernoVip = Request.QueryString["Id"];
        }
        TransformarXML();
    }
    private void TransformarXML()
    {
        //recuperamos las rutas de nuestro xml y xslt

        string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/cuernoMesero.xml";
        string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xslt/cuerno.xslt";

        //leer el archivo xml

        XmlTextReader xmlTextReader = new XmlTextReader(xmlPath);

        XmlUrlResolver resolver = new XmlUrlResolver();

        resolver.Credentials = CredentialCache.DefaultCredentials;

        XsltSettings settings = new XsltSettings(true, true);

        XslCompiledTransform xslt = new XslCompiledTransform();
        xslt.Load(xsltPath, settings, resolver);

        StringBuilder stringBuilder = new StringBuilder();
        TextWriter tWritter = new StringWriter(stringBuilder);


        //configuramos los argumentos para la trasformacion
        XsltArgumentList xsltArgumentList = new XsltArgumentList();
        //pasamos la variable del tipo menu al xslt
        xsltArgumentList.AddParam("MenuCuernoVip", "", menuCuernoVip);

        //trasformamos el xml => html usuando xslt
        xslt.Transform(xmlTextReader, xsltArgumentList, tWritter);

        //Obtenemos el resultado de la transformacion como una sola cadena
        string resultado = stringBuilder.ToString();

        //Escribimos el resultado como respuesta html
        Response.Write(resultado);
    }
}