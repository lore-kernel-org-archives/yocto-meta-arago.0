Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3027152A04
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 03:39:19 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r163dIXJ008325;
	Tue, 5 Feb 2013 21:39:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r163dIHq023718;
	Tue, 5 Feb 2013 21:39:18 -0600
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 5 Feb 2013 21:39:17 -0600
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"fcooperjr27@gmail.com" <fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new native
	x11	package name.
Thread-Index: AQHOBBGuWgxo4NfjIkqMB4PNzOtf75hsLvLh
Date: Wed, 6 Feb 2013 03:39:17 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E72EDB9@DLEE09.ent.ti.com>
References: <1360117678-4395-1-git-send-email-fcooper@ti.com>,
	<1360117678-4395-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1360117678-4395-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 2/4] nativesdk-qt4-tools: Use new native x11	package name.
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
X-List-Received-Date: Wed, 06 Feb 2013 03:39:19 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E72EDB9DLEE09entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E72EDB9DLEE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Didn't I push this already? I remember fixing this particular one few days =
ago...


Denys


-----Original Message-----
From: fcooperjr27@gmail.com [fcooperjr27@gmail.com]
Received: Tuesday, 05 Feb 2013, 20:28
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
CC: Cooper Jr., Franklin [fcooper@ti.com]
Subject: [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new native x11 p=
ackage name.

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Nativesdk-libx11 has now been renamed to libx11-nativesdk.
* This ensure the x11 package is filtered out which prevents parsing/build
  errors due to x11 not being a distro feature.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../qt4/nativesdk-qt4-tools_4.8.3.bbappend         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bba=
ppend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
index 6296fbe..312571e 100644
--- a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
@@ -1,7 +1,7 @@
-PR_append =3D "-arago2"
+PR_append =3D "-arago3"

 # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
 # For our distribution purposes we only use LGPLv2.1
 LICENSE =3D "LGPLv2.1"

-DEPENDS :=3D "${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}"
+DEPENDS :=3D "${@oe_filter_out('libx11-nativesdk', '${DEPENDS}', d)}"
--
1.7.0.4

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE72E72EDB9DLEE09entticom_
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
pt; color:black">Didn't I push this already? I remember fixing this particu=
lar one few days ago...<br>
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
<b>Subject:</b> [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new nativ=
e x11 package name.<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">From: Franklin S. Cooper Jr &lt;fcooper@ti.com&gt;=
<br>
<br>
* Nativesdk-libx11 has now been renamed to libx11-nativesdk.<br>
* This ensure the x11 package is filtered out which prevents parsing/build<=
br>
&nbsp; errors due to x11 not being a distro feature.<br>
<br>
Signed-off-by: Franklin S. Cooper Jr &lt;fcooper@ti.com&gt;<br>
---<br>
&nbsp;.../qt4/nativesdk-qt4-tools_4.8.3.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 &#43;&#43;--<br>
&nbsp;1 files changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bba=
ppend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend=
<br>
index 6296fbe..312571e 100644<br>
--- a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend<b=
r>
&#43;&#43;&#43; b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.=
3.bbappend<br>
@@ -1,7 &#43;1,7 @@<br>
-PR_append =3D &quot;-arago2&quot;<br>
&#43;PR_append =3D &quot;-arago3&quot;<br>
&nbsp;<br>
&nbsp;# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)<br>
&nbsp;# For our distribution purposes we only use LGPLv2.1<br>
&nbsp;LICENSE =3D &quot;LGPLv2.1&quot;<br>
&nbsp;<br>
-DEPENDS :=3D &quot;${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}&=
quot;<br>
&#43;DEPENDS :=3D &quot;${@oe_filter_out('libx11-nativesdk', '${DEPENDS}', =
d)}&quot;<br>
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

--_000_B0581B5571079145BA1CD78C126DBDE72E72EDB9DLEE09entticom_--
