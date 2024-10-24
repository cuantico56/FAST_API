<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dgii="http://dgi-fep.mef.gob.pa"
    xmlns:dgi="http://dgi-fep.mef.gob.pa" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl"> 
    <xsl:output method="xml" indent="yes" />

    <!-- Parámetros del constructor al XSL -->
    <xsl:param name="QrBase64Image" />
    <xsl:param name="LogoBase64Image" />
    <xsl:param name="FechaFirma" />
    <xsl:param name="Provincia" />
    <xsl:param name="Municipio" />
    <xsl:param name="PiePagina" />
    <xsl:param name="CodigoSeguridad" />
    <xsl:param name="MarcaAgua" />
	<xsl:variable name="totalDescuentosG" select="sum(//Item/DescuentoMonto)" />

    <!-- Estilo de border: Sin bordes NN  -->
    <xsl:attribute-set name="BordeNN">
        <xsl:attribute name="border-top-style">none</xsl:attribute>
        <xsl:attribute name="border-top-width">0.18mm</xsl:attribute>
        <xsl:attribute name="border-top-color">#d9d9d9</xsl:attribute>
        <xsl:attribute name="border-left-style">none</xsl:attribute>
        <xsl:attribute name="border-left-width">0.18mm</xsl:attribute>
        <xsl:attribute name="border-left-color">#d9d9d9</xsl:attribute>
        <xsl:attribute name="border-right-style">none</xsl:attribute>
        <xsl:attribute name="border-right-width">0.18mm</xsl:attribute>
        <xsl:attribute name="border-right-color">#d9d9d9</xsl:attribute>
        <xsl:attribute name="border-bottom-style">none</xsl:attribute>
        <xsl:attribute name="border-bottom-width">0.18mm</xsl:attribute>
        <xsl:attribute name="border-bottom-color">#d9d9d9</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="BorderEncabezado">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-color">#ffffff</xsl:attribute>
        <xsl:attribute name="border-top-width">0.30cm</xsl:attribute>
    </xsl:attribute-set>
    <!-- Estilo de borde: Top -->
    <xsl:attribute-set name="BordeT">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">0.30mm</xsl:attribute>
        <xsl:attribute name="border-top-color">#BDBEBE</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo de borde: not Top -->
    <xsl:attribute-set name="BordeNT">
        <xsl:attribute name="border-top-style">none</xsl:attribute>
        <xsl:attribute name="border-top-width">0.30mm</xsl:attribute>
        <xsl:attribute name="border-top-color">#BDBEBE</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo de borde: Left -->
    <xsl:attribute-set name="BordeL">
        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-width">0.30mm</xsl:attribute>
        <xsl:attribute name="border-left-color">#BDBEBE</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo de borde: not Left -->
    <xsl:attribute-set name="BordeNL">
        <xsl:attribute name="border-left-style">none</xsl:attribute>
        <xsl:attribute name="border-left-width">0.30mm</xsl:attribute>
        <xsl:attribute name="border-left-color">#BDBEBE</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo de borde: Right -->
    <xsl:attribute-set name="BordeR">
        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">0.30mm</xsl:attribute>
        <xsl:attribute name="border-right-color">#BDBEBE</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo de borde: not Right -->
    <xsl:attribute-set name="BordeNR">
        <xsl:attribute name="border-right-style">none</xsl:attribute>
        <xsl:attribute name="border-right-width">0.30mm</xsl:attribute>
        <xsl:attribute name="border-right-color">#BDBEBE</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo de borde: Bottom -->
    <xsl:attribute-set name="BordeB">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">0.30mm</xsl:attribute>
        <xsl:attribute name="border-bottom-color">#BDBEBE</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="BordeCliente">

        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <!--   <xsl:attribute name="border-top-width">0.30mm</xsl:attribute> -->
        <xsl:attribute name="border-top-color">#5B9BD5</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="BordeClienteB">
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <!--         <xsl:attribute name="border-bottom-width">0.30mm</xsl:attribute> -->
        <xsl:attribute name="border-bottom-color">#5B9BD5</xsl:attribute>

    </xsl:attribute-set>
    <!-- Estilo de borde: not Bottom -->
    <xsl:attribute-set name="BordeNB">
        <xsl:attribute name="border-bottom-style">none</xsl:attribute>
        <xsl:attribute name="border-bottom-width">0.30mm</xsl:attribute>
        <xsl:attribute name="border-bottom-color">#BDBEBE</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo de borde: All -->
    <xsl:attribute-set name="BordeAll">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-width">0.18mm</xsl:attribute>
        <xsl:attribute name="border-top-color">#d9d9d9</xsl:attribute>
        <xsl:attribute name="border-left-style">solid</xsl:attribute>
        <xsl:attribute name="border-left-width">0.18mm</xsl:attribute>
        <xsl:attribute name="border-left-color">#d9d9d9</xsl:attribute>
        <xsl:attribute name="border-right-style">solid</xsl:attribute>
        <xsl:attribute name="border-right-width">0.18mm</xsl:attribute>
        <xsl:attribute name="border-right-color">#d9d9d9</xsl:attribute>
        <xsl:attribute name="border-bottom-style">solid</xsl:attribute>
        <xsl:attribute name="border-bottom-width">0.18mm</xsl:attribute>
        <xsl:attribute name="border-bottom-color">#d9d9d9</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="BordeAll2">
        <xsl:attribute name="border-top-style">solid</xsl:attribute>
        <xsl:attribute name="border-top-color">#ffffff</xsl:attribute>
        <xsl:attribute name="border-top-width">0.10cm</xsl:attribute>

        <xsl:attribute name="border-left-style">none</xsl:attribute>
        <xsl:attribute name="border-left-width">0.18mm</xsl:attribute>

        <xsl:attribute name="border-right-style">none</xsl:attribute>
        <xsl:attribute name="border-right-width">0.18mm</xsl:attribute>

        <xsl:attribute name="border-bottom-style">none</xsl:attribute>
        <xsl:attribute name="border-bottom-width">0.18mm</xsl:attribute>

    </xsl:attribute-set>

    <!-- Estilo fuente título 01  -->
    <xsl:attribute-set name="Titulo01">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-family">Segoe UI Normal</xsl:attribute>
        <!-- Tipo de letra descargar en formato .ttf y poner en proyecto carpeta/fonts-->
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="color">#3B5594</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">45pt</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo texto normal 01  -->
    <xsl:attribute-set name="TextoNormal01">
        <xsl:attribute name="font-size">10.1pt</xsl:attribute>
        <xsl:attribute name="font-family">Segoe UI Normal</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo texto normal Conceptos  -->
    <xsl:attribute-set name="TextoNormalConceptos">
        <xsl:attribute name="font-size">7pt</xsl:attribute>
        <xsl:attribute name="font-family">Segoe UI Normal</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo texto normal 02  -->
    <xsl:attribute-set name="TextoNormal02">
        <xsl:attribute name="font-size">9.7pt</xsl:attribute>
        <xsl:attribute name="font-family">Segoe UI Normal</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo texto mínimo  -->
    <xsl:attribute-set name="TextoMinimo">
        <xsl:attribute name="font-size">7pt</xsl:attribute>
        <xsl:attribute name="font-family">Segoe UI Normal</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="TextoMedio">
        <xsl:attribute name="font-size">7pt</xsl:attribute>
        <xsl:attribute name="font-family">Segoe UI Normal</xsl:attribute>
    </xsl:attribute-set>
    <!-- Estilo texto negrita 01  -->
    <xsl:attribute-set name="TextoNegrita01">
        <xsl:attribute name="font-size">10.1pt</xsl:attribute>
        <xsl:attribute name="font-family">Segoe UI Negrita</xsl:attribute>
    </xsl:attribute-set>

    <!-- Estilo texto negrita 02  -->
    <xsl:attribute-set name="TextoNegrita02">
        <xsl:attribute name="font-size">9pt</xsl:attribute>
        <xsl:attribute name="font-family">Segoe UI Negrita</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <!-- Marca de agua
    Imagen: TFHKA_05_logo_marca_agua_01
    Nota: la imagen png codificada en Base64 debe ser de un tamaño menor a 30 kb
    -->

    <xsl:template name="IsZero">
        <xsl:param name="valor" />
        <xsl:param name="decimales" />
        <xsl:choose>
            <xsl:when test="$valor > 1.00">
                <xsl:value-of select="format-number($valor, '###,###.00')" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="format-number($valor,'0.00')" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="replace-br">
        <xsl:param name="text" select="." />
        <xsl:choose>
            <xsl:when test="not(contains($text, '&lt;br/>'))">
                <xsl:value-of select="$text" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="substring-before($text, '&lt;br/>')" />
                <!-- or <xsl:text>&#xA;</xsl:text>-->
                <fo:block xsl:use-attribute-sets="TextoNormal01">
                    <xsl:call-template name="replace-br">
                        <xsl:with-param name="text" select="substring-after($text, '&lt;br/>')" />
                    </xsl:call-template>
                </fo:block>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="/">
        <fo:root>
            <!-- Variables globales 
            <xsl:variable name="B10_FechaEmision" select="//dgii:Emisor/dgii:FechaEmision"/>-->

            <!-- Formato principal tipo carta -->
            <fo:layout-master-set>
                <fo:simple-page-master master-name="carta-horizontal" page-height="28.9cm" page-width="21.6cm"
                    margin-top="0.8cm" margin-bottom="0.8cm" margin-left="0.8cm" margin-right="0.8cm">
                    <fo:region-body margin-top="8.7cm" margin-bottom="1cm" background-color="white"
                        background-image="url('data:image/png;base64,{$MarcaAgua}')" background-repeat="repeat"
                        background-position-horizontal="center" background-position-vertical="center" />
                    <fo:region-before extent="0.8cm" margin="0.01cm" />
                    <fo:region-after extent="0.8cm" background-color="white" />
                </fo:simple-page-master>

            </fo:layout-master-set>
            <fo:page-sequence master-reference="carta-horizontal">

                <!-- Encabezado -->
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block>
                        <!-- Tabla para el encabezado -->
                        <fo:table table-layout="fixed" width="100%">
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="0.5cm" />
                            <fo:table-column column-width="4cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-body>

                                <xsl:variable name="B06_TipoeCF" select="//IdDoc/TipoeCF" />
                                <!-- Fila 1 del encabezado -->
                                <fo:table-row>
                                    <!-- Logo -->
                                    <fo:table-cell display-align="left" padding="0mm" number-columns-spanned="6"
                                        xsl:use-attribute-sets="BordeNN">
                                        <fo:block-container padding-bottom="2mm">
                                            <fo:block font-family="Segoe UI Normal" font-size="1pt" text-align="left">
                                                <fo:external-graphic content-width="scale-to-fit" height="2.4cm"
                                                    scaling="uniform"
                                                    src="url('data:image/png;base64,{$LogoBase64Image}')" />
                                            </fo:block>
                                        </fo:block-container>
                                    </fo:table-cell>

                                    <!-- Título principal -->
                                    <fo:table-cell padding-right="-3mm" number-columns-spanned="6"
                                        display-align="center" xsl:use-attribute-sets="BordeNN">
                                        <fo:block text-align="right" xsl:use-attribute-sets="Titulo01">

                                            <xsl:choose>
                                                <xsl:when test="$B06_TipoeCF = 31">Factura de Crédito Fiscal Electrónica
                                                </xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 32">Factura de Consumo Electrónica
                                                </xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 33">Nota de Débito Electrónica</xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 34">Nota de Crédito Electrónica
                                                </xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 41">Compras Electrónico</xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 43">Gastos Menores Electrónico</xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 44">Regímenes Especiales Electrónico
                                                </xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 45">Gubernamental Electrónico</xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 46">Comprobante de Exportaciones
                                                    Electrónico</xsl:when>
                                                <xsl:when test="$B06_TipoeCF = 47">Comprobante para Pagos al Exterior
                                                    Electrónico</xsl:when>
                                            </xsl:choose>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

								<xsl:variable name="contingencyDoc" select="//InformacionReferencia/NCFModificado" />
                                <xsl:variable name="contingencyDate" select="//InformacionReferencia/FechaNCFModificado" />
                                <xsl:variable name="codeModificacion" select="//InformacionReferencia/CodigoModificacion" />
                                <xsl:variable name="FechaVenc_01" select="//IdDoc/FechaVencimientoSecuencia" />
                                <xsl:variable name="NCFModificado" select="//InformacionReferencia/NCFModificado" />
                                <!-- Fila 2 del encabezado -->
                                <fo:table-row display-align="center" xsl:use-attribute-sets="BorderEncabezado">
                                    <fo:table-cell padding-left="1mm" display-align="center" number-columns-spanned="7"
                                        font-size="11pt" xsl:use-attribute-sets="TextoNegrita01">
                                        <fo:block>
                                            <xsl:value-of select="//Emisor/RazonSocialEmisor" />
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding-right="-15mm" text-align="right" number-columns-spanned="4.2"
                                        font-weight="bold" xsl:use-attribute-sets="TextoNegrita01">
                                        <fo:block> e-NCF: </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding-right="-3mm" text-align="right" number-columns-spanned="0.8"
                                        xsl:use-attribute-sets="TextoNormal01">
                                        <fo:block>
                                            <xsl:value-of select="//IdDoc/eNCF" />
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <!-- Fila 3 del encabezado -->
                                <fo:table-row display-align="center">
                                    <xsl:variable name="sucursal_01" select="//Emisor/Sucursal" />
                                    <xsl:if test="$sucursal_01 !=''">
                                        <fo:table-cell padding-left="1mm" display-align="center"
                                            number-columns-spanned="2" xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block>Sucursal: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-left="-13mm" display-align="center"
                                            number-columns-spanned="4" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block>
                                                <xsl:value-of select="//Emisor/Sucursal" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>
                                    <xsl:if test="not(//Emisor/Sucursal)">
                                        <fo:table-cell padding-left="1mm" display-align="center"
                                            number-columns-spanned="6" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block> </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>

                                    <!--Valida si existe Fecha de vencimiento-->

                                    <!-- <xsl:if test="$FechaVenc_01 !=''"> -->
                                    <xsl:if test="$FechaVenc_01 !='' and ($B06_TipoeCF !='32' or $B06_TipoeCF ='34')">
                                        <fo:table-cell padding-right="-23mm" text-align="right"
                                            number-columns-spanned="5.2" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block> Fecha Vencimiento: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-right="-3mm" text-align="right"
                                            number-columns-spanned="0.8" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block>
                                                <xsl:value-of select="$FechaVenc_01" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>

                                    <xsl:if
                                        test="($B06_TipoeCF ='33' or $B06_TipoeCF ='34') and not($FechaVenc_01) and $NCFModificado!='' and $codeModificacion!='4'">
                                        <fo:table-cell padding-right="-15mm" text-align="right"
                                            number-columns-spanned="5.2" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block> NCF Modificado: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-right="-3mm" text-align="right"
                                            number-columns-spanned="0.8" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block>
                                                <xsl:value-of select="$NCFModificado" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>

                                </fo:table-row>

                                <!-- Fila 4 del encabezado -->
                                <fo:table-row display-align="center">
                                    <fo:table-cell padding-left="1mm" display-align="center" font-weight="bold"
                                        number-columns-spanned="1" xsl:use-attribute-sets="TextoNegrita01">
                                        <fo:block>RNC: </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding-left="-4mm" display-align="center" number-columns-spanned="5"
                                        xsl:use-attribute-sets="TextoNormal01">
                                        <fo:block>
                                            <xsl:value-of select="//Emisor/RNCEmisor" />
                                        </fo:block>
                                    </fo:table-cell>


                                    <xsl:if test="$B06_TipoeCF !='32' and $B06_TipoeCF !='34' and $NCFModificado!='' and $codeModificacion !='4'">
                                        <fo:table-cell padding-right="-15mm" text-align="right"
                                            number-columns-spanned="5.2" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block> NCF Modificado: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-right="-3mm" text-align="right"
                                            number-columns-spanned="0.8" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block>
                                                <xsl:value-of select="$NCFModificado" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>

                                    <xsl:if test="$contingencyDoc!='' and $codeModificacion ='4'">
                                        <fo:table-cell padding-right="-15mm" text-align="right"
                                            number-columns-spanned="5.2" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block> CONTINGENCIA NCF: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-right="-3mm" text-align="right"
                                            number-columns-spanned="0.8" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block>
                                                <xsl:value-of select="$contingencyDoc" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>

                                    <xsl:if test="($B06_TipoeCF ='33' or $B06_TipoeCF ='34') and not($FechaVenc_01)">
                                        <fo:table-cell padding-right="-3mm" text-align="right"
                                            number-columns-spanned="6" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block>
                                                <xsl:variable name="codModi_01"
                                                    select="//InformacionReferencia/CodigoModificacion" />
                                                <xsl:choose>
                                                    <xsl:when test="$codModi_01 = 1">Anula el NCF modificado</xsl:when>
                                                    <xsl:when test="$codModi_01 = 2">Corrige Texto el Comprobante Fiscal
                                                        modificado</xsl:when>
                                                    <xsl:when test="$codModi_01 = 3">Corrige montos del NCF modificado
                                                    </xsl:when>
                                                    <xsl:when test="$codModi_01 = 4">Reemplazo NCF emitido en
                                                        contingencia</xsl:when>
                                                </xsl:choose>
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>
                                </fo:table-row>

                                <!-- Fila 5 del encabezado -->
                                <fo:table-row display-align="center">
                                    <fo:table-cell padding-left="1mm" number-columns-spanned="2" font-weight="bold"
                                        xsl:use-attribute-sets="TextoNegrita01" display-align="before">
                                        <fo:block>Dirección: </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding-left="-10mm" display-align="center"
                                        number-columns-spanned="7" font-size="10.3pt"
                                        xsl:use-attribute-sets="TextoNormal01">
                                        <fo:block>
                                            <xsl:value-of select="//Emisor/DireccionEmisor" />,
                                            <xsl:value-of select="$Municipio" />,
                                            <xsl:value-of select="$Provincia" />
                                        </fo:block>
                                    </fo:table-cell>


                                    <xsl:variable name="FechaVenc_01" select="//IdDoc/FechaVencimientoSecuencia" />
                                    <xsl:if test="$B06_TipoeCF ='33' or $B06_TipoeCF ='34' and $FechaVenc_01 !=''">
                                        <fo:table-cell padding-right="-3mm" text-align="right"
                                            number-columns-spanned="3" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block>
                                                <xsl:variable name="codModi_01"
                                                    select="//InformacionReferencia/CodigoModificacion" />
                                                <xsl:choose>
                                                    <xsl:when test="$codModi_01 = 1">Anula el NCF modificado</xsl:when>
                                                    <xsl:when test="$codModi_01 = 2">Corrige Texto el Comprobante Fiscal
                                                        modificado</xsl:when>
                                                    <xsl:when test="$codModi_01 = 3">Corrige montos del NCF modificado
                                                    </xsl:when>
                                                    <xsl:when test="$codModi_01 = 4">Reemplazo NCF emitido en
                                                        contingencia</xsl:when>
                                                </xsl:choose>
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>

                                    <xsl:if test="$contingencyDate!='' and $codeModificacion ='4'">
                                        <fo:table-cell padding-right="-15mm" text-align="right"
                                            number-columns-spanned="2.4" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block>Fecha NCF Mod:</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-right="-3mm" text-align="right"
                                            number-columns-spanned="0.8" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block>
                                                <xsl:value-of select="$contingencyDate" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>
                                </fo:table-row>

                                <!-- Fila 6 del encabezado -->
                                <fo:table-row display-align="center">
                                    <fo:table-cell padding-left="1mm" display-align="center" number-columns-spanned="2"
                                        font-weight="bold" xsl:use-attribute-sets="TextoNegrita01">
                                        <fo:block>Fecha Emisión: </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding-left="-2mm" display-align="center" number-columns-spanned="4"
                                        xsl:use-attribute-sets="TextoNormal01">
                                        <fo:block>
                                            <xsl:value-of select="//Emisor/FechaEmision" />
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                
                                <xsl:if test="//IdDoc/TipoeCF!=43">
                                    <!-- Fila 7 del encabezado-->
                                    <fo:table-row display-align="center" xsl:use-attribute-sets="BordeAll2">

                                        <fo:table-cell padding-left="1mm" display-align="center"
                                            number-columns-spanned="2.6" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block>Razón Social Cliente: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-left="-7mm" display-align="left"
                                            number-columns-spanned="5" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block display-align="left">
                                                <xsl:value-of select="//Comprador/RazonSocialComprador" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>

                                    <xsl:variable name="idExtranjero" select="//Comprador/IdentificadorExtranjero" />
                                    <xsl:variable name="rncComprador" select="//Comprador/RNCComprador" />
                                    <!-- Fila 8 del encabezado -->
                                    <fo:table-row display-align="center">


                                        <xsl:choose>
                                            <xsl:when
                                                test="($B06_TipoeCF = '32' or $B06_TipoeCF = '33' or $B06_TipoeCF = '34' or $B06_TipoeCF = '44' or $B06_TipoeCF = '46' or $B06_TipoeCF = '47') and $idExtranjero != '' and not($rncComprador)">
                                                <fo:table-cell padding-left="1mm" display-align="center"
                                                    number-columns-spanned="3.2" font-weight="bold"
                                                    xsl:use-attribute-sets="TextoNegrita01">
                                                    <fo:block>
                                                        Identificador Extranjero:
                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:when>
                                            <xsl:otherwise>

                                                <fo:table-cell padding-left="1mm" display-align="center"
                                                    number-columns-spanned="1.6" font-weight="bold"
                                                    xsl:use-attribute-sets="TextoNegrita01">
                                                    <fo:block>
                                                        <xsl:if test="//Comprador/RNCComprador!=''">RNC Cliente:
                                                        </xsl:if>
                                                    </fo:block>
                                                </fo:table-cell>

                                            </xsl:otherwise>
                                        </xsl:choose>


                                        <xsl:choose>
                                            <xsl:when
                                                test="($B06_TipoeCF = '32' or $B06_TipoeCF = '33' or $B06_TipoeCF = '34' or $B06_TipoeCF = '44' or $B06_TipoeCF = '46' or $B06_TipoeCF = '47') and $idExtranjero != '' and not($rncComprador)">
                                                <fo:table-cell padding-left="-2mm" display-align="left"
                                                    number-columns-spanned="2.4" xsl:use-attribute-sets="TextoNormal01">
                                                    <fo:block>
                                                        <xsl:value-of select="//Comprador/IdentificadorExtranjero" />
                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <fo:table-cell padding-left="-6mm" display-align="left"
                                                    number-columns-spanned="4" xsl:use-attribute-sets="TextoNormal01">
                                                    <fo:block>
                                                        <xsl:value-of select="//Comprador/RNCComprador" />
                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:otherwise>
                                        </xsl:choose>

                                    </fo:table-row>
									<!-- Fila 9 del encabezado -->
									<fo:table-row display-align="center" xsl:use-attribute-sets="BordeAll2">
                                        <fo:table-cell padding-left="1mm" display-align="center"
                                            number-columns-spanned="1.5" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block>Paciente: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-left="-13mm" display-align="left"
                                            number-columns-spanned="5" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block display-align="left">
                                                <xsl:value-of select="//Emisor/InformacionAdicionalEmisor" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
									<!-- Fila 10 del encabezado -->
									<fo:table-row display-align="center" xsl:use-attribute-sets="BordeAll2">
                                        <fo:table-cell padding-left="1mm" display-align="center"
                                            number-columns-spanned="1.5" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block>Factura Interna: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-left="-2mm" display-align="left"
                                            number-columns-spanned="5" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block display-align="left">
                                                <xsl:value-of select="//Emisor/NumeroFacturaInterna" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
									<!-- Fila 11 del encabezado -->
									<fo:table-row display-align="center" xsl:use-attribute-sets="BordeAll2">
                                        <fo:table-cell padding-left="1mm" display-align="center"
                                            number-columns-spanned="1.5" font-weight="bold"
                                            xsl:use-attribute-sets="TextoNegrita01">
                                            <fo:block>Autorizacion: </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding-left="-5mm" display-align="left"
                                            number-columns-spanned="5" xsl:use-attribute-sets="TextoNormal01">
                                            <fo:block display-align="left">
                                                <xsl:value-of select="//Emisor/CodigoVendedor" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:if>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                </fo:static-content>

                <!-- Pie de página -->
                <fo:static-content flow-name="xsl-region-after">
                    <fo:table table-layout="fixed" width="100%">
                        <!--<fo:table-column column-width="16.75cm"/>
                        <fo:table-column column-width="2.74cm"/>-->

                        <fo:table-body>
                            <fo:table-row background-color="#F2F2F2">
                                <fo:table-cell padding="1mm" number-columns-spanned="5" display-align="center"
                                    xsl:use-attribute-sets="BordeT BordeR BordeB BordeL">
                                    <fo:block text-align="center" xsl:use-attribute-sets="TextoMinimo">
                                        The Factory HKA Dominicana SRL.
                                    </fo:block>
                                </fo:table-cell>
								<fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center" xsl:use-attribute-sets="BordeT BordeR BordeB BordeNL">	
									<fo:block text-align="right" xsl:use-attribute-sets="TextoMinimo">
									Página <fo:page-number/> de <fo:page-number-citation ref-id="last-page"/>
									</fo:block>
								</fo:table-cell>
                                <!--<fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center" xsl:use-attribute-sets="BordeT BordeR BordeB BordeNL">	
									<fo:block text-align="right" xsl:use-attribute-sets="TextoMinimo">
									Página <fo:page-number/> de <fo:page-number-citation ref-id="last-page"/>
									</fo:block>
								</fo:table-cell>    -->
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:static-content>

                <!-- Contenido -->
                <fo:flow flow-name="xsl-region-body">
                    <!-- Linea de separación verificar porque no se pinta
                    <fo:block space-before="-7pt" space-after="1pt"> 
                        <fo:leader leader-pattern="rule" rule-style="dotted"
                            rule-thickness="0.35pt" color="black" leader-length="100%" />
                    </fo:block>-->

                    <!-- Separación 
                    <fo:block linefeed-treatment="preserve">
                        <xsl:text> &#xA; </xsl:text>						
                    </fo:block>-->

                    <fo:block>

                        <xsl:variable name="Moneda" select="//OtraMoneda/TipoMoneda" />
                        <xsl:variable name="Descuento" select="//Item/DescuentoMonto" />

                        <!-- Table Ítems, observaciones -->
                        <xsl:variable name="grados_01" select="//Item/GradosAlcohol" />
                        <xsl:if test="$grados_01 !=''"> <!--Si existen grados alcohol-->
                            <fo:table table-layout="fixed" width="100%">
                                <xsl:if test="not(//OtraMoneda/TipoMoneda)">
                                    <xsl:if test="$Descuento !=''">
                                        <fo:table-column column-width="8%" />
                                        <fo:table-column column-width="32%" />
                                        <fo:table-column column-width="12%" />
                                        <fo:table-column column-width="8%" />
                                        <fo:table-column column-width="9%" />
                                        <fo:table-column column-width="9%" />
                                        <fo:table-column column-width="11%" />
                                        <fo:table-column column-width="11%" />
                                    </xsl:if>
                                    <xsl:if test="not(//Item/DescuentoMonto)">
                                        <fo:table-column column-width="10%" />
                                        <fo:table-column column-width="33%" />
                                        <fo:table-column column-width="13%" />
                                        <fo:table-column column-width="10%" />
                                        <fo:table-column column-width="10%" />
                                        <fo:table-column column-width="12%" />
                                        <fo:table-column column-width="12%" />
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="$Moneda !=''">
                                    <xsl:if test="$Descuento !=''">
                                        <fo:table-column column-width="10%" />
                                        <fo:table-column column-width="35%" />
                                        <fo:table-column column-width="14%" />
                                        <fo:table-column column-width="10%" />
                                        <fo:table-column column-width="10%" />
                                        <fo:table-column column-width="10%" />
                                        <fo:table-column column-width="11%" />
                                    </xsl:if>
                                    <xsl:if test="not(//Item/DescuentoMonto)">
                                        <fo:table-column column-width="12%" />
                                        <fo:table-column column-width="37%" />
                                        <fo:table-column column-width="16%" />
                                        <fo:table-column column-width="11%" />
                                        <fo:table-column column-width="11%" />
                                        <fo:table-column column-width="13%" />
                                    </xsl:if>
                                </xsl:if>                                

                                <fo:table-body>
                                    <!-- Fila 1 generales -->
                                    <fo:table-row font-family="Segoe UI Normal" font-size="9pt" background-color="#DEDCDC">
                                        <!-- Tabla de ítems, Encabezado -->
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Cantidad
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Descripción
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Unidad de Medida
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Precio
                                                <xsl:if test="$Moneda !=''">
                                                    (
                                                    <xsl:value-of select="$Moneda" />)
                                                </xsl:if>
                                            </fo:block>
                                        </fo:table-cell>
                                        <xsl:if test="$Descuento !=''">
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                                <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                    Descuento
                                                </fo:block>
                                            </fo:table-cell>
                                        </xsl:if>
                                        <!-- Grados Alcohol en % -->
                                        <fo:table-cell padding="0.5mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Grados Alcohol en %
                                            </fo:block>
                                        </fo:table-cell>

                                        <xsl:if test="not(//OtraMoneda/TipoMoneda)">
                                            <fo:table-cell padding="0.5mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                                <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                    ITBIS
                                                </fo:block>
                                            </fo:table-cell>
                                        </xsl:if>
                                        
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Valor
                                                <xsl:if test="$Moneda !=''">
                                                    (
                                                    <xsl:value-of select="$Moneda" />)
                                                </xsl:if>
                                            </fo:block>
                                            
                                        </fo:table-cell>

                                    </fo:table-row>

                                    <xsl:variable name="IndicadorMG" select="//IndicadorMontoGravado" />
                                    <!-- Ítems, valores -->
                                    <xsl:for-each select="//Item">
                                        <fo:table-row xsl:use-attribute-sets="BordeT BordeB TextoNormalConceptos">

                                            <!-- Valor del descuento sobre el ítems (si existe) -->
                                            <xsl:variable name="ItemDesc" select="DescuentoMonto" />
											<xsl:variable name="totalDescuentosG" select="sum($ItemDesc)" />
                                            <xsl:variable name="itemCargo_01" select="RecargoMonto" />
                                            <xsl:variable name="IndicadorFac" select="IndicadorFacturacion" />
                                            <xsl:variable name="PrecioUnit" select="PrecioUnitarioItem" />
											<xsl:variable name="PrecioUnitOtra" select="OtraMonedaDetalle/PrecioOtraMoneda" />
                                            <xsl:variable name="DescuentoSimbolo" select="TablaSubDescuento/SubDescuento/TipoSubDescuento"  />
											<xsl:variable name="DescripcionIt" select="DescripcionItem" />

                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR BordeL">
                                                <fo:block text-align="center">
                                                    <xsl:value-of select="CantidadItem" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="left">
                                                    <!--Descriptor (E) de Excento cuando Identificador de facturación es 4-->
                                                    <xsl:if test="$IndicadorFac = 4">
                                                        (E)
                                                    </xsl:if>
                                                    <!--         <xsl:value-of select="NombreItem" />	 -->

                                                    <xsl:call-template name="replace-br">
                                                        <xsl:with-param name="text" select="NombreItem" />
                                                    </xsl:call-template>
													<fo:block>
                                                        <xsl:if test="$DescripcionIt !=''">
                                                            <fo:block>
                                                                 : 
                                                                <xsl:value-of select="$DescripcionIt" /> B/.
                                                            </fo:block>
                                                        </xsl:if>
                                                    </fo:block>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="center">
                                                    <xsl:variable name="UnidMed" select="UnidadMedida" />
                                                    <xsl:choose>
                                                        <xsl:when test="$UnidMed = '1'">BARR</xsl:when>
                                                        <xsl:when test="$UnidMed = '2'">BOL</xsl:when>
                                                        <xsl:when test="$UnidMed = '3'">BOT</xsl:when>
                                                        <xsl:when test="$UnidMed = '4'">BULTO</xsl:when>
                                                        <xsl:when test="$UnidMed = '5'">BOTELLA</xsl:when>
                                                        <xsl:when test="$UnidMed = '6'">CAJ</xsl:when>
                                                        <xsl:when test="$UnidMed = '7'">CAJETILLA</xsl:when>
                                                        <xsl:when test="$UnidMed = '8'">CM</xsl:when>
                                                        <xsl:when test="$UnidMed = '9'">CIL</xsl:when>
                                                        <xsl:when test="$UnidMed = '10'">CONJ</xsl:when>
                                                        <xsl:when test="$UnidMed = '11'">CONT</xsl:when>
                                                        <xsl:when test="$UnidMed = '12'">DÍA</xsl:when>
                                                        <xsl:when test="$UnidMed = '13'">DOC</xsl:when>
                                                        <xsl:when test="$UnidMed = '14'">FARD</xsl:when>
                                                        <xsl:when test="$UnidMed = '15'">GL</xsl:when>
                                                        <xsl:when test="$UnidMed = '16'">GRAD</xsl:when>
                                                        <xsl:when test="$UnidMed = '17'">GR</xsl:when>
                                                        <xsl:when test="$UnidMed = '18'">GRAN</xsl:when>
                                                        <xsl:when test="$UnidMed = '19'">HOR</xsl:when>
                                                        <xsl:when test="$UnidMed = '20'">HUAC</xsl:when>
                                                        <xsl:when test="$UnidMed = '21'">KG</xsl:when>
                                                        <xsl:when test="$UnidMed = '22'">kWh</xsl:when>
                                                        <xsl:when test="$UnidMed = '23'">LB</xsl:when>
                                                        <xsl:when test="$UnidMed = '24'">LITRO</xsl:when>
                                                        <xsl:when test="$UnidMed = '25'">LOT</xsl:when>
                                                        <xsl:when test="$UnidMed = '26'">Metro</xsl:when>
                                                        <xsl:when test="$UnidMed = '27'">M2</xsl:when>
                                                        <xsl:when test="$UnidMed = '28'">M3</xsl:when>
                                                        <xsl:when test="$UnidMed = '29'">MMBTU</xsl:when>
                                                        <xsl:when test="$UnidMed = '30'">MIN</xsl:when>
                                                        <xsl:when test="$UnidMed = '31'">PAQ</xsl:when>
                                                        <xsl:when test="$UnidMed = '32'">PAR</xsl:when>
                                                        <xsl:when test="$UnidMed = '33'">PIE</xsl:when>
                                                        <xsl:when test="$UnidMed = '34'">PZA</xsl:when>
                                                        <xsl:when test="$UnidMed = '35'">ROL</xsl:when>
                                                        <xsl:when test="$UnidMed = '36'">SOBR</xsl:when>
                                                        <xsl:when test="$UnidMed = '37'">SEG</xsl:when>
                                                        <xsl:when test="$UnidMed = '38'">TANQUE</xsl:when>
                                                        <xsl:when test="$UnidMed = '39'">TONE</xsl:when>
                                                        <xsl:when test="$UnidMed = '40'">TUB</xsl:when>
                                                        <xsl:when test="$UnidMed = '41'">YD</xsl:when>
                                                        <xsl:when test="$UnidMed = '42'">YD2</xsl:when>
                                                        <xsl:when test="$UnidMed = '43'">UND</xsl:when>
                                                        <xsl:when test="$UnidMed = '44'">EA</xsl:when>
                                                        <xsl:when test="$UnidMed = '45'">MILLAR</xsl:when>
                                                        <xsl:when test="$UnidMed = '46'">SAC</xsl:when>
                                                        <xsl:when test="$UnidMed = '47'">LAT</xsl:when>
                                                        <xsl:when test="$UnidMed = '48'">DIS</xsl:when>
                                                        <xsl:when test="$UnidMed = '49'">BID</xsl:when>
                                                        <xsl:when test="$UnidMed = '50'">RAC</xsl:when>
                                                    </xsl:choose>

                                                </fo:block>
                                            </fo:table-cell>
                                            <!--Precio-->
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="right">
                                                    <xsl:if test="not(//OtraMoneda/TipoMoneda)">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="$PrecioUnit" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="$Moneda !=''">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="$PrecioUnitOtra" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
                                                </fo:block>
                                            </fo:table-cell>

                                            <!--Descuentos-->
                                            <xsl:if test="$ItemDesc !=''">
                                                <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                    <fo:block text-align="right">
                                                        <xsl:call-template name="IsZero">
                                                            <xsl:with-param name="valor"
                                                                select="$ItemDesc" />
                                                            <xsl:with-param name="decimales" select="2" />
                                                        </xsl:call-template>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:if>
                                            <xsl:if test="$Descuento !='' and not($ItemDesc)">
                                                <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                    <fo:block text-align="right">
                                                        0.00
                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:if>

                                            <!-- Grados Alcohol en % -->
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="right">
                                                    <xsl:value-of select="GradosAlcohol" />%
                                                </fo:block>
                                            </fo:table-cell>

                                            <xsl:if test="not(//OtraMoneda/TipoMoneda)">
                                                <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                    xsl:use-attribute-sets="BordeR">
                                                    <fo:block text-align="right">

                                                        <!-- Calculos ITBIS cuando Indicador Monto Gravado es 0 -->
                                                        <xsl:if test="$IndicadorMG = 0 ">
                                                            <xsl:if test="$IndicadorFac = 1 ">
                                                                <!-- <xsl:value-of select="format-number(MontoItem * 0.18, '#,###.00')" /> -->
                                                                <xsl:call-template name="IsZero">
                                                                    <xsl:with-param name="valor" select="MontoItem * 0.18" />
                                                                    <xsl:with-param name="decimales" select="2" />
                                                                </xsl:call-template>
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 2 ">
                                                                <!-- <xsl:value-of select="format-number(MontoItem * 0.16, '#,###.00')" /> -->
                                                                <xsl:call-template name="IsZero">
                                                                    <xsl:with-param name="valor" select="MontoItem * 0.16" />
                                                                    <xsl:with-param name="decimales" select="2" />
                                                                </xsl:call-template>
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 3 ">
                                                                0.00
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 4 ">

                                                            </xsl:if>
                                                        </xsl:if>

                                                        <!-- Calculos ITBIS cuando Indicador Monto Gravado es 1 -->
                                                        <xsl:if test="$IndicadorMG = 1 ">
                                                            <xsl:if test="$IndicadorFac = 1 ">
                                                                <!-- <xsl:value-of select="format-number((MontoItem div 1.18)* 0.18, '#,###.00')" /> -->
                                                                <xsl:call-template name="IsZero">
                                                                    <xsl:with-param name="valor" select="(MontoItem div 1.18)* 0.18" />
                                                                    <xsl:with-param name="decimales" select="2" />
                                                                </xsl:call-template>
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 2 ">
                                                                <!--   <xsl:value-of select="format-number((MontoItem div 1.16)* 0.16, '#,###.00')" /> -->
                                                                <xsl:call-template name="IsZero">
                                                                    <xsl:with-param name="valor" select="(MontoItem div 1.16)* 0.16" />
                                                                    <xsl:with-param name="decimales" select="2" />
                                                                </xsl:call-template>
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 3 ">
                                                                0.00
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 4 "> </xsl:if>
                                                        </xsl:if>

                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:if>

                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center" background-color="#F2F2F2"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="right">
													<xsl:if test="not(//OtraMoneda/TipoMoneda)">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="MontoItem" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="$Moneda !=''">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="OtraMonedaDetalle/MontoItemOtraMoneda" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>

                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>
                                </fo:table-body>

                            </fo:table>
                        </xsl:if>
                        <xsl:if test="not(//Item/GradosAlcohol)">
                            <fo:table table-layout="fixed" width="100%"> <!--No existen grados alcohol-->
                                <xsl:if test="not(//OtraMoneda/TipoMoneda)">
                                    <xsl:if test="$Descuento !=''">
                                        <fo:table-column column-width="9%" />
                                        <fo:table-column column-width="36%" />
                                        <fo:table-column column-width="11%" />
                                        <fo:table-column column-width="11%" />
                                        <fo:table-column column-width="11%" />
                                        <fo:table-column column-width="11%" />
                                        <fo:table-column column-width="11%" />
                                    </xsl:if>
                                    <xsl:if test="not(//Item/DescuentoMonto)">
                                        <fo:table-column column-width="10%" />
                                        <fo:table-column column-width="38%" />
                                        <fo:table-column column-width="13%" />
                                        <fo:table-column column-width="13%" />
                                        <fo:table-column column-width="13%" />
                                        <fo:table-column column-width="13%" />
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="$Moneda !=''">
                                    <xsl:if test="$Descuento !=''">
                                        <fo:table-column column-width="11%" />
                                        <fo:table-column column-width="36%" />
                                        <fo:table-column column-width="14%" />
                                        <fo:table-column column-width="12%" />
                                        <fo:table-column column-width="15%" />
                                        <fo:table-column column-width="12%" />
                                    </xsl:if>
                                    <xsl:if test="not(//Item/DescuentoMonto)">
                                        <fo:table-column column-width="13%" />
                                        <fo:table-column column-width="40%" />
                                        <fo:table-column column-width="15%" />
                                        <fo:table-column column-width="17%" />
                                        <fo:table-column column-width="15%" />
                                    </xsl:if>
                                </xsl:if>
                                
                                <fo:table-body>
                                    <!-- Fila 1 generales -->
                                    <fo:table-row font-family="Segoe UI Normal" font-size="9pt" background-color="#DEDCDC">
                                        <!-- Tabla de ítems, Encabezado -->
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Cantidad
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Descripción
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Unidad de Medida
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Precio
                                                <xsl:if test="$Moneda !=''">
                                                    (
                                                    <xsl:value-of select="$Moneda" />)
                                                </xsl:if>
                                            </fo:block>
                                        </fo:table-cell>

                                        <xsl:if test="$Descuento !=''">
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                                <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                    Descuento
													<xsl:if test="$Moneda !=''">
                                                    (
                                                    <xsl:value-of select="$Moneda" />)
                                                </xsl:if>
                                                </fo:block>
                                            </fo:table-cell>
                                        </xsl:if>

                                        <xsl:if test="not(//OtraMoneda/TipoMoneda)">
                                            <fo:table-cell padding="0.5mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                                <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                    ITBIS
                                                </fo:block>
                                            </fo:table-cell>
                                        </xsl:if>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                            <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                                Valor
                                                <xsl:if test="$Moneda !=''">
                                                    (
                                                    <xsl:value-of select="$Moneda" />)
                                                </xsl:if>
                                            </fo:block>
                                        </fo:table-cell>

                                    </fo:table-row>

                                    <xsl:variable name="IndicadorMG" select="//IndicadorMontoGravado" />
                                    <!-- Ítems, valores -->
                                    <xsl:for-each select="//Item">
                                        <fo:table-row xsl:use-attribute-sets="BordeT BordeB TextoNormalConceptos">

                                            <!-- Valor del descuento sobre el ítems (si existe) -->
                                            <xsl:variable name="ItemDesc" select="DescuentoMonto" />
											<xsl:variable name="totalDescuentosG" select="sum($ItemDesc)" />
                                            <xsl:variable name="itemCargo_01" select="RecargoMonto" />
                                            <xsl:variable name="IndicadorFac" select="IndicadorFacturacion" />
                                            <xsl:variable name="PrecioUnit" select="PrecioUnitarioItem" />
											<xsl:variable name="PrecioUnitOtra" select="OtraMonedaDetalle/PrecioOtraMoneda" />
											<xsl:variable name="DescuentoOtra" select="OtraMonedaDetalle/DescuentoOtraMoneda" />
											<xsl:variable name="DescripcionIt" select="DescripcionItem" />
                                            <xsl:variable name="DescuentoSimbolo" select="TablaSubDescuento/SubDescuento/TipoSubDescuento"  />

                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR BordeL">
                                                <fo:block text-align="center">
                                                    <xsl:value-of select="CantidadItem" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="left">
                                                    <!--Descriptor (E) de Excento cuando Identificador de facturación es 4-->
                                                    <xsl:if test="$IndicadorFac = 4">
                                                        (E)
                                                    </xsl:if>
                                                    <!--         <xsl:value-of select="NombreItem" />	 -->

                                                    <xsl:call-template name="replace-br">
                                                        <xsl:with-param name="text" select="NombreItem" /> B/.
                                                    </xsl:call-template>
													<fo:block>
                                                        <xsl:if test="$DescripcionIt !=''">
                                                            <fo:block>
                                                                   
                                                                <xsl:value-of select="$DescripcionIt" /> 
                                                            </fo:block>
                                                        </xsl:if>
                                                    </fo:block>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="center">
                                                    <xsl:variable name="UnidMed" select="UnidadMedida" />
                                                    <xsl:choose>
                                                        <xsl:when test="$UnidMed = '1'">BARR</xsl:when>
                                                        <xsl:when test="$UnidMed = '2'">BOL</xsl:when>
                                                        <xsl:when test="$UnidMed = '3'">BOT</xsl:when>
                                                        <xsl:when test="$UnidMed = '4'">BULTO</xsl:when>
                                                        <xsl:when test="$UnidMed = '5'">BOTELLA</xsl:when>
                                                        <xsl:when test="$UnidMed = '6'">CAJ</xsl:when>
                                                        <xsl:when test="$UnidMed = '7'">CAJETILLA</xsl:when>
                                                        <xsl:when test="$UnidMed = '8'">CM</xsl:when>
                                                        <xsl:when test="$UnidMed = '9'">CIL</xsl:when>
                                                        <xsl:when test="$UnidMed = '10'">CONJ</xsl:when>
                                                        <xsl:when test="$UnidMed = '11'">CONT</xsl:when>
                                                        <xsl:when test="$UnidMed = '12'">DÍA</xsl:when>
                                                        <xsl:when test="$UnidMed = '13'">DOC</xsl:when>
                                                        <xsl:when test="$UnidMed = '14'">FARD</xsl:when>
                                                        <xsl:when test="$UnidMed = '15'">GL</xsl:when>
                                                        <xsl:when test="$UnidMed = '16'">GRAD</xsl:when>
                                                        <xsl:when test="$UnidMed = '17'">GR</xsl:when>
                                                        <xsl:when test="$UnidMed = '18'">GRAN</xsl:when>
                                                        <xsl:when test="$UnidMed = '19'">HOR</xsl:when>
                                                        <xsl:when test="$UnidMed = '20'">HUAC</xsl:when>
                                                        <xsl:when test="$UnidMed = '21'">KG</xsl:when>
                                                        <xsl:when test="$UnidMed = '22'">kWh</xsl:when>
                                                        <xsl:when test="$UnidMed = '23'">LB</xsl:when>
                                                        <xsl:when test="$UnidMed = '24'">LITRO</xsl:when>
                                                        <xsl:when test="$UnidMed = '25'">LOT</xsl:when>
                                                        <xsl:when test="$UnidMed = '26'">Metro</xsl:when>
                                                        <xsl:when test="$UnidMed = '27'">M2</xsl:when>
                                                        <xsl:when test="$UnidMed = '28'">M3</xsl:when>
                                                        <xsl:when test="$UnidMed = '29'">MMBTU</xsl:when>
                                                        <xsl:when test="$UnidMed = '30'">MIN</xsl:when>
                                                        <xsl:when test="$UnidMed = '31'">PAQ</xsl:when>
                                                        <xsl:when test="$UnidMed = '32'">PAR</xsl:when>
                                                        <xsl:when test="$UnidMed = '33'">PIE</xsl:when>
                                                        <xsl:when test="$UnidMed = '34'">PZA</xsl:when>
                                                        <xsl:when test="$UnidMed = '35'">ROL</xsl:when>
                                                        <xsl:when test="$UnidMed = '36'">SOBR</xsl:when>
                                                        <xsl:when test="$UnidMed = '37'">SEG</xsl:when>
                                                        <xsl:when test="$UnidMed = '38'">TANQUE</xsl:when>
                                                        <xsl:when test="$UnidMed = '39'">TONE</xsl:when>
                                                        <xsl:when test="$UnidMed = '40'">TUB</xsl:when>
                                                        <xsl:when test="$UnidMed = '41'">YD</xsl:when>
                                                        <xsl:when test="$UnidMed = '42'">YD2</xsl:when>
                                                        <xsl:when test="$UnidMed = '43'">UND</xsl:when>
                                                        <xsl:when test="$UnidMed = '44'">EA</xsl:when>
                                                        <xsl:when test="$UnidMed = '45'">MILLAR</xsl:when>
                                                        <xsl:when test="$UnidMed = '46'">SAC</xsl:when>
                                                        <xsl:when test="$UnidMed = '47'">LAT</xsl:when>
                                                        <xsl:when test="$UnidMed = '48'">DIS</xsl:when>
                                                        <xsl:when test="$UnidMed = '49'">BID</xsl:when>
                                                        <xsl:when test="$UnidMed = '50'">RAC</xsl:when>
                                                    </xsl:choose>

                                                </fo:block>
                                            </fo:table-cell>
                                            <!--Precio-->
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="right">
													<xsl:if test="not(//OtraMoneda/TipoMoneda)">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="$PrecioUnit" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="$Moneda !=''">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="$PrecioUnitOtra" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
                                                </fo:block>
                                            </fo:table-cell>
                                            <!--Descuentos-->
                                            <xsl:if test="$ItemDesc !=''">
                                                <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="right">
													<xsl:if test="not(//OtraMoneda/TipoMoneda)">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="$ItemDesc" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="$Moneda !=''">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="$DescuentoOtra" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
                                                </fo:block>
                                               </fo:table-cell>
                                            </xsl:if>
                                            <xsl:if test="$Descuento !='' and not($ItemDesc)">
                                                <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                xsl:use-attribute-sets="BordeR">
                                                    <fo:block text-align="right">
                                                        0.00
                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:if>

                                            <xsl:if test="not(//OtraMoneda/TipoMoneda)">
                                                <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                    xsl:use-attribute-sets="BordeR">
                                                    <fo:block text-align="right">

                                                        <!-- Calculos ITBIS cuando Indicador Monto Gravado es 0 -->
                                                        <xsl:if test="$IndicadorMG = 0 ">
                                                            <xsl:if test="$IndicadorFac = 1 ">
                                                                <!-- <xsl:value-of select="format-number(MontoItem * 0.18, '#,###.00')" /> -->
                                                                <xsl:call-template name="IsZero">
                                                                    <xsl:with-param name="valor" select="MontoItem * 0.18" />
                                                                    <xsl:with-param name="decimales" select="2" />
                                                                </xsl:call-template>
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 2 ">
                                                                <!-- <xsl:value-of select="format-number(MontoItem * 0.16, '#,###.00')" /> -->
                                                                <xsl:call-template name="IsZero">
                                                                    <xsl:with-param name="valor" select="MontoItem * 0.16" />
                                                                    <xsl:with-param name="decimales" select="2" />
                                                                </xsl:call-template>
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 3 ">
                                                                0.00
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 4 ">


                                                            </xsl:if>
                                                        </xsl:if>

                                                        <!-- Calculos ITBIS cuando Indicador Monto Gravado es 1 -->
                                                        <xsl:if test="$IndicadorMG = 1 ">
                                                            <xsl:if test="$IndicadorFac = 1 ">
                                                                <!-- <xsl:value-of select="format-number((MontoItem div 1.18)* 0.18, '#,###.00')" /> -->
                                                                <xsl:call-template name="IsZero">
                                                                    <xsl:with-param name="valor" select="(MontoItem div 1.18)* 0.18" />
                                                                    <xsl:with-param name="decimales" select="2" />
                                                                </xsl:call-template>
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 2 ">
                                                                <!--   <xsl:value-of select="format-number((MontoItem div 1.16)* 0.16, '#,###.00')" /> -->
                                                                <xsl:call-template name="IsZero">
                                                                    <xsl:with-param name="valor" select="(MontoItem div 1.16)* 0.16" />
                                                                    <xsl:with-param name="decimales" select="2" />
                                                                </xsl:call-template>
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 3 ">
                                                                0.00
                                                            </xsl:if>
                                                            <xsl:if test="$IndicadorFac = 4 "> </xsl:if>
                                                        </xsl:if>

                                                    </fo:block>
                                                </fo:table-cell>
                                            </xsl:if>
                                            <!--Valor-->
                                            <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                                background-color="#F2F2F2" xsl:use-attribute-sets="BordeR">
                                                <fo:block text-align="right">
                                                    <xsl:if test="not(//OtraMoneda/TipoMoneda)">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="MontoItem" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="$Moneda !=''">
														<xsl:call-template name="IsZero">
															<xsl:with-param name="valor"
																select="OtraMonedaDetalle/MontoItemOtraMoneda" />
															<xsl:with-param name="decimales" select="2" />
														</xsl:call-template>
													</xsl:if>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>
                                </fo:table-body>

                            </fo:table>
                        </xsl:if>


                        <!-- Table QR y totales-->
                        <fo:table table-layout="fixed" width="100%">
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />
                            <fo:table-column column-width="1.5cm" />


                            <xsl:variable name="montoTotal" select="//Totales/MontoTotal" />
                            <fo:table-body>
                                <fo:table-row>
                                    <!-- Logo -->
                                    <fo:table-cell display-align="left" padding="0mm" number-columns-spanned="7"
                                        xsl:use-attribute-sets="BordeNN">
                                        <fo:block-container padding-top="6mm">
                                            <fo:block font-family="Segoe UI Normal" font-size="1pt" text-align="left"
                                                margin-left="8mm" margin-bottom="7mm">
                                                <fo:external-graphic content-width="scale-to-fit" height="2.0cm"
                                                    src="url('data:image/png;base64,{$QrBase64Image}')" />
                                            </fo:block>
                                            <xsl:choose>
                                                <xsl:when test="$montoTotal &lt; 250000.00">                                                   
                                                    <fo:block xsl:use-attribute-sets="TextoMedio" margin-top=".1mm"
                                                        margin-left="8mm">
                                                        Código de Seguridad:
                                                        <xsl:value-of select="$CodigoSeguridad" />
                                                    </fo:block>
													<fo:block xsl:use-attribute-sets="TextoMedio" margin-top="1mm"
                                                        margin-left="8mm">
                                                        Fecha de Firma Digital:
                                                        <xsl:value-of select="$FechaFirma" />
                                                    </fo:block>
                                                </xsl:when>
                                                <xsl:when test="$montoTotal &gt; 250000.00">                                                   
                                                    <fo:block xsl:use-attribute-sets="TextoMedio" margin-top=".1mm"
                                                        margin-left="5mm">
                                                        Código de Seguridad:
                                                        <xsl:value-of select="$CodigoSeguridad" />
                                                    </fo:block>
													<fo:block xsl:use-attribute-sets="TextoMedio" margin-top="1mm"
                                                        margin-left="5mm">
                                                        Fecha de Firma Digital:
                                                        <xsl:value-of select="$FechaFirma" />
                                                    </fo:block>
                                                </xsl:when>
                                            </xsl:choose>

                                        </fo:block-container>
                                    </fo:table-cell>
                                    <!-- Totales -->
                                    <fo:table-cell display-align="right" padding="0mm" number-columns-spanned="5"
                                        xsl:use-attribute-sets="BordeNN">
                                        <fo:block-container padding-top="6mm">
                                            <!-- Tabla Totales -->
                                            <fo:table table-layout="fixed" width="100%">
                                                <fo:table-column column-width="6.00cm" />
                                                <fo:table-column column-width="3.50cm" />
                                                <fo:table-body>
                                                    <!-- Subtotal Gravado (si existe) -->
                                                    <xsl:variable name="totalGravado_01" select="//Totales/MontoGravadoTotal" />
													<xsl:variable name="totalGravadoOtra_01" select="//OtraMoneda/MontoGravadoTotalOtraMoneda" />
                                                    <xsl:if test="$totalGravado_01 !=''">
                                                        <fo:table-row>
                                                            <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                                display-align="right"
                                                                xsl:use-attribute-sets="BordeNT BordeNR BordeNB BordeNL">
                                                                <fo:block text-align="right"
                                                                    xsl:use-attribute-sets="TextoNegrita02">
                                                                    Subtotal Gravado:
                                                                    <xsl:if test="$Moneda !='' and $Moneda !='DOP'">
                                                                        (
                                                                        <xsl:value-of select="$Moneda" />)
                                                                    </xsl:if>
                                                                </fo:block>
                                                            </fo:table-cell>
                                                            <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                                display-align="center" background-color="#F2F2F2"
                                                                xsl:use-attribute-sets="BordeT BordeR BordeB BordeL">
                                                                <fo:block text-align="right"
                                                                    xsl:use-attribute-sets="TextoNormalConceptos">
                                                                    <!-- <xsl:value-of select="format-number($totalGravado_01, '#,###.00')" /> -->
																	<xsl:if test="not(//OtraMoneda/TipoMoneda)">
																		<xsl:call-template name="IsZero">
																			<xsl:with-param name="valor"
																				select="$totalGravado_01" />
																			<xsl:with-param name="decimales" select="2" />
																		</xsl:call-template>
																	</xsl:if>
																	<xsl:if test="$Moneda !=''">
																		<xsl:call-template name="IsZero">
																			<xsl:with-param name="valor"
																				select="$totalGravadoOtra_01" />
																			<xsl:with-param name="decimales" select="2" />
																		</xsl:call-template>
																	</xsl:if>
                                                                </fo:block>
                                                            </fo:table-cell>
                                                        </fo:table-row>
                                                    </xsl:if>
													
													<!--*********************SI EXISTE FRANQUICIA**************************************-->
													<xsl:for-each select="//NodoAdicional/Observaciones">
													<xsl:if test="Campo ='Franquicia'">
                                                    <fo:table-row>
                                                        <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                            display-align="center"
                                                            xsl:use-attribute-sets="BordeNT BordeNR BordeNB BordeNL">
                                                            <fo:block text-align="right"
                                                                xsl:use-attribute-sets="TextoNegrita02">
                                                                Total Descuento Franquicia:
                                                                <xsl:if test="$Moneda !=''">
                                                                    (
                                                                    <xsl:value-of select="$Moneda" />)
                                                                </xsl:if>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                            display-align="center" background-color="#F2F2F2"
                                                            xsl:use-attribute-sets="BordeT BordeR BordeB BordeL">
                                                            <fo:block text-align="right"
                                                                xsl:use-attribute-sets="TextoNormalConceptos">
                                                                <fo:block text-align="right">
																	<xsl:value-of select="Valor" />
																</fo:block>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
													</xsl:if>
													</xsl:for-each>
													
													
													<!--*********************SI EXISTE OTROS**************************************-->
													<xsl:for-each select="//NodoAdicional/Observaciones">
													<xsl:if test="Campo ='Otros'">
                                                    <fo:table-row>
                                                        <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                            display-align="center"
                                                            xsl:use-attribute-sets="BordeNT BordeNR BordeNB BordeNL">
                                                            <fo:block text-align="right"
                                                                xsl:use-attribute-sets="TextoNegrita02">
                                                                Total Descuento Otros:
                                                                <xsl:if test="$Moneda !=''">
                                                                    (
                                                                    <xsl:value-of select="$Moneda" />)
                                                                </xsl:if>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                            display-align="center" background-color="#F2F2F2"
                                                            xsl:use-attribute-sets="BordeT BordeR BordeB BordeL">
                                                            <fo:block text-align="right"
                                                                xsl:use-attribute-sets="TextoNormalConceptos">
                                                                <fo:block text-align="right">
																	<xsl:value-of select="Valor" />
																</fo:block>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
													</xsl:if>
													</xsl:for-each>
                                                    <!-- Monto Exonerado (si existe) -->
                                                    <xsl:variable name="totalExento_01"
                                                        select="//Totales/MontoExento" />
                                                    <xsl:variable name="totalExento_ext"
                                                        select="//OtraMoneda/MontoExentoOtraMoneda" />
                                                    <!--Total exento moneda extranjero-->
                                                    <xsl:if test="$totalExento_01 !='' or $totalExento_ext !='' ">
                                                        <fo:table-row>
                                                            <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                                display-align="right"
                                                                xsl:use-attribute-sets="BordeNT BordeNR BordeNB BordeNL">
                                                                <fo:block text-align="right"
                                                                    xsl:use-attribute-sets="TextoNegrita02">
                                                                    Monto Exento:
                                                                    <xsl:if test="$Moneda !=''">
                                                                        (
                                                                        <xsl:value-of select="$Moneda" />)
                                                                    </xsl:if>
                                                                </fo:block>
                                                            </fo:table-cell>
                                                            <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                                display-align="center" background-color="#F2F2F2"
                                                                xsl:use-attribute-sets="BordeT BordeR BordeB BordeL">
                                                                <fo:block text-align="right"
                                                                    xsl:use-attribute-sets="TextoNormalConceptos">
                                                                    <xsl:if test="$Moneda !='' and $Moneda !='DOP'">
                                                                        <!--Total exento moneda extranjero
                                                                        <xsl:value-of select="format-number($totalExento_ext, '#,###.00')" />-->
                                                                        <xsl:call-template name="IsZero">
                                                                            <xsl:with-param name="valor"
                                                                                select="$totalExento_ext" />
                                                                            <xsl:with-param name="decimales"
                                                                                select="2" />
                                                                        </xsl:call-template>
                                                                    </xsl:if>
                                                                    <xsl:if test="not(//OtraMoneda/TipoMoneda) ">
                                                                        <!--     <xsl:value-of select="format-number($totalExento_01, '#,###.00')" /> -->
                                                                        <xsl:call-template name="IsZero">
                                                                            <xsl:with-param name="valor"
                                                                                select="$totalExento_01" />
                                                                            <xsl:with-param name="decimales"
                                                                                select="2" />
                                                                        </xsl:call-template>
                                                                    </xsl:if>
                                                                </fo:block>
                                                            </fo:table-cell>
                                                        </fo:table-row>
                                                    </xsl:if>

                                                    <!-- Total ITBIS (si existe) -->
                                                    <xsl:variable name="totalItbisOtraMoneda_01" select="//OtraMoneda/TotalITBISOtraMoneda" />
                                                    <xsl:variable name="totalItbis_01" select="//Totales/TotalITBIS" />
                                                    
													<xsl:if test="$totalItbis_01 !='' or $totalItbisOtraMoneda_01 !=''">
                                                    <fo:table-row>
                                                        <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                            display-align="center"
                                                            xsl:use-attribute-sets="BordeNT BordeNR BordeNB BordeNL">
                                                            <fo:block text-align="right"
                                                                xsl:use-attribute-sets="TextoNegrita02">
                                                                Total ITBIS:
                                                                <xsl:if test="$Moneda !=''">
                                                                    (
                                                                    <xsl:value-of select="$Moneda" />)
                                                                </xsl:if>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                            display-align="center" background-color="#F2F2F2"
                                                            xsl:use-attribute-sets="BordeT BordeR BordeB BordeL">
                                                            <fo:block text-align="right"
                                                                xsl:use-attribute-sets="TextoNormalConceptos">
                                                                <!--  <xsl:value-of select="format-number($totalItbis_01, '#,###.00')" /> -->
                                                                <xsl:if test="$Moneda !=''">
                                                                    <xsl:call-template name="IsZero">
                                                                        <xsl:with-param name="valor"
                                                                            select="$totalItbisOtraMoneda_01" />
                                                                        <xsl:with-param name="decimales" select="2" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                                <xsl:if test="not(//OtraMoneda/TipoMoneda)">
                                                                    <xsl:call-template name="IsZero">
                                                                        <xsl:with-param name="valor"
                                                                            select="$totalItbis_01" />
                                                                        <xsl:with-param name="decimales" select="2" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
													</xsl:if>
                                                   
												
                                                                                                                                                   
                                                    <!-- Impuesto Adicional (si existe) -->
                                                    <xsl:variable name="impuestoAdici_01"
                                                        select="//Totales/MontoImpuestoAdicional" />
                                                    <xsl:if test="$impuestoAdici_01 !=''">
                                                        <fo:table-row>
                                                            <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                                display-align="center"
                                                                xsl:use-attribute-sets="BordeNT BordeNR BordeNB BordeNL">
                                                                <fo:block text-align="right"
                                                                    xsl:use-attribute-sets="TextoNegrita02">
                                                                    Total Impuesto Adicional:
                                                                    <xsl:if test="$Moneda !=''">
                                                                        (
                                                                        <xsl:value-of select="$Moneda" />)
                                                                    </xsl:if>
                                                                </fo:block>
                                                            </fo:table-cell>
                                                            <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                                display-align="center" background-color="#F2F2F2"
                                                                xsl:use-attribute-sets="BordeT BordeR BordeB BordeL">
                                                                <fo:block text-align="right"
                                                                    xsl:use-attribute-sets="TextoNormalConceptos">
                                                                    <xsl:if
                                                                    test="$Moneda !='' and $Moneda !='DOP' and //OtraMoneda/MontoImpuestoAdicionalOtraMoneda!=''">
                                                                    <!--<xsl:value-of select="format-number(//OtraMoneda/MontoImpuestoAdicionalOtraMoneda, '#,###.00')" /> 
																	Total moneda extranjero-->
																		<xsl:call-template name="IsZero">
																			<xsl:with-param name="valor"
																				select="//OtraMoneda/MontoImpuestoAdicionalOtraMoneda" />
																			<xsl:with-param name="decimales" select="2" />
																		</xsl:call-template>
																	</xsl:if>
                                                                <xsl:if test="not(//OtraMoneda/TipoMoneda) ">
                                                                    <!-- <xsl:value-of select="format-number(//Totales/MontoImpuestoAdicional, '#,###.00')" /> -->
                                                                    <xsl:call-template name="IsZero">
                                                                        <xsl:with-param name="valor"
                                                                            select="//Totales/MontoImpuestoAdicional" />
                                                                        <xsl:with-param name="decimales" select="2" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                                </fo:block>
                                                            </fo:table-cell>
                                                        </fo:table-row>
                                                    </xsl:if>

                                                    <fo:table-row>
                                                        <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                            display-align="center"
                                                            xsl:use-attribute-sets="BordeNT BordeNR BordeNB BordeNL">
                                                            <fo:block text-align="right"
                                                                xsl:use-attribute-sets="TextoNegrita02">
                                                                Total:
                                                                <xsl:if test="$Moneda !=''">
                                                                    (
                                                                    <xsl:value-of select="$Moneda" />)
                                                                </xsl:if>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                        <fo:table-cell padding="1mm" number-columns-spanned="1"
                                                            display-align="center" background-color="#F2F2F2"
                                                            xsl:use-attribute-sets="BordeT BordeR BordeB BordeL">
                                                            <fo:block text-align="right"
                                                                xsl:use-attribute-sets="TextoNormalConceptos">
                                                                <xsl:if
                                                                    test="$Moneda !='' and $Moneda !='DOP' and //OtraMoneda/MontoTotalOtraMoneda!=''">
                                                                    <!--<xsl:value-of select="format-number(//OtraMoneda/MontoTotalOtraMoneda, '#,###.00')" /> 
																	Total moneda extranjero-->
                                                                    <xsl:call-template name="IsZero">
                                                                        <xsl:with-param name="valor"
                                                                            select="//OtraMoneda/MontoTotalOtraMoneda" />
                                                                        <xsl:with-param name="decimales" select="2" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                                <xsl:if test="not(//OtraMoneda/TipoMoneda) ">
                                                                    <!-- <xsl:value-of select="format-number(//Totales/MontoTotal, '#,###.00')" /> -->
                                                                    <xsl:call-template name="IsZero">
                                                                        <xsl:with-param name="valor"
                                                                            select="//Totales/MontoTotal" />
                                                                        <xsl:with-param name="decimales" select="2" />
                                                                    </xsl:call-template>
                                                                </xsl:if>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
                                                </fo:table-body>
                                            </fo:table>
                                        </fo:block-container>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>

                        <!-- Separación -->
                        <fo:block linefeed-treatment="preserve">
                            <xsl:text> &#xA; </xsl:text>	
                            <xsl:text> &#xA; </xsl:text>					
                        </fo:block>


						<xsl:if test="//NodoAdicional/Observaciones/Valor!=''">
                        <!--Observaciones-->
                        <fo:table table-layout="fixed" width="100%">
                            <fo:table-column column-width="70%" />
                            <fo:table-body>
                                <!-- Fila 1 generales -->
                                <fo:table-row font-family="Segoe UI Normal" font-size="9pt" background-color="#DEDCDC">
                                    <!-- Tabla de observaciones, Encabezado -->
                                    <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                        xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                        <fo:block text-align="left" xsl:use-attribute-sets="TextoNegrita02">
                                            Observaciones
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <!-- Obs, valores -->
                                <xsl:for-each select="//NodoAdicional/Observaciones">
                                   <xsl:if test="Campo !='Otros' and Campo !='Franquicia'">																
                                    <fo:table-row xsl:use-attribute-sets="BordeT BordeB TextoNormalConceptos">
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="left"
                                            xsl:use-attribute-sets="BordeR BordeL">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="Campo" /> : <xsl:value-of select="Valor" />
                                            </fo:block>
                                        </fo:table-cell>

                                    </fo:table-row>
									</xsl:if>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
						</xsl:if>

                        <!-- Separación -->
                        <fo:block linefeed-treatment="preserve">
                            <xsl:text> &#xA; </xsl:text>
                            <xsl:text> &#xA; </xsl:text>
                            <xsl:text> &#xA; </xsl:text>						
                            <xsl:text> &#xA; </xsl:text>
                        </fo:block>

						<xsl:if test="//NodoAdicional/Cuotas/NumCuota!=''">
                        <!--Cuotas-->
                        <fo:table table-layout="fixed" width="100%">
                            <fo:table-column column-width="15%" />
                            <fo:table-column column-width="10%" />
                            <fo:table-column column-width="20%" />
                            <fo:table-column column-width="25%" />

                            <fo:table-body>
                                <!-- Fila 1 generales -->
                                <fo:table-row font-family="Segoe UI Normal" font-size="9pt" background-color="#DEDCDC">
                                    <!-- Tabla de cuotas, Encabezado -->
                                    <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                        xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                        <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                            Forma de Pago
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                        xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                        <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                            Monto
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                        xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                        <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                            Fecha Vencimiento
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                        xsl:use-attribute-sets="BordeT BordeR BordeNB BordeL">
                                        <fo:block text-align="center" xsl:use-attribute-sets="TextoNegrita02">
                                            Descripción
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <!-- Cuotas, valores -->
                                <xsl:for-each select="//NodoAdicional/Cuotas">
                                    <fo:table-row xsl:use-attribute-sets="BordeT BordeB TextoNormalConceptos">

                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeR BordeL">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="NumCuota" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeR BordeL">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="Monto" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeR BordeL">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="FechaVencimiento" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="1mm" number-columns-spanned="1" display-align="center"
                                            xsl:use-attribute-sets="BordeR BordeL">
                                            <fo:block text-align="center">
                                                <xsl:value-of select="Descripcion" />
                                            </fo:block>
                                        </fo:table-cell>

                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>

                        </fo:table>
						</xsl:if>

                    </fo:block>

					<fo:block id="last-page" />
                </fo:flow>

            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>