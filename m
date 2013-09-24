Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 356F352998
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 20:23:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OKNg8r017820
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 15:23:42 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OKNgGT023226
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 15:23:42 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 15:23:42 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
Thread-Index: AQHOuWG4snie7ylq/E+cD/8wo+NX95nVpV6A//+uQA2AAAGCIA==
Date: Tue, 24 Sep 2013 20:23:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159749B0C@DLEE11.ent.ti.com>
References: <1380055815-19631-1-git-send-email-Chase.Maupin@ti.com>,
	<8F29D6B095ED194EA1980491A5E029710C55CF17@DFLE08.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E8B1DE5@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E8B1DE5@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
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
X-List-Received-Date: Tue, 24 Sep 2013 20:23:43 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED10159749B0CDLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED10159749B0CDLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Pushed.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

From: Dmytriyenko, Denys
Sent: Tuesday, September 24, 2013 3:18 PM
To: Maupin, Chase; meta-arago@arago-project.org; Cooper Jr., Franklin
Subject: RE: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_=
DIR

Ack


Denys


-----Original Message-----
From: Cooper Jr., Franklin [fcooper@ti.com]
Received: Tuesday, 24 Sep 2013, 16:10
To: Maupin, Chase [chase.maupin@ti.com]; meta-arago@arago-project.org<mailt=
o:meta-arago@arago-project.org> [meta-arago@arago-project.org]
Subject: Re: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_=
DIR
Acked-by: Franklin Cooper Jr. <fcooper@ti.com<mailto:fcooper@ti.com>>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arag=
o-project.org> [mailto:meta-arago-
> bounces@arago-project.org<mailto:bounces@arago-project.org>] On Behalf Of=
 Maupin, Chase
> Sent: Tuesday, September 24, 2013 3:50 PM
> To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_DI=
R
>
> * This script took a parameter using -d to set the DL_DIR but
>   ignored that setting.  Now if that is set make it the DL_DIR
>   value in conf/local.conf
> * When running this script to get updates changes that were made
>   to DL_DIR were lost because local.conf was copied over.  Now
>   the script will use the old DL_DIR setting.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com<mailto:Chase.Maupin@ti.c=
om>>
>
> ---
> * Updated in version 2
>     * Removed sh -x setting which was accidentally left over
>     * Fixed typo in commit message
> ---
>  oe-layertool-setup.sh |   17 ++++++++++++++++-
>  1 files changed, 16 insertions(+), 1 deletions(-)
>
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh index
> 55cd174..72e36a2 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -732,6 +732,22 @@ EOM
>      threads=3D`cat /proc/cpuinfo | grep -c processor`
>      sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE =3D \"-j ${threads}\"/"
> $confdir/local.conf
>      sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS =3D
> \"${threads}\"/" $confdir/local.conf
> +
> +    # Find if old DL_DIR was set
> +    if [ -e $confdir/local.conf.bak ]
> +    then
> +        old_dldir=3D`cat $confdir/local.conf.bak | grep -e "^DL_DIR =3D"=
 | sed
> 's|DL_DIR =3D ||' | sed 's/"//g'`
> +    else
> +        old_dldir=3D"$dldir"
> +    fi
> +
> +    # If command line option was not set use the old dldir
> +    if [ "x$dldir" =3D=3D "x" ]
> +    then
> +        dldir=3D$old_dldir
> +    fi
> +
> +    sed -i "s|^DL_DIR.*|DL_DIR =3D \"${dldir}\"|" $confdir/local.conf
>  }
>
>
> @@ -838,7 +854,6 @@ cd -
>  sourcedir=3D"$oebase/sources"
>  builddir=3D"$oebase/build"
>  confdir=3D"$builddir/conf"
> -dldir=3D"$oebase/downloads"
>
>  check_input
>
> --
> 1.7.0.4
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_7D46E86EC0A8354091174257B2FED10159749B0CDLEE11entticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Pushed.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Sincerely,<br>
Chase Maupin<br>
Integration Team Manager<br>
Linux Core Product Development<br>
e-mail: chase.maupin@ti.com<br>
phone: (214) 567-2950<br>
<br>
For support:<br>
Forums - <a href=3D"http://community.ti.com/forums/">http://community.ti.co=
m/forums/</a><br>
Wiki - <a href=3D"http://wiki.davincidsp.com/">http://wiki.davincidsp.com/<=
/a></span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&=
quot;sans-serif&quot;;color:#1F497D">
<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Dmytriye=
nko, Denys
<br>
<b>Sent:</b> Tuesday, September 24, 2013 3:18 PM<br>
<b>To:</b> Maupin, Chase; meta-arago@arago-project.org; Cooper Jr., Frankli=
n<br>
<b>Subject:</b> RE: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly =
set DL_DIR<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:bla=
ck">Ack<br>
<br>
<br>
Denys<br>
<br>
<br>
-----Original Message----- <br>
<b>From:</b> Cooper Jr., Franklin [fcooper@ti.com]<br>
<b>Received:</b> Tuesday, 24 Sep 2013, 16:10<br>
<b>To:</b> Maupin, Chase [chase.maupin@ti.com]; <a href=3D"mailto:meta-arag=
o@arago-project.org">
meta-arago@arago-project.org</a> [meta-arago@arago-project.org]<br>
<b>Subject:</b> Re: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly =
set DL_DIR<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Acked-by: Franklin =
Cooper Jr. &lt;<a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>&gt;<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:meta-arago-bounces@arago-project.org">meta-ara=
go-bounces@arago-project.org</a> [mailto:meta-arago-<br>
&gt; <a href=3D"mailto:bounces@arago-project.org">bounces@arago-project.org=
</a>] On Behalf Of Maupin, Chase<br>
&gt; Sent: Tuesday, September 24, 2013 3:50 PM<br>
&gt; To: <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-p=
roject.org</a><br>
&gt; Subject: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL=
_DIR<br>
&gt; <br>
&gt; * This script took a parameter using -d to set the DL_DIR but<br>
&gt;&nbsp;&nbsp; ignored that setting.&nbsp; Now if that is set make it the=
 DL_DIR<br>
&gt;&nbsp;&nbsp; value in conf/local.conf<br>
&gt; * When running this script to get updates changes that were made<br>
&gt;&nbsp;&nbsp; to DL_DIR were lost because local.conf was copied over.&nb=
sp; Now<br>
&gt;&nbsp;&nbsp; the script will use the old DL_DIR setting.<br>
&gt; <br>
&gt; Signed-off-by: Chase Maupin &lt;<a href=3D"mailto:Chase.Maupin@ti.com"=
>Chase.Maupin@ti.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; * Updated in version 2<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * Removed sh -x setting which was accidentally=
 left over<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * Fixed typo in commit message<br>
&gt; ---<br>
&gt;&nbsp; oe-layertool-setup.sh |&nbsp;&nbsp; 17 &#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp; 1 files changed, 16 insertions(&#43;), 1 deletions(-)<br>
&gt; <br>
&gt; diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh index<br>
&gt; 55cd174..72e36a2 100755<br>
&gt; --- a/oe-layertool-setup.sh<br>
&gt; &#43;&#43;&#43; b/oe-layertool-setup.sh<br>
&gt; @@ -732,6 &#43;732,22 @@ EOM<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; threads=3D`cat /proc/cpuinfo | grep -c p=
rocessor`<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i &quot;s/^PARALLEL_MAKE.*/PARALLEL=
_MAKE =3D \&quot;-j ${threads}\&quot;/&quot;<br>
&gt; $confdir/local.conf<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i &quot;s/^BB_NUMBER_THREADS.*/BB_N=
UMBER_THREADS =3D<br>
&gt; \&quot;${threads}\&quot;/&quot; $confdir/local.conf<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; # Find if old DL_DIR was set<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; if [ -e $confdir/local.conf.bak ]<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; then<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_dldir=3D`cat $conf=
dir/local.conf.bak | grep -e &quot;^DL_DIR =3D&quot; | sed<br>
&gt; 's|DL_DIR =3D ||' | sed 's/&quot;//g'`<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; else<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_dldir=3D&quot;$dld=
ir&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; fi<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; # If command line option was not set use the o=
ld dldir<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; if [ &quot;x$dldir&quot; =3D=3D &quot;x&quot; =
]<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; then<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dldir=3D$old_dldir<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; fi<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; sed -i &quot;s|^DL_DIR.*|DL_DIR =3D \&quot;${d=
ldir}\&quot;|&quot; $confdir/local.conf<br>
&gt;&nbsp; }<br>
&gt; <br>
&gt; <br>
&gt; @@ -838,7 &#43;854,6 @@ cd -<br>
&gt;&nbsp; sourcedir=3D&quot;$oebase/sources&quot;<br>
&gt;&nbsp; builddir=3D&quot;$oebase/build&quot;<br>
&gt;&nbsp; confdir=3D&quot;$builddir/conf&quot;<br>
&gt; -dldir=3D&quot;$oebase/downloads&quot;<br>
&gt; <br>
&gt;&nbsp; check_input<br>
&gt; <br>
&gt; --<br>
&gt; 1.7.0.4<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proje=
ct.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
_______________________________________________<br>
meta-arago mailing list<br>
<a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.or=
g</a><br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><o:p></o:p></=
span></p>
</div>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED10159749B0CDLEE11entticom_--
