Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0769752A6F
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2012 04:08:33 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAE48XuW027647
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 22:08:33 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAE48Xif025951
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2012 22:08:33 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 13 Nov 2012 22:08:33 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] meta-toolchain-arago: special case for
	gdb to be built as part of canadian-cross-sdk
Thread-Index: AQHNwhs2QuM086pw50GQbqDW0wXzn5fpGRWA//+eIBQ=
Date: Wed, 14 Nov 2012 04:08:32 +0000
Message-ID: <05B212D4-8433-4995-88CF-34CF07576A0D@ti.com>
References: <1352865012-11447-1-git-send-email-denys@ti.com>,
	<20121114035851.GE13096@edge>
In-Reply-To: <20121114035851.GE13096@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH] meta-toolchain-arago: special case for gdb to be built as part of canadian-cross-sdk
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
X-List-Received-Date: Wed, 14 Nov 2012 04:08:34 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_05B212D48433499588CF34CF07576A0Dticom_"

--_000_05B212D48433499588CF34CF07576A0Dticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you denys.  We will check for compatibility.  Thanks for the quick re=
sponse on this.

Sent from my cell phone

----- Reply message -----
From: "Dmytriyenko, Denys" <denys@ti.com>
Date: Tue, Nov 13, 2012 9:59 pm
Subject: [meta-arago] [PATCH] meta-toolchain-arago: special case for gdb to=
 be built as part of canadian-cross-sdk
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>

This provides the bare minimum to get the Python-enabled gdb-7.4 into the
devkit and set it up properly. We would need to test it with gdbserver-7.2 =
and
run it through OSRB...

--
Denys


On Tue, Nov 13, 2012 at 10:50:12PM -0500, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-extras/conf/distro/include/tcmode-external-arago.inc | 4 ++++
>  meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb     | 9 ++++=
++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-arago.=
inc b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> index 2ed3df2..3bc0fed 100644
> --- a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> +++ b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc
> @@ -30,6 +30,10 @@ PREFERRED_PROVIDER_glibc-thread-db =3D "external-arago=
-toolchain"
>  PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "ex=
ternal-arago-sdk-toolchain"
>  PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
=3D "external-arago-sdk-toolchain"
>
> +# Special case for gdb to be built as part of canadian-cross-sdk
> +bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${exec_prefi=
x}/bin"
> +PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb=
-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> +
>  GCCVERSION ?=3D "4.5%"
>  SDKGCCVERSION ?=3D "4.5%"
>  BINUVERSION ?=3D "2.20%"
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 1683c1f..f780385 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-${ARMPKGARCH}-${TA=
RGET_OS}-sdk-${SDK_ARCH}"
>
>  require recipes-core/meta/meta-toolchain.bb
>
> -PR =3D "r7"
> +PR =3D "r8"
>
>  SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
>
> @@ -54,6 +54,8 @@ toolchain_create_sdk_env_script () {
>        echo 'export OECORE_ACLOCAL_OPTS=3D"-I $SDK_PATH/usr/share/aclocal=
"' >> $script
>        echo 'export OECORE_DISTRO_VERSION=3D"${DISTRO_VERSION}"' >> $scri=
pt
>        echo 'export OECORE_SDK_VERSION=3D"${SDK_VERSION}"' >> $script
> +     echo 'export PYTHONHOME=3D$SDK_PATH' >> $script
> +     echo 'export PYTHONPATH=3Dlib/python2.7' >> $script
>  }
>
>  populate_sdk_ipk_append () {
> @@ -64,4 +66,9 @@ populate_sdk_ipk_append () {
>                printf "#!/bin/sh\nLD_LIBRARY_PATH=3D\x24SDK_PATH/lib:\x24=
LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x2=
4\x2a\n" > $i
>                chmod +x $i
>        done
> +
> +     # Special case for gdb, which is built as part of canadian-cross-sd=
k
> +     mv ${ARAGO_TARGET_SYS}-gdb ${ARAGO_TARGET_SYS}-gdb.real
> +     printf "#!/bin/sh\nLD_LIBRARY_PATH=3D\x24SDK_PATH/lib:\x24LD_LIBRAR=
Y_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/${ARAGO_TARGET_SYS}-=
gdb.real \x24\x2a\n" > ${ARAGO_TARGET_SYS}-gdb
> +     chmod +x ${ARAGO_TARGET_SYS}-gdb
>  }
> --
> 1.8.0
>
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_05B212D48433499588CF34CF07576A0Dticom_
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
.x_EmailQuote
	{margin-left:1pt;
	padding-left:4pt;
	border-left:#800000 2px solid}
-->
</style>
<div>Thank you denys. &nbsp;We will check for compatibility. &nbsp;Thanks f=
or the quick response on this.<br>
<br>
Sent from my cell phone<br>
<br>
<div id=3D"x_htc_header" style=3D"">----- Reply message -----<br>
From: &quot;Dmytriyenko, Denys&quot; &lt;denys@ti.com&gt;<br>
Date: Tue, Nov 13, 2012 9:59 pm<br>
Subject: [meta-arago] [PATCH] meta-toolchain-arago: special case for gdb to=
 be built as part of canadian-cross-sdk<br>
To: &quot;meta-arago@arago-project.org&quot; &lt;meta-arago@arago-project.o=
rg&gt;<br>
<br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">This provides the bare minimum to get the Python-e=
nabled gdb-7.4 into the
<br>
devkit and set it up properly. We would need to test it with gdbserver-7.2 =
and <br>
run it through OSRB...<br>
<br>
-- <br>
Denys<br>
<br>
<br>
On Tue, Nov 13, 2012 at 10:50:12PM -0500, Denys Dmytriyenko wrote:<br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;denys@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta-arago-extras/conf/distro/include/tcmode-external-arago.inc =
| 4 &#43;&#43;&#43;&#43;<br>
&gt;&nbsp; meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb&nbsp=
;&nbsp;&nbsp;&nbsp; | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp; 2 files changed, 12 insertions(&#43;), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta-arago-extras/conf/distro/include/tcmode-external-ara=
go.inc b/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc<br=
>
&gt; index 2ed3df2..3bc0fed 100644<br>
&gt; --- a/meta-arago-extras/conf/distro/include/tcmode-external-arago.inc<=
br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/conf/distro/include/tcmode-externa=
l-arago.inc<br>
&gt; @@ -30,6 &#43;30,10 @@ PREFERRED_PROVIDER_glibc-thread-db =3D &quot;ex=
ternal-arago-toolchain&quot;<br>
&gt;&nbsp; PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =
?=3D &quot;external-arago-sdk-toolchain&quot;<br>
&gt;&nbsp; PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_A=
RCH} ?=3D &quot;external-arago-sdk-toolchain&quot;<br>
&gt;&nbsp; <br>
&gt; &#43;# Special case for gdb to be built as part of canadian-cross-sdk<=
br>
&gt; &#43;bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D &quot;=
${exec_prefix}/bin&quot;<br>
&gt; &#43;PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
=3D &quot;gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}&quot;<br>
&gt; &#43;<br>
&gt;&nbsp; GCCVERSION ?=3D &quot;4.5%&quot;<br>
&gt;&nbsp; SDKGCCVERSION ?=3D &quot;4.5%&quot;<br>
&gt;&nbsp; BINUVERSION ?=3D &quot;2.20%&quot;<br>
&gt; diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.=
bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb<br>
&gt; index 1683c1f..f780385 100644<br>
&gt; --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-core/meta/meta-toolchain-a=
rago.bb<br>
&gt; @@ -4,7 &#43;4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D &quot;${SDK_NAME}-${ARMP=
KGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; require recipes-core/meta/meta-toolchain.bb<br>
&gt;&nbsp; <br>
&gt; -PR =3D &quot;r7&quot;<br>
&gt; &#43;PR =3D &quot;r8&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SDKTARGETSYSROOT =3D &quot;${SDKPATH}/${ARAGO_TARGET_SYS}&quot;<=
br>
&gt;&nbsp; <br>
&gt; @@ -54,6 &#43;54,8 @@ toolchain_create_sdk_env_script () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo 'export OECORE_ACLOCAL_=
OPTS=3D&quot;-I $SDK_PATH/usr/share/aclocal&quot;' &gt;&gt; $script<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo 'export OECORE_DISTRO_V=
ERSION=3D&quot;${DISTRO_VERSION}&quot;' &gt;&gt; $script<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo 'export OECORE_SDK_VERS=
ION=3D&quot;${SDK_VERSION}&quot;' &gt;&gt; $script<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; echo 'export PYTHONHOME=3D$SDK_PATH' &gt=
;&gt; $script<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; echo 'export PYTHONPATH=3Dlib/python2.7'=
 &gt;&gt; $script<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp; populate_sdk_ipk_append () {<br>
&gt; @@ -64,4 &#43;66,9 @@ populate_sdk_ipk_append () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; printf &quot;#!/bin/sh\nLD_LIBRARY_PATH=3D\x24SDK_PATH/=
lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.=
real \x24\x2a\n&quot; &gt; $i<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; chmod &#43;x $i<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; # Special case for gdb, which is built a=
s part of canadian-cross-sdk<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mv ${ARAGO_TARGET_SYS}-gdb ${ARAGO_TARGE=
T_SYS}-gdb.real<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; printf &quot;#!/bin/sh\nLD_LIBRARY_PATH=
=3D\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24=
SDK_PATH/bin/${ARAGO_TARGET_SYS}-gdb.real \x24\x2a\n&quot; &gt; ${ARAGO_TAR=
GET_SYS}-gdb<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; chmod &#43;x ${ARAGO_TARGET_SYS}-gdb<br>
&gt;&nbsp; }<br>
&gt; -- <br>
&gt; 1.8.0<br>
&gt; <br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_05B212D48433499588CF34CF07576A0Dticom_--
