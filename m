Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 6CEE152995
	for <meta-arago@arago-project.org>;
	Fri, 24 Feb 2017 18:49:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1OInlPc029874
	for <meta-arago@arago-project.org>; Fri, 24 Feb 2017 12:49:47 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1OInfTA020188
	for <meta-arago@arago-project.org>; Fri, 24 Feb 2017 12:49:41 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1OIncZI015685
	for <meta-arago@arago-project.org>; Sat, 25 Feb 2017 00:19:39 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Sat, 25 Feb 2017 00:19:37 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [master] packagegroup-*-addons: enable
	glsdk-example-apps
Thread-Index: AQHSjmw8tT+Vsx7Ue0WdsEIpcFL+ZqF4FMGAgABr5Cc=
Date: Fri, 24 Feb 2017 18:49:36 +0000
Message-ID: <24B88602B5904F49971CAF899152529B82012A6C@DBDE04.ent.ti.com>
References: <1487919859-151383-1-git-send-email-a0393906@ti.com>,
	<20170224175326.GP26872@edge>
In-Reply-To: <20170224175326.GP26872@edge>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master] packagegroup-*-addons: enable glsdk-example-apps
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
X-List-Received-Date: Fri, 24 Feb 2017 18:49:57 -0000
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_24B88602B5904F49971CAF899152529B82012A6CDBDE04entticom_"

--_000_24B88602B5904F49971CAF899152529B82012A6CDBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, it does. Just checked it today morning.





From: Dmytriyenko, Denys<mailto:denys@ti.com>
Sent: 24 February 2017 23:23
To: R, Karthik<mailto:karthik.ramanan@ti.com>
Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: Re: [meta-arago] [master] packagegroup-*-addons: enable glsdk-exam=
ple-apps



Does it actually build? I disabled it last time because it was breaking.


On Fri, Feb 24, 2017 at 12:34:19PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-tisdk-addons.bb
> index 97184b1..291816d 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION =3D "Task to install additional utilities/demos for SDKs"
>  LICENSE =3D "MIT"
> -PR =3D "r55"
> +PR =3D "r56"
>
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
> @@ -54,10 +54,10 @@ UTILS_append_omap-a15 =3D " mmc-utils \
>                            uio-module-drv-test \
>  "
>
> -#                        glsdk-example-apps
>  UTILS_append_dra7xx =3D " canutils \
>                          dsptop \
>                          gdbc6x \
> +                        glsdk-example-apps \
>  "
>
>  UTILS_append_keystone =3D " \
> --
> 1.9.1
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_24B88602B5904F49971CAF899152529B82012A6CDBDE04entticom_
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
<style>
<!--
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
span.x_MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline}
.x_MsoChpDefault
	{}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">Yes, it does. Just checked it today morning.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p class=3D"x_MsoNormal" style=3D"border:none; padding:0cm"><b>From: </b><a=
 href=3D"mailto:denys@ti.com">Dmytriyenko, Denys</a><br>
<b>Sent: </b>24 February 2017 23:23<br>
<b>To: </b><a href=3D"mailto:karthik.ramanan@ti.com">R, Karthik</a><br>
<b>Cc: </b><a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago=
-project.org</a><br>
<b>Subject: </b>Re: [meta-arago] [master] packagegroup-*-addons: enable gls=
dk-example-apps</p>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Does it actually build? I disabled it last time be=
cause it was breaking.<br>
<br>
<br>
On Fri, Feb 24, 2017 at 12:34:19PM &#43;0530, Karthik Ramanan wrote:<br>
&gt; Signed-off-by: Karthik Ramanan &lt;a0393906@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.b=
b&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43;&#43;--<br>
&gt;&nbsp; 1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-tisdk-addons.bb<br>
&gt; index 97184b1..291816d 100644<br>
&gt; --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
tisdk-addons.bb<br>
&gt; &#43;&#43;&#43; b/meta-arago-distro/recipes-core/packagegroups/package=
group-arago-tisdk-addons.bb<br>
&gt; @@ -1,6 &#43;1,6 @@<br>
&gt;&nbsp; DESCRIPTION =3D &quot;Task to install additional utilities/demos=
 for SDKs&quot;<br>
&gt;&nbsp; LICENSE =3D &quot;MIT&quot;<br>
&gt; -PR =3D &quot;r55&quot;<br>
&gt; &#43;PR =3D &quot;r56&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;&nbsp; <br>
&gt; @@ -54,10 &#43;54,10 @@ UTILS_append_omap-a15 =3D &quot; mmc-utils \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; uio-module-drv-test \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; <br>
&gt; -#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; glsd=
k-example-apps<br>
&gt;&nbsp; UTILS_append_dra7xx =3D &quot; canutils \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; dsptop \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; gdbc6x \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
lsdk-example-apps \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; UTILS_append_keystone =3D &quot; \<br>
&gt; -- <br>
&gt; 1.9.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_24B88602B5904F49971CAF899152529B82012A6CDBDE04entticom_--
