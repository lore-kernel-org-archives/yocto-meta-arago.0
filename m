Return-Path: <heroor@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C468D52972
	for <meta-arago@arago-project.org>;
	Mon,  4 Nov 2013 05:47:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA45lJEo012600
	for <meta-arago@arago-project.org>; Sun, 3 Nov 2013 23:47:19 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA45lJdC008560
	for <meta-arago@arago-project.org>; Sun, 3 Nov 2013 23:47:19 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 3 Nov 2013 23:47:19 -0600
Received: from [172.24.81.193] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA45lG5M026929;
	Sun, 3 Nov 2013 23:47:17 -0600
Message-ID: <527734E4.3020204@ti.com>
Date: Mon, 4 Nov 2013 11:17:16 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
References: <4F9216F96E5DF9428610502835A9F49054985DA9@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F49054985DA9@DLEE11.ent.ti.com>
Cc: "Ring, Chris" <cring@ti.com>
Subject: Re: help needed: Need pass variable to autotools .configure
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2013 05:47:21 -0000
Content-Type: multipart/alternative;
	boundary="------------070107020402020002010708"

--------------070107020402020002010708
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sam,
On 11/4/2013 8:36 AM, Nelson, Sam wrote:
>
> Currently , my recipe inherits autotools.
>
> I would like update recipe to pass an environment variable define like 
> the following when executing ./configure command.
>
> VAR_NAME=<dir_name>
>

You could use EXTRA_OECONF to pass extra variables to configure. 
Something like

VAR_NAME = "${S}/foo/bar"
EXTRA_OECONF += "${VAR_NAME}"

> Appreciate help on how this can be achieved in the recipe.
>
> With regards,
>
> Sam
>
>
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--------------070107020402020002010708
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Sam,<br>
      On 11/4/2013 8:36 AM, Nelson, Sam wrote:<br>
    </div>
    <blockquote
      cite="mid:4F9216F96E5DF9428610502835A9F49054985DA9@DLEE11.ent.ti.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Currently , my recipe inherits autotools.<o:p></o:p></p>
        <p class="MsoNormal">I would like update recipe to pass an
          environment variable define like the following when executing
          ./configure command.<o:p></o:p></p>
        <p class="MsoNormal">VAR_NAME=&lt;dir_name&gt;</p>
      </div>
    </blockquote>
    <br>
    You could use EXTRA_OECONF to pass extra variables to configure.
    Something like <br>
    <br>
    VAR_NAME = "${S}/foo/bar"<br>
    EXTRA_OECONF += "${VAR_NAME}"<br>
    <br>
    <blockquote
      cite="mid:4F9216F96E5DF9428610502835A9F49054985DA9@DLEE11.ent.ti.com"
      type="cite">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Appreciate help on how this can be achieved
          in the recipe.<o:p></o:p></p>
        <p class="MsoNormal">With regards,<o:p></o:p></p>
        <p class="MsoNormal">Sam<o:p></o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
meta-arago mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
<a class="moz-txt-link-freetext" href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070107020402020002010708--
