Return-Path: <xuj@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4E2CE520E4
	for <meta-arago@arago-project.org>;
	Thu,  6 Jun 2019 19:16:31 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x56JFrki080578
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2019 14:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559848553;
	bh=Yf7c+IO7NEWHCX+jGLeMwKqYSN4dX1RZveKoGLZxhZw=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=EjVwL3NC6xy7glGg1MvQMvQM08zwaiHtAKYBb/X3lstx59bK+0BcghrN3sFawjaIw
	rKeEbfiVDLuSS90k/DzdJzXlUMfdxZTppYauQ27x9hrGxjPNo2+tCpPDEakDjYatvi
	RV9irPMtxpYFD88FWFBHZ7otqL9DnRuAEfpZvjDU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x56JFr4m014723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2019 14:15:53 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 6 Jun 2019 14:15:53 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1713.004; Thu, 6 Jun 2019 14:15:53 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [thud/master][PATCH v2] tidl-import: disable static linking
Thread-Index: AQHVHIPfbeNJucXiMkivGOm4I5OhtKaO/zgw
Date: Thu, 6 Jun 2019 19:15:53 +0000
Message-ID: <fdc06d4adb424ba481838318a6be8de5@ti.com>
References: <1559837111-24886-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1559837111-24886-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.116.215]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [thud/master][PATCH v2] tidl-import: disable static linking
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
X-List-Received-Date: Thu, 06 Jun 2019 19:16:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK.

I will fix the makefile in the source (confirmed with Jake).=20

Thanks,
Jianzhong

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Thursday, June 06, 2019 12:05 PM
To: meta-arago@arago-project.org
Cc: Xu, Jianzhong; Stiffler, Jacob
Subject: [thud/master][PATCH v2] tidl-import: disable static linking

* Disable static linking to fix run-time against protobuf 3.6.1

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: drop FILESEXTRAPATHS

 .../tidl-utils/tidl-import/disable_static.patch          | 16 ++++++++++++=
++++
 .../recipes-ti/tidl-utils/tidl-import_git.bb             |  4 +++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-ti/tidl-utils/tidl-import/dis=
able_static.patch

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_st=
atic.patch b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_st=
atic.patch
new file mode 100644
index 0000000..23377af
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import/disable_static.pa=
tch
@@ -0,0 +1,16 @@
+diff --git a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile b=
/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
+index 374f862..521f0dc 100644
+--- a/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
++++ b/src/importTool/modules/ti_dl/utils/tidlModelImport/makefile
+@@ -103,9 +103,9 @@ ifeq ($(PLATFORM_BUILD), x86)
+ ifeq ($(LINUX_IMPORT_TOOL), 64BIT)
+ CFLAGS+=3D -DPLATFORM_64BIT=20
+ endif
+-LDFLAGS+=3D -lstdc++ -static
++LDFLAGS+=3D -lstdc++
+ else
+-LDFLAGS+=3D -lstdc++ -lz -static
++LDFLAGS+=3D -lstdc++ -lz
+ endif
+ endif
+=20
diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/m=
eta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index bef2d1a..9f1c5bb 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -8,7 +8,9 @@ LICENSE =3D "BSD-3"
 LIC_FILES_CHKSUM =3D "file://modules/ti_dl/inc/itidl_ti.h;beginline=3D1;en=
dline=3D34;md5=3Dcabe1fdaabfa0d85dc5544566b0e2425"
=20
 PV =3D "01.01.00.00"
-PR =3D "r0"
+PR =3D "r1"
+
+SRC_URI_append =3D " file://disable_static.patch;pnum=3D3"
=20
 S =3D "${WORKDIR}/git/src/importTool/"
=20
--=20
2.7.4


