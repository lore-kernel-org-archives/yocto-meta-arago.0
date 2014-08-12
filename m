Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 63C0B52976
	for <meta-arago@arago-project.org>;
	Tue, 12 Aug 2014 23:11:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CNBOGa002042
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 18:11:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CNBNdm001379
	for <meta-arago@arago-project.org>; Tue, 12 Aug 2014 18:11:24 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Tue, 12 Aug 2014 18:11:23 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/2] qtbase: Set wayland as the default
	display	plugin
Thread-Index: AQHPtoIYLjKWhJSYQ0O2KSQBOZfhOZvNmHPU
Date: Tue, 12 Aug 2014 23:11:23 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE7320BBE3C@DLEE08.ent.ti.com>
References: <1407884796-2289-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1407884796-2289-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 1/2] qtbase: Set wayland as the default display	plugin
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
X-List-Received-Date: Tue, 12 Aug 2014 23:11:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE7320BBE3CDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE7320BBE3CDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks good, I'll push them next time, thanks.


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Cooper Jr., Franklin [fcooper@ti.com]
Received: Tuesday, 12 Aug 2014, 19:06
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
CC: Cooper Jr., Franklin [fcooper@ti.com]
Subject: [meta-arago] [PATCH 1/2] qtbase: Set wayland as the default displa=
y plugin

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Set wayland as the default display plugin for Qt apps.
* Its already the default now used by Arago but this eliminates the need to=
 pass
  additional arguments for all the different Qt applications.
---
 .../recipes-qt/qt5/qtbase_5.2.1.bbappend           |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/meta-=
arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
index c879313..f5f772a 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
@@ -3,4 +3,6 @@ GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"

 PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl=
 ${GLES_EXTRA_DEPS}"

-PR_append =3D "-arago0"
+PR_append =3D "-arago1"
+
+QT_CONFIG_FLAGS +=3D "-qpa wayland"
--
1.7.9.5

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE7320BBE3CDLEE08entticom_
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
pt; color:black">Looks good, I'll push them next time, thanks.<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Cooper Jr., Franklin [fcooper@ti.com]<br>
<b>Received:</b> Tuesday, 12 Aug 2014, 19:06<br>
<b>To:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>CC:</b> Cooper Jr., Franklin [fcooper@ti.com]<br>
<b>Subject:</b> [meta-arago] [PATCH 1/2] qtbase: Set wayland as the default=
 display plugin<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">From: &quot;Franklin S. Cooper Jr&quot; &lt;fcoope=
r@ti.com&gt;<br>
<br>
* Set wayland as the default display plugin for Qt apps.<br>
* Its already the default now used by Arago but this eliminates the need to=
 pass<br>
&nbsp; additional arguments for all the different Qt applications.<br>
---<br>
&nbsp;.../recipes-qt/qt5/qtbase_5.2.1.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 &#43;&#43;&#43;-<br>
&nbsp;1 file changed, 3 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend b/meta-=
arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend<br>
index c879313..f5f772a 100644<br>
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend<br>
&#43;&#43;&#43; b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend<br=
>
@@ -3,4 &#43;3,6 @@ GLES_EXTRA_DEPS_omap-a15 =3D &quot;libdrm wayland&quot;=
<br>
&nbsp;<br>
&nbsp;PACKAGECONFIG[gles2] =3D &quot;-opengl es2 -eglfs,,virtual/libgles2 v=
irtual/egl ${GLES_EXTRA_DEPS}&quot;<br>
&nbsp;<br>
-PR_append =3D &quot;-arago0&quot;<br>
&#43;PR_append =3D &quot;-arago1&quot;<br>
&#43;<br>
&#43;QT_CONFIG_FLAGS &#43;=3D &quot;-qpa wayland&quot;<br>
-- <br>
1.7.9.5<br>
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

--_000_B0581B5571079145BA1CD78C126DBDE7320BBE3CDLEE08entticom_--
