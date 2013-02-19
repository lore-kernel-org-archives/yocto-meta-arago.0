Return-Path: <zhoujt@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CBC2152A1D
	for <meta-arago@arago-project.org>;
	Tue, 19 Feb 2013 02:49:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1J2nS3G030309
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 20:49:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1J2nS9Z010943
	for <meta-arago@arago-project.org>; Mon, 18 Feb 2013 20:49:28 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 18 Feb 2013 20:49:27 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: lksctp-tools recipe
Thread-Index: Ac4OS7kpZ/viCwvTTEata73DQZrHoA==
Date: Tue, 19 Feb 2013 02:49:25 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E391A185@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: lksctp-tools recipe
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
X-List-Received-Date: Tue, 19 Feb 2013 02:49:29 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E391A185DFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E391A185DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 8cf339a8ed5ef0922a4190ee707e2b0e0b94d971 Mon Sep 17 00:00:00 2001
From: Jingting Zhou <a0221004@ares-ubuntu>
Date: Mon, 18 Feb 2013 17:59:39 -0500
Subject: [PATCH] added lksctp-tools recipe

---
.../lksctp-tools/lksctp-tools.inc                  |   46 +++++++++++++++++=
+++
.../lksctp-tools/lksctp-tools_1.0.7.bb             |    9 ++++
2 files changed, 55 insertions(+)
create mode 100755 meta-arago-distro/recipes-connectivity/lksctp-tools/lksc=
tp-tools.inc
create mode 100755 meta-arago-distro/recipes-connectivity/lksctp-tools/lksc=
tp-tools_1.0.7.bb

diff --git a/meta-arago-distro/recipes-connectivity/lksctp-tools/lksctp-too=
ls.inc b/meta-arago-distro/recipes-connectivity/lksctp-tools/lksctp-tools.i=
nc
new file mode 100755
index 0000000..1db389c
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/lksctp-tools/lksctp-tools.inc
@@ -0,0 +1,46 @@
+DESCRIPTION =3D "The Linux Kernel Stream Control Transmission Protocol (lk=
sctp) project"
+SECTION =3D "libs"
+PRIORITY =3D "optional"
+LICENSE =3D "LGPLv2"
+
+S =3D "${WORKDIR}/${BPN}-${PV}"
+
+INC_PR =3D "r2"
+
+BBCLASSEXTEND =3D "native"
+
+inherit autotools pkgconfig binconfig
+
+do_install_append_virtclass-native() {
+              :
+}
+
+RREPLACES =3D "lksctp"
+
+LEAD_SONAME =3D "libsctp.so"
+
+PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"
+
+FILES_${PN} =3D "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_libdir}/*${SOLIBS}"
+
+#FILES_${PN}-withsctp =3D " \
+#  ${libdir}/lksctp-tools/lib*"
+
+FILES_${PN}-dev +=3D " \
+  ${datadir}/lksctp-tools/checksctp.c \
+  ${datadir}/lksctp-tools/sctp_socket.c \
+  ${datadir}/lksctp-tools/sctp_bind.c \
+  ${datadir}/lksctp-tools/sctp_darn.c \
+  ${datadir}/lksctp-tools/sctp_load_libs.c \
+  ${datadir}/lksctp-tools/sctp_sockopt.c \
+  ${datadir}/lksctp-tools/sctp_socket.h \
+  ${datadir}/lksctp-tools/sctp_test.c \
+  ${datadir}/lksctp-tools/sctp_darn.h"
+
+FILES_${PN}-utils =3D " \
+  ${bindir}/sctp_test \
+  ${bindir}/sctp_darn \
+  ${bindir}/checksctp \
+  ${bindir}/withsctp"
diff --git a/meta-arago-distro/recipes-connectivity/lksctp-tools/lksctp-too=
ls_1.0.7.bb b/meta-arago-distro/recipes-connectivity/lksctp-tools/lksctp-to=
ols_1.0.7.bb
new file mode 100755
index 0000000..70b36f5
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.=
7.bb
@@ -0,0 +1,9 @@
+require lksctp-tools.inc
+PR =3D "${INC_PR}.0"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
+
+LIC_FILES_CHKSUM =3D "file://Makefile.in;endline=3D14;md5=3D764d2275f40f1a=
67205558dd2af91708"
+
+SRC_URI[md5sum] =3D "047562b40537eb3be5d5ec3ae0a2198b"
+SRC_URI[sha256sum] =3D "e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655=
d687fd08377595"
--
1.7.9.5


--_000_3C08AEEB3C731745938BC83D029FE5E391A185DFLE09entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">From 8cf339a8ed5ef0922a4190ee707e2b0e0b94d971 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Jingting Zhou &lt;a0221004@ares-ubuntu&gt;<o:p=
></o:p></p>
<p class=3D"MsoNormal">Date: Mon, 18 Feb 2013 17:59:39 -0500<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] added lksctp-tools recipe<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../lksctp-tools/lksctp-tools.inc&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp;&nbsp; 46 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">.../lksctp-tools/lksctp-tools_1.0.7.bb&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nb=
sp; 9 &#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">2 files changed, 55 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/lksctp-tools/lksctp-tools.inc<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 meta-arago-distro/recipes-connect=
ivity/lksctp-tools/lksctp-tools_1.0.7.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
lksctp-tools/lksctp-tools.inc b/meta-arago-distro/recipes-connectivity/lksc=
tp-tools/lksctp-tools.inc<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..1db389c<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/lksctp-tools/lksctp-tools.inc<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,46 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;DESCRIPTION =3D &quot;The Linux Kernel Stream C=
ontrol Transmission Protocol (lksctp) project&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SECTION =3D &quot;libs&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PRIORITY =3D &quot;optional&quot;<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;LICENSE =3D &quot;LGPLv2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;INC_PR =3D &quot;r2&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;BBCLASSEXTEND =3D &quot;native&quot;<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;inherit autotools pkgconfig binconfig<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;do_install_append_virtclass-native() {<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;}<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;RREPLACES =3D &quot;lksctp&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LEAD_SONAME =3D &quot;libsctp.so&quot;<o:p></o:=
p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PACKAGES =3D&#43; &quot;${PN}-withsctp ${PN}-ut=
ils&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN} =3D &quot;${libexecdir}/* ${libdir}=
/lib*${SOLIBS} \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ${sysconfdir} ${sharedstatedir} ${localstatedir} \<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ${base_libdir}/*${SOLIBS}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;#FILES_${PN}-withsctp =3D &quot; \<o:p></o:p></=
p>
<p class=3D"MsoNormal">&#43;#&nbsp; ${libdir}/lksctp-tools/lib*&quot;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-dev &#43;=3D &quot; \<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/checksctp.c \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/sctp_socket.c \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/sctp_bind.c \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/sctp_darn.c \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/sctp_load_libs.c=
 \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/sctp_sockopt.c \=
<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/sctp_socket.h \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/sctp_test.c \<o:=
p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${datadir}/lksctp-tools/sctp_darn.h&quot=
;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;FILES_${PN}-utils =3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${bindir}/sctp_test \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${bindir}/sctp_darn \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${bindir}/checksctp \<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; ${bindir}/withsctp&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-arago-distro/recipes-connectivity/=
lksctp-tools/lksctp-tools_1.0.7.bb b/meta-arago-distro/recipes-connectivity=
/lksctp-tools/lksctp-tools_1.0.7.bb<o:p></o:p></p>
<p class=3D"MsoNormal">new file mode 100755<o:p></o:p></p>
<p class=3D"MsoNormal">index 0000000..70b36f5<o:p></o:p></p>
<p class=3D"MsoNormal">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta-arago-distro/recipes-connecti=
vity/lksctp-tools/lksctp-tools_1.0.7.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -0,0 &#43;1,9 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;require lksctp-tools.inc<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;PR =3D &quot;${INC_PR}.0&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/lksctp/=
lksctp-tools-${PV}.tar.gz&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;LIC_FILES_CHKSUM =3D &quot;file://Makefile.in;e=
ndline=3D14;md5=3D764d2275f40f1a67205558dd2af91708&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[md5sum] =3D &quot;047562b40537eb3be5d5e=
c3ae0a2198b&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;SRC_URI[sha256sum] =3D &quot;e920e89d110cff9847=
f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.9.5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E391A185DFLE09entticom_--
