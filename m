Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 303C752998
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 20:18:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OKIBBN014839
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 15:18:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OKIBMK016724
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 15:18:11 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 15:18:11 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
Thread-Index: AQHOuWG4snie7ylq/E+cD/8wo+NX95nVpV6A//+uQA0=
Date: Tue, 24 Sep 2013 20:18:11 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E8B1DE5@DLEE08.ent.ti.com>
References: <1380055815-19631-1-git-send-email-Chase.Maupin@ti.com>,
	<8F29D6B095ED194EA1980491A5E029710C55CF17@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C55CF17@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Tue, 24 Sep 2013 20:18:13 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E8B1DE5DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E8B1DE5DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack


Denys


-----Original Message-----
From: Cooper Jr., Franklin [fcooper@ti.com]
Received: Tuesday, 24 Sep 2013, 16:10
To: Maupin, Chase [chase.maupin@ti.com]; meta-arago@arago-project.org [meta=
-arago@arago-project.org]
Subject: Re: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_=
DIR

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Tuesday, September 24, 2013 3:50 PM
> To: meta-arago@arago-project.org
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
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
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
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE72E8B1DE5DLEE08entticom_
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
pt; color:black">Ack<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Cooper Jr., Franklin [fcooper@ti.com]<br>
<b>Received:</b> Tuesday, 24 Sep 2013, 16:10<br>
<b>To:</b> Maupin, Chase [chase.maupin@ti.com]; meta-arago@arago-project.or=
g [meta-arago@arago-project.org]<br>
<b>Subject:</b> Re: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly =
set DL_DIR<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Acked-by: Franklin Cooper Jr. &lt;fcooper@ti.com&g=
t;<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: meta-arago-bounces@arago-project.org [<a href=3D""></a>mailto:me=
ta-arago-<br>
&gt; bounces@arago-project.org] On Behalf Of Maupin, Chase<br>
&gt; Sent: Tuesday, September 24, 2013 3:50 PM<br>
&gt; To: meta-arago@arago-project.org<br>
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
&gt; Signed-off-by: Chase Maupin &lt;Chase.Maupin@ti.com&gt;<br>
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
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E8B1DE5DLEE08entticom_--
