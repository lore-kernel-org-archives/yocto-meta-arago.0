Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 26C9052A4C
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 03:37:42 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r163beLD013670;
	Tue, 5 Feb 2013 21:37:40 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r163bego022406;
	Tue, 5 Feb 2013 21:37:40 -0600
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 5 Feb 2013 21:37:40 -0600
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"fcooperjr27@gmail.com" <fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 1/4] php: Rename bbappend to match recipe
	in	meta-oe
Thread-Index: AQHOBBGcE9KEFK/Xl027JtnTsoQUHJhsLn0Q
Date: Wed, 6 Feb 2013 03:37:40 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E72ED80@DLEE09.ent.ti.com>
References: <1360117678-4395-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1360117678-4395-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 1/4] php: Rename bbappend to match recipe in	meta-oe
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
X-List-Received-Date: Wed, 06 Feb 2013 03:37:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E72ED80DLEE09entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E72ED80DLEE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yeah, just had to do this earlier locally when fixing devkit... I'll push b=
unch of patches soon to address those issues, but I'm still working on fina=
lizing that...


Denys


-----Original Message-----
From: fcooperjr27@gmail.com [fcooperjr27@gmail.com]
Received: Tuesday, 05 Feb 2013, 20:28
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
CC: Cooper Jr., Franklin [fcooper@ti.com]
Subject: [meta-arago] [PATCH 1/4] php: Rename bbappend to match recipe in m=
eta-oe

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-devtools/php/php_5.3.19.bbappend       |    6 ++++++
 .../recipes-devtools/php/php_5.3.6.bbappend        |    6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-distro/recipes-devtools/php/php_5.3.19.bbapp=
end
 delete mode 100644 meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappe=
nd

diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend b/m=
eta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend
new file mode 100644
index 0000000..4c3fd39
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend
@@ -0,0 +1,6 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+
+PR_append =3D "-arago0"
+
+SRC_URI_append_virtclass-native =3D " file://0001-php-native-Fix-host-cont=
amination-issue.patch"
diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend b/me=
ta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
deleted file mode 100644
index 4c3fd39..0000000
--- a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# look for files in this layer first
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
-
-PR_append =3D "-arago0"
-
-SRC_URI_append_virtclass-native =3D " file://0001-php-native-Fix-host-cont=
amination-issue.patch"
--
1.7.0.4

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE72E72ED80DLEE09entticom_
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
pt; color:black">Yeah, just had to do this earlier locally when fixing devk=
it... I'll push bunch of patches soon to address those issues, but I'm stil=
l working on finalizing that...<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> fcooperjr27@gmail.com [fcooperjr27@gmail.com]<br>
<b>Received:</b> Tuesday, 05 Feb 2013, 20:28<br>
<b>To:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>CC:</b> Cooper Jr., Franklin [fcooper@ti.com]<br>
<b>Subject:</b> [meta-arago] [PATCH 1/4] php: Rename bbappend to match reci=
pe in meta-oe<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">From: Franklin S. Cooper Jr &lt;fcooper@ti.com&gt;=
<br>
<br>
Signed-off-by: Franklin S. Cooper Jr &lt;fcooper@ti.com&gt;<br>
---<br>
&nbsp;.../recipes-devtools/php/php_5.3.19.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 6 &#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;.../recipes-devtools/php/php_5.3.6.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 6 ------<br>
&nbsp;2 files changed, 6 insertions(&#43;), 6 deletions(-)<br>
&nbsp;create mode 100644 meta-arago-distro/recipes-devtools/php/php_5.3.19.=
bbappend<br>
&nbsp;delete mode 100644 meta-arago-distro/recipes-devtools/php/php_5.3.6.b=
bappend<br>
<br>
diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend b/m=
eta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend<br>
new file mode 100644<br>
index 0000000..4c3fd39<br>
--- /dev/null<br>
&#43;&#43;&#43; b/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappen=
d<br>
@@ -0,0 &#43;1,6 @@<br>
&#43;# look for files in this layer first<br>
&#43;FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
&#43;<br>
&#43;PR_append =3D &quot;-arago0&quot;<br>
&#43;<br>
&#43;SRC_URI_append_virtclass-native =3D &quot; <a href=3D"file://0001-php-=
native-Fix-host-contamination-issue.patch">
file://0001-php-native-Fix-host-contamination-issue.patch</a>&quot;<br>
diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend b/me=
ta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend<br>
deleted file mode 100644<br>
index 4c3fd39..0000000<br>
--- a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend<br>
&#43;&#43;&#43; /dev/null<br>
@@ -1,6 &#43;0,0 @@<br>
-# look for files in this layer first<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
-<br>
-PR_append =3D &quot;-arago0&quot;<br>
-<br>
-SRC_URI_append_virtclass-native =3D &quot; <a href=3D"file://0001-php-nati=
ve-Fix-host-contamination-issue.patch">
file://0001-php-native-Fix-host-contamination-issue.patch</a>&quot;<br>
-- <br>
1.7.0.4<br>
<br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E72ED80DLEE09entticom_--
