Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8CB3A529A0
	for <meta-arago@arago-project.org>;
	Fri, 19 Jul 2013 14:21:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6JEL9V7023666
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 09:21:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6JEL9wg025283
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 09:21:09 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 19 Jul 2013 09:21:09 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH-oe-layersetup 1/2] sample-files: Added
	conf.sample file for GLSDK.
Thread-Index: AQHOe8e+oM8kHwI0tUWgk+X2MHiQpZlrk++AgABihYCAAChpvA==
Date: Fri, 19 Jul 2013 14:21:09 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E838878@DLEE08.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D544074C@DBDE04.ent.ti.com>,
	<7D46E86EC0A8354091174257B2FED10159663682@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159663682@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH-oe-layersetup 1/2] sample-files: Added conf.sample file for GLSDK.
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
X-List-Received-Date: Fri, 19 Jul 2013 14:21:14 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E838878DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E838878DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMSDK has it's own local-amsdk.conf.sample file and uses it successfully. G=
LSDK should have copied theirs from AMSDK and change the branding, instead =
of copying from linaro one...


Denys


-----Original Message-----
From: Maupin, Chase [chase.maupin@ti.com]
Received: Friday, 19 Jul 2013, 7:58
To: Hingolikar, Mrinmayee [mrinmayee@ti.com]; meta-arago@arago-project.org =
[meta-arago@arago-project.org]
Subject: Re: [meta-arago] [PATCH-oe-layersetup 1/2] sample-files: Added con=
f.sample file for GLSDK.

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Friday, July 19, 2013 1:04 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH-oe-layersetup 1/2] sample-files:
>Added conf.sample file for GLSDK.
>
>
> * The local-glsdk.conf.sample files conrains the GLSDK branding.
>   It will be used to generate local.conf by oe-layertool-setup.sh
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> ...-linaro.conf.sample =3D> local-glsdk.conf.sample} |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)  copy sample-
>files/{local-arago-linaro.conf.sample =3D> local-glsdk.conf.sample}
>(99%)
>
>diff --git a/sample-files/local-arago-linaro.conf.sample b/sample-
>files/local-glsdk.conf.sample
>similarity index 99%
>copy from sample-files/local-arago-linaro.conf.sample
>copy to sample-files/local-glsdk.conf.sample
>index 24d14dc..a9abea2 100644
>--- a/sample-files/local-arago-linaro.conf.sample
>+++ b/sample-files/local-glsdk.conf.sample
>@@ -146,7 +146,6 @@ PARALLEL_MAKE =3D "-j 1"
> # be appropriate for example
>
> DISTRO   =3D "arago"
>-TOOLCHAIN_BRAND =3D "linaro"

Why are you removing this?

>
> # Set terminal types by default it expects gnome-terminal  # but
>we chose xterm @@ -158,3 +157,6 @@ BB_GENERATE_MIRROR_TARBALLS =3D
>"0"
>
> # Uncomment this to remove work directory after packaging to save
>disk space  #INHERIT +=3D "rm_work"
>+
>+# Use GLSDK branding
>+ARAGO_BRAND =3D "glsdk"

I'm curious why the AMSDK doesn't use this and can use the base config file=
.  I would suggest checking with them so you two can be aligned and consist=
ent between SDKs.

>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE72E838878DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">AMSDK has it's own local-amsdk.conf.sample file and uses i=
t successfully. GLSDK should have copied theirs from AMSDK and change the b=
randing, instead of copying from linaro
 one...<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Maupin, Chase [chase.maupin@ti.com]<br>
<b>Received:</b> Friday, 19 Jul 2013, 7:58<br>
<b>To:</b> Hingolikar, Mrinmayee [mrinmayee@ti.com]; meta-arago@arago-proje=
ct.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> Re: [meta-arago] [PATCH-oe-layersetup 1/2] sample-files: Ad=
ded conf.sample file for GLSDK.<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">&gt;-----Original Message-----<br>
&gt;From: meta-arago-bounces@arago-project.org [<a href=3D""></a>mailto:met=
a-arago-<br>
&gt;bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee<br>
&gt;Sent: Friday, July 19, 2013 1:04 AM<br>
&gt;To: meta-arago@arago-project.org<br>
&gt;Subject: [meta-arago] [PATCH-oe-layersetup 1/2] sample-files:<br>
&gt;Added conf.sample file for GLSDK.<br>
&gt;<br>
&gt;<br>
&gt; * The local-glsdk.conf.sample files conrains the GLSDK branding.<br>
&gt;&nbsp;&nbsp; It will be used to generate local.conf by oe-layertool-set=
up.sh<br>
&gt;<br>
&gt;Signed-off-by: Mrinmayee Hingolikar &lt;mrinmayee@ti.com&gt;<br>
&gt;---<br>
&gt; ...-linaro.conf.sample =3D&gt; local-glsdk.conf.sample} |&nbsp;&nbsp;&=
nbsp; 4 &#43;&#43;&#43;-<br>
&gt; 1 files changed, 3 insertions(&#43;), 1 deletions(-)&nbsp; copy sample=
-<br>
&gt;files/{local-arago-linaro.conf.sample =3D&gt; local-glsdk.conf.sample}<=
br>
&gt;(99%)<br>
&gt;<br>
&gt;diff --git a/sample-files/local-arago-linaro.conf.sample b/sample-<br>
&gt;files/local-glsdk.conf.sample<br>
&gt;similarity index 99%<br>
&gt;copy from sample-files/local-arago-linaro.conf.sample<br>
&gt;copy to sample-files/local-glsdk.conf.sample<br>
&gt;index 24d14dc..a9abea2 100644<br>
&gt;--- a/sample-files/local-arago-linaro.conf.sample<br>
&gt;&#43;&#43;&#43; b/sample-files/local-glsdk.conf.sample<br>
&gt;@@ -146,7 &#43;146,6 @@ PARALLEL_MAKE =3D &quot;-j 1&quot;<br>
&gt; # be appropriate for example<br>
&gt;<br>
&gt; DISTRO&nbsp;&nbsp; =3D &quot;arago&quot;<br>
&gt;-TOOLCHAIN_BRAND =3D &quot;linaro&quot;<br>
<br>
Why are you removing this?<br>
<br>
&gt;<br>
&gt; # Set terminal types by default it expects gnome-terminal&nbsp; # but<=
br>
&gt;we chose xterm @@ -158,3 &#43;157,6 @@ BB_GENERATE_MIRROR_TARBALLS =3D<=
br>
&gt;&quot;0&quot;<br>
&gt;<br>
&gt; # Uncomment this to remove work directory after packaging to save<br>
&gt;disk space&nbsp; #INHERIT &#43;=3D &quot;rm_work&quot;<br>
&gt;&#43;<br>
&gt;&#43;# Use GLSDK branding<br>
&gt;&#43;ARAGO_BRAND =3D &quot;glsdk&quot;<br>
<br>
I'm curious why the AMSDK doesn't use this and can use the base config file=
.&nbsp; I would suggest checking with them so you two can be aligned and co=
nsistent between SDKs.<br>
<br>
&gt;--<br>
&gt;1.7.0.4<br>
&gt;<br>
&gt;_______________________________________________<br>
&gt;meta-arago mailing list<br>
&gt;meta-arago@arago-project.org<br>
&gt;<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=
">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E838878DLEE08entticom_--
