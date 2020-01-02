Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9974752975
	for <meta-arago@arago-project.org>;
	Thu,  2 Jan 2020 20:35:54 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002KYCD2054090
	for <meta-arago@arago-project.org>; Thu, 2 Jan 2020 14:34:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1577997252;
	bh=Bt5M5iPxuriXG4J2WfYr5Cq9Ney9dn23LoY1E/6k9dk=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Y/sv4j6CDTbHX7kyFw8NnO98DRgyBjCC3BsXprCkszPGGznH5Bmvi50UNOgIWNphC
	4B20TtxByE/nNv4Hl5wsKIag1kBfcwh8RTXO6DLNE/H0mTAixR2mzwBIBXkEIc1uwD
	r6Mh0VwBkss6bCFf0OCGvTQot72Bu2sFOShrLuBg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002KYCK9073294
	for <meta-arago@arago-project.org>; Thu, 2 Jan 2020 14:34:12 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 2 Jan 2020 14:34:11 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Thu, 2 Jan 2020 14:34:11 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Liu, Yan" <yan-liu@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [PATCH v1] ltp-ddt: Update to latest
Thread-Index: AQHVwaolWy+WAnBIJ0OPEZxJCBOGNKfX1JFw
Date: Thu, 2 Jan 2020 20:34:11 +0000
Message-ID: <a43896e41bde4413921f2c96802be927@ti.com>
References: <1577996361-10105-1-git-send-email-yan-liu@ti.com>
In-Reply-To: <1577996361-10105-1-git-send-email-yan-liu@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Thu, 02 Jan 2020 20:35:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please backport to ti2019.05.

Thank you,
Jake


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Liu, Yan
Sent: Thursday, January 2, 2020 3:19 PM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [PATCH v1] ltp-ddt: Update to latest

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb=
 b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
index 4cb8933..8c64c92 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
@@ -4,7 +4,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
-PR =3D "r21"
+PR =3D "r22"
 PV_append =3D "+git${SRCPV}"
=20
 PROVIDES +=3D "ltp"
@@ -39,7 +39,7 @@ RDEPENDS_${PN} =3D "\
=20
 inherit autotools-brokensep
=20
-SRCREV =3D "f7286a890e6673be8d7f2c3cff17d49805817f53"
+SRCREV =3D "95209f3250035e2976224f87605864c0e790504b"
 BRANCH ?=3D "master"
=20
 SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.=
git;branch=3D${BRANCH} \
--=20
1.7.9.5

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

