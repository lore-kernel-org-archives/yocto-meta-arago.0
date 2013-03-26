Return-Path: <eyalr@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 406DA52991
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2013 20:26:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2QKQeRO027736
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2013 15:26:40 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2QKQdB4031096
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2013 15:26:39 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Tue, 26 Mar 2013 21:26:37 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCHv3 2/9] wl18xx-firmware: install Wilink8
	wlan firmware files
Thread-Index: AQHOJU2Q2BArNs6KHESHXrzNhjXR8pi4SMuAgAAtCEI=
Date: Tue, 26 Mar 2013 20:26:37 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C5D2C4@DNCE04.ent.ti.com>
References: <1363771816-4022-2-git-send-email-eyalr@ti.com>,
	<20130326184527.GA22032@denix.org>
In-Reply-To: <20130326184527.GA22032@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv3 2/9] wl18xx-firmware: install Wilink8 wlan firmware files
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
X-List-Received-Date: Tue, 26 Mar 2013 20:26:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8665E2433BC68541A24DFFCA87B70F5B17C5D2C4DNCE04entticom_"

--_000_8665E2433BC68541A24DFFCA87B70F5B17C5D2C4DNCE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Dennis,

1. I can resend patch 1 in case you didn't get it. Will do it in the mornin=
g.
2. Yes this patch set is based on Franklin's sdk05.07 integration branch so=
 it does depend on his set of patches.

Best regards
Eyal



Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Dmytriyenko, Denys [denys@ti.com]
Received: Tuesday, 26 Mar 2013, 8:45pm
To: Reizer, Eyal [eyalr@ti.com]
CC: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: Re: [meta-arago] [PATCHv3 2/9] wl18xx-firmware: install Wilink8 wl=
an firmware files

On Wed, Mar 20, 2013 at 11:30:09AM +0200, Eyal Reizer wrote:
> Add a recipe for installing the Wilink8 wlan firmware files into
> the target file system.
>
> This package replace the wilink6 package which is provided by the
> wl12xx-firmware recipe. Selection between the two is done using a
> "WILINK_VERSION" switch added to arago.conf

I have 2 questions:

1. I seem to be missing the first patch in this series - 1/9 never made it
2. Is this set depending on Franklin's big set of 17 patches?


> Changes in v2:
> * Use an actual release name in the recipe name instead of _git
> * Add RPROVIDES, RREPLACES, RCONFLICTS as this recipe completely
>   replace the wilink6 one.
>
> Changes in v3:
> * Add _${PN} to all runtime variables
>
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../wl18xx-firmware/wl18xx-firmware/Makefile       |    7 +++++
>  .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb    |   30 ++++++++++++++=
++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-=
firmware/Makefile
>  create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-=
firmware_r8.a6.01.bb
>
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmwar=
e/Makefile b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/=
Makefile
> new file mode 100644
> index 0000000..0bb7ab8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware/Makef=
ile
> @@ -0,0 +1,7 @@
> +# Installs the the ti-connectiviy wlan firmware files into the root file=
 system
> +
> +install:
> +     install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
> +     cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
> +     rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
> +
> diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmwar=
e_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmwa=
re_r8.a6.01.bb
> new file mode 100644
> index 0000000..fd463cc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmware_r8.a6=
.01.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "Firmware files for use with TI wl18xx"
> +LICENSE =3D "TI-TSPA"
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80922=
969"
> +
> +PACKAGE_ARCH =3D "all"
> +
> +PR =3D "r1+gitr${SRCREV}"
> +
> +PROVIDES +=3D "wl12xx-firmware"
> +RPROVIDES_${PN} +=3D "wl12xx-firmware"
> +RREPLACES_${PN} +=3D "wl12xx-firmware"
> +RCONFLICTS_${PN} +=3D "wl12xx-firmware"
> +
> +SRCREV =3D "ol_r8.a6.01"
> +SRC_URI =3D "git://github.com/TI-OpenLink/wl18xx_fw.git;protocol=3Dgit \
> +           file://Makefile \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    cp ${WORKDIR}/Makefile ${S}
> +    oe_runmake 'DEST_DIR=3D${D}' install
> +}
> +
> +FILES_${PN} =3D "/lib/firmware/ti-connectivity/*"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>

--_000_8665E2433BC68541A24DFFCA87B70F5B17C5D2C4DNCE04entticom_
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
pt; color:black">Hi Dennis,<br>
<br>
1. I can resend patch 1 in case you didn't get it. Will do it in the mornin=
g.<br>
2. Yes this patch set is based on Franklin's sdk05.07 integration branch so=
 it does depend on his set of patches.<br>
<br>
Best regards<br>
Eyal<br>
<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Dmytriyenko, Denys [denys@ti.com]<br>
<b>Received:</b> Tuesday, 26 Mar 2013, 8:45pm<br>
<b>To:</b> Reizer, Eyal [eyalr@ti.com]<br>
<b>CC:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> Re: [meta-arago] [PATCHv3 2/9] wl18xx-firmware: install Wil=
ink8 wlan firmware files<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Wed, Mar 20, 2013 at 11:30:09AM &#43;0200, Eyal=
 Reizer wrote:<br>
&gt; Add a recipe for installing the Wilink8 wlan firmware files into<br>
&gt; the target file system.<br>
&gt; <br>
&gt; This package replace the wilink6 package which is provided by the<br>
&gt; wl12xx-firmware recipe. Selection between the two is done using a<br>
&gt; &quot;WILINK_VERSION&quot; switch added to arago.conf<br>
<br>
I have 2 questions:<br>
<br>
1. I seem to be missing the first patch in this series - 1/9 never made it<=
br>
2. Is this set depending on Franklin's big set of 17 patches?<br>
<br>
<br>
&gt; Changes in v2:<br>
&gt; * Use an actual release name in the recipe name instead of _git<br>
&gt; * Add RPROVIDES, RREPLACES, RCONFLICTS as this recipe completely <br>
&gt;&nbsp;&nbsp; replace the wilink6 one.<br>
&gt; <br>
&gt; Changes in v3:<br>
&gt; * Add _${PN} to all runtime variables<br>
&gt; <br>
&gt; Signed-off-by: Eyal Reizer &lt;eyalr@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../wl18xx-firmware/wl18xx-firmware/Makefile&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 7 &#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; .../wl18xx-firmware/wl18xx-firmware_r8.a6.01.bb&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 30 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 2 files changed, 37 insertions(&#43;)<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware=
/wl18xx-firmware/Makefile<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-bsp/wl18xx-firmware=
/wl18xx-firmware_r8.a6.01.bb<br>
&gt; <br>
&gt; diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firm=
ware/Makefile b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firmwa=
re/Makefile<br>
&gt; new file mode 100644<br>
&gt; index 0000000..0bb7ab8<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx=
-firmware/Makefile<br>
&gt; @@ -0,0 &#43;1,7 @@<br>
&gt; &#43;# Installs the the ti-connectiviy wlan firmware files into the ro=
ot file system<br>
&gt; &#43;<br>
&gt; &#43;install:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; install -d&nbsp; $(DEST_DIR)/lib/firmwar=
e/ti-connectivity<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; cp -RpP * $(DEST_DIR)/lib/firmware/ti-co=
nnectivity/<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; rm -f $(DEST_DIR)/lib/firmware/ti-connec=
tivity/Makefile<br>
&gt; &#43;<br>
&gt; diff --git a/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-firm=
ware_r8.a6.01.bb b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx-fir=
mware_r8.a6.01.bb<br>
&gt; new file mode 100644<br>
&gt; index 0000000..fd463cc<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-bsp/wl18xx-firmware/wl18xx=
-firmware_r8.a6.01.bb<br>
&gt; @@ -0,0 &#43;1,30 @@<br>
&gt; &#43;DESCRIPTION =3D &quot;Firmware files for use with TI wl18xx&quot;=
<br>
&gt; &#43;LICENSE =3D &quot;TI-TSPA&quot;<br>
&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENCE;md5=3Db28122=
fd6678e89fd3a8d4bc80922969">file://LICENCE;md5=3Db28122fd6678e89fd3a8d4bc80=
922969</a>&quot;<br>
&gt; &#43;<br>
&gt; &#43;PACKAGE_ARCH =3D &quot;all&quot;<br>
&gt; &#43;<br>
&gt; &#43;PR =3D &quot;r1&#43;gitr${SRCREV}&quot;<br>
&gt; &#43;<br>
&gt; &#43;PROVIDES &#43;=3D &quot;wl12xx-firmware&quot;<br>
&gt; &#43;RPROVIDES_${PN} &#43;=3D &quot;wl12xx-firmware&quot; <br>
&gt; &#43;RREPLACES_${PN} &#43;=3D &quot;wl12xx-firmware&quot;<br>
&gt; &#43;RCONFLICTS_${PN} &#43;=3D &quot;wl12xx-firmware&quot;<br>
&gt; &#43;<br>
&gt; &#43;SRCREV =3D &quot;ol_r8.a6.01&quot;<br>
&gt; &#43;SRC_URI =3D &quot;git://github.com/TI-OpenLink/wl18xx_fw.git;prot=
ocol=3Dgit \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a h=
ref=3D"file://Makefile">file://Makefile</a> \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt; &#43;<br>
&gt; &#43;S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &#43;<br>
&gt; &#43;do_compile() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; :<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;do_install() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; cp ${WORKDIR}/Makefile ${S}<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; oe_runmake 'DEST_DIR=3D${D}' install<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;FILES_${PN} =3D &quot;/lib/firmware/ti-connectivity/*&quot;<br>
&gt; -- <br>
&gt; 1.7.9.5<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
&gt; <br>
</div>
</span></font>
</body>
</html>

--_000_8665E2433BC68541A24DFFCA87B70F5B17C5D2C4DNCE04entticom_--
