<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:qti="http://www.imsglobal.org/xsd/imsqti_v2p2"
  exclude-result-prefixes="qti">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/assessmentItems">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Examen de japonés básico</title>
        <style>
          :root {
            color-scheme: light;
            --bg: #f4f7fb;
            --card: #ffffff;
            --text: #1f2937;
            --muted: #5b6472;
            --accent: #1f6feb;
            --border: #d8e1ee;
          }

          body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(180deg, #eef4ff 0%, var(--bg) 100%);
            color: var(--text);
          }

          main {
            max-width: 920px;
            margin: 0 auto;
            padding: 32px 20px 56px;
          }

          .hero {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 16px 40px rgba(15, 23, 42, 0.08);
            margin-bottom: 22px;
          }

          .hero h1 {
            margin: 0 0 8px;
            font-size: 2rem;
          }

          .hero p {
            margin: 0;
            color: var(--muted);
            line-height: 1.6;
          }

          .item {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 22px 24px;
            margin: 18px 0;
            box-shadow: 0 8px 28px rgba(15, 23, 42, 0.05);
          }

          .item h2 {
            margin: 0 0 8px;
            font-size: 1.2rem;
          }

          .meta {
            color: var(--muted);
            font-size: 0.95rem;
            margin-bottom: 14px;
          }

          .prompt {
            font-size: 1.05rem;
            margin: 0 0 14px;
            line-height: 1.6;
          }

          ul {
            margin: 0;
            padding-left: 20px;
          }

          li {
            margin: 8px 0;
          }

          .note {
            margin-top: 28px;
            color: var(--muted);
            font-size: 0.95rem;
          }
        </style>
      </head>
      <body>
        <main>
          <section class="hero">
            <h1>Examen de japonés básico</h1>
            <p>Vista generada desde <xsl:value-of select="count(qti:assessmentItem)"/> preguntas QTI para su publicación en GitHub Pages.</p>
          </section>

          <xsl:apply-templates select="qti:assessmentItem"/>

          <p class="note">Este archivo XML usa una hoja XSL para mostrarse como HTML en el navegador.</p>
        </main>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="qti:assessmentItem">
    <section class="item">
      <h2>
        <xsl:value-of select="@title"/>
      </h2>
      <div class="meta">
        <xsl:text>Identificador: </xsl:text>
        <xsl:value-of select="@identifier"/>
      </div>
      <xsl:apply-templates select="qti:itemBody"/>
    </section>
  </xsl:template>

  <xsl:template match="qti:itemBody">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="qti:p">
    <p class="prompt"><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="qti:choiceInteraction">
    <ul>
      <xsl:for-each select="qti:simpleChoice">
        <li>
          <strong><xsl:value-of select="@identifier"/>.</strong>
          <xsl:text> </xsl:text>
          <xsl:value-of select="."/>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <xsl:template match="qti:inlineChoiceInteraction">
    <xsl:text>[</xsl:text>
    <xsl:for-each select="qti:inlineChoice">
      <xsl:value-of select="."/>
      <xsl:if test="position() != last()">
        <xsl:text> | </xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="qti:matchInteraction">
    <p class="prompt">Emparejamiento:</p>
    <ul>
      <xsl:for-each select="qti:simpleMatchSet[1]/qti:simpleAssociableChoice">
        <li><strong><xsl:value-of select="."/></strong></li>
      </xsl:for-each>
    </ul>
    <ul>
      <xsl:for-each select="qti:simpleMatchSet[2]/qti:simpleAssociableChoice">
        <li><xsl:value-of select="."/></li>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <xsl:template match="qti:textEntryInteraction">
    <p class="prompt">Respuesta de texto libre.</p>
  </xsl:template>

  <xsl:template match="qti:orderInteraction">
    <ul>
      <xsl:for-each select="qti:simpleChoice">
        <li>
          <strong><xsl:value-of select="@identifier"/>.</strong>
          <xsl:text> </xsl:text>
          <xsl:value-of select="."/>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>

</xsl:stylesheet>
