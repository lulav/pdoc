<%def name="pdoc()">
  html, body {
    margin: 0;
    padding: 0;
    min-height: 100%;
  }
  body {
    background: #fff;
    font-family: "Source Sans Pro", "Helvetica Neueue", Helvetica, sans;
    font-weight: 300;
    font-size: 16px;
    line-height: 1.6em;
  }
  #content {
    width: 70%;
    max-width: 850px;
    float: left;
    padding: 30px 60px;
    border-left: 1px solid #ddd;
  }
  #sidebar {
    width: 25%;
    float: left;
    padding: 30px;
    overflow: hidden;
  }
  #nav {
    font-size: 130%;
    margin: 0 0 15px 0;
  }

  #top {
    display: block;
    position: fixed;
    bottom: 5px;
    left: 5px;
    font-size: .85em;
    text-transform: uppercase;
  }

  #footer {
    font-size: .75em;
    padding: 5px 30px;
    border-top: 1px solid #ddd;
    text-align: right;
  }
    #footer p {
      margin: 0 0 0 30px;
      display: inline-block;
    }

  h1, h2, h3, h4, h5 {
    font-weight: 300;
  }
  h1 {
    font-size: 2.5em;
    line-height: 1.1em;
    margin: 0 0 .50em 0;
  }

  h2 {
    font-size: 1.75em;
    margin: 1em 0 .50em 0;
  }

  h3 {
    margin: 25px 0 10px 0;
  }

  h4 {
    margin: 0;
    font-size: 105%;
  }

  a {
    color: #058;
    text-decoration: none;
    transition: color .3s ease-in-out;
  }

  a:hover {
    color: #e08524;
    transition: color .3s ease-in-out;
  }

  pre, code, .mono, .name {
    font-family: "Ubuntu Mono", "Cousine", "DejaVu Sans Mono", monospace;
  }

  .title .name {
    font-weight: bold;
  }
  .section-title {
    margin-top: 2em;
  }
  .ident {
    color: #900;
  }

  code {
    background: #f9f9f9;
  } 

  pre {
    background: #fefefe;
    border: 1px solid #ddd;
    box-shadow: 2px 2px 0 #f3f3f3;
    margin: 0 30px;
    padding: 15px 30px;
  }

  table#module-list {
    font-size: 110%;
  }

    table#module-list tr td:first-child {
      padding-right: 10px;
      white-space: nowrap;
    }

    table#module-list td {
      vertical-align: top;
      padding-bottom: 8px;
    }

      table#module-list td p {
        margin: 0 0 7px 0;
      }

  .def {
    display: table;
  }

    .def p {
      display: table-cell;
      vertical-align: top;
      text-align: left;
    }

    .def p:first-child {
      white-space: nowrap;
    }

    .def p:last-child {
      width: 100%;
    }


  #index {
    list-style-type: none;
    margin: 0;
    padding: 0;
  }
    ul#index .class_name {
      /* font-size: 110%; */
      font-weight: bold;
    }
    #index ul {
      margin: 0;
    }

  .item {
    margin: 0 0 15px 0;
  }

    .item .class {
      margin: 0 0 25px 30px;
    }

      .item .class ul.class_list {
        margin: 0 0 20px 0;
      }

    .item .name {
      background: #fafafa;
      margin: 0;
      font-weight: bold;
      padding: 5px 10px;
      border-radius: 3px;
      display: inline-block;
      min-width: 40%;
    }
      .item .name:hover {
        background: #f6f6f6;
      }

    .item .empty_desc {
      margin: 0 0 5px 0;
      padding: 0;
    }

    .item .inheritance {
      margin: 3px 0 0 30px;
    }

    .item .inherited {
      color: #666;
    }

    .item .desc {
      padding: 0 8px;
      margin: 0;
    }

      .item .desc p {
        margin: 0 0 10px 0;
      }

    .source summary {
      background: #ffc;
      font-weight: 400;
      font-size: .8em;
      width: 11em;
      text-transform: uppercase;
      padding: 0px 8px;
      border: 1px solid #fd6;
      border-radius: 5px;
      cursor: pointer;
    }
    .source summary:hover { background: #fe9 !important }
    .source { margin-left: 8px }
    .source[open] summary { background: #fda }

    .source pre {
      max-height: 500px;
      overflow-y: scroll;
      margin-bottom: 15px;
    }

  .desc h1, .desc h2, .desc h3 {
    font-size: 100% !important;
  }
  .clear {
    clear: both;
  }

  @media all and (max-width: 950px) {
    #sidebar {
      width: 35%;
    }
    #content {
      width: 65%;
    }
  }
  @media all and (max-width: 650px) {
    #top {
      display: none;
    }
    #sidebar {
      float: none;
      width: auto;
    }
    #content {
      float: none;
      width: auto;
      padding: 30px;
    }

    #index ul {
      padding: 0;
      margin-bottom: 15px;
    }
    #index ul li {
      display: inline-block;
      margin-right: 30px;
    }
    #footer {
      text-align: left;
    }
    #footer p {
      display: block;
      margin: inherit;
    }
  }

  /*****************************/
</%def>

<%def name="post()">
/* ==========================================================================
   EXAMPLE Media Queries for Responsive Design.
   These examples override the primary ('mobile first') styles.
   Modify as content requires.
   ========================================================================== */

@media only screen and (min-width: 35em) {
    /* Style adjustments for viewports that meet the condition */
}

@media print,
       (-o-min-device-pixel-ratio: 5/4),
       (-webkit-min-device-pixel-ratio: 1.25),
       (min-resolution: 120dpi) {
    /* Style adjustments for high resolution devices */
}

/* ==========================================================================
   Print styles.
   Inlined to avoid required HTTP connection: h5bp.com/r
   ========================================================================== */

@media print {
    * {
        background: transparent !important;
        color: #000 !important; /* Black prints faster: h5bp.com/s */
        box-shadow: none !important;
        text-shadow: none !important;
    }

    a,
    a:visited {
        text-decoration: underline;
    }

    a[href]:after {
        content: " (" attr(href) ")";
    }

    abbr[title]:after {
        content: " (" attr(title) ")";
    }

    /*
     * Don't show links for images, or javascript/internal links
     */

    .ir a:after,
    a[href^="javascript:"]:after,
    a[href^="#"]:after {
        content: "";
    }

    pre,
    blockquote {
        border: 1px solid #999;
        page-break-inside: avoid;
    }

    thead {
        display: table-header-group; /* h5bp.com/t */
    }

    tr,
    img {
        page-break-inside: avoid;
    }

    img {
        max-width: 100% !important;
    }

    @page {
        margin: 0.5cm;
    }

    p,
    h2,
    h3 {
        orphans: 3;
        widows: 3;
    }

    h2,
    h3 {
        page-break-after: avoid;
    }
}
</%def>
