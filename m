Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3598152992
	for <meta-arago@arago-project.org>;
	Sat,  6 Jul 2013 13:56:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r66Dud8E013274
	for <meta-arago@arago-project.org>; Sat, 6 Jul 2013 08:56:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r66DudkD012445
	for <meta-arago@arago-project.org>; Sat, 6 Jul 2013 08:56:39 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sat, 6 Jul 2013 08:56:39 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Sat, 6 Jul 2013 08:56:38 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Hernandez, Carlos" <ceh@ti.com>
Thread-Topic: [meta-arago] [PATCH] packagegroup-arago-test: Add memtester
Thread-Index: AQHOeZoVKVy1ylCmfUGKuAuHG9nnSJlXrhDx
Date: Sat, 6 Jul 2013 13:56:38 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E82D58B@DLEE08.ent.ti.com>
References: <1373040583-483-1-git-send-email-ceh@ti.com>
In-Reply-To: <1373040583-483-1-git-send-email-ceh@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-arago-test: Add memtester
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
X-List-Received-Date: Sat, 06 Jul 2013 13:56:40 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E82D58BDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E82D58BDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

PR bump?


Denys


-----Original Message-----
From: Hernandez, Carlos [ceh@ti.com]
Received: Friday, 05 Jul 2013, 12:09
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: [meta-arago] [PATCH] packagegroup-arago-test: Add memtester

memtester is a userspace utility for testing the memory subsystem.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-test.bb
index a52b84a..230b9af 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.=
bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.=
bb
@@ -15,6 +15,7 @@ ARAGO_TEST =3D "\
     rt-tests \
     evtest \
     bc \
+    memtester \
     "

 ARAGO_TI_TEST =3D "\
--
1.7.9.5

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE72E82D58BDLEE08entticom_
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
pt; color:black">PR bump?<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Hernandez, Carlos [ceh@ti.com]<br>
<b>Received:</b> Friday, 05 Jul 2013, 12:09<br>
<b>To:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> [meta-arago] [PATCH] packagegroup-arago-test: Add memtester=
<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">memtester is a userspace utility for testing the m=
emory subsystem.<br>
<br>
Signed-off-by: Carlos Hernandez &lt;ceh@ti.com&gt;<br>
---<br>
&nbsp;.../packagegroups/packagegroup-arago-test.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-test.bb<br>
index a52b84a..230b9af 100644<br>
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.=
bb<br>
&#43;&#43;&#43; b/meta-arago-distro/recipes-core/packagegroups/packagegroup=
-arago-test.bb<br>
@@ -15,6 &#43;15,7 @@ ARAGO_TEST =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; rt-tests \<br>
&nbsp;&nbsp;&nbsp;&nbsp; evtest \<br>
&nbsp;&nbsp;&nbsp;&nbsp; bc \<br>
&#43;&nbsp;&nbsp;&nbsp; memtester \<br>
&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;ARAGO_TI_TEST =3D &quot;\<br>
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

--_000_B0581B5571079145BA1CD78C126DBDE72E82D58BDLEE08entticom_--
