Return-Path: <hnagalla@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 82D35529EC
	for <meta-arago@arago-project.org>;
	Fri, 19 Mar 2021 18:19:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12JIJRRo110613;
	Fri, 19 Mar 2021 13:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616177967;
	bh=GBrBrSpXO62iCWVvX9+IyYPi2b0rDJZag9U7J0dpAT4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=dDTuncNrUEmIEgBTryDBj8aFdmLK7Zy3a/ryJPuywkElX02IFaF+4STg1qCF6x3L8
	mabaxwyDNKHjJHEiISKQn9LJ+oDySpDyb7BuQ2P5BCXWuHqh3uYy8HBlCa2VBy9jRI
	0a133SDHa/xwW2II7HyxBIIvQAw5y5ZXl1YJuaAo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12JIJRgU128128
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Mar 2021 13:19:27 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 19 Mar 2021 13:19:27 -0500
Received: from DFLE100.ent.ti.com ([fe80::f19c:5926:3526:1b30]) by
	DFLE100.ent.ti.com ([fe80::f19c:5926:3526:1b30%17]) with mapi id
	15.01.2176.009; Fri, 19 Mar 2021 13:19:27 -0500
From: "Nagalla, Hari" <hnagalla@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Thread-Topic: [dunfell/master PATCH] packagegroups: tisdk-connectivity:
	Include BT_TI package for all platforms
Thread-Index: AQHXHOt9sCaxsRGjIEKencWAMdN8q6qLnsBg
Date: Fri, 19 Mar 2021 18:19:27 +0000
Message-ID: <49cedfbc80134bdd91b5e35707f82046@ti.com>
References: <20210319181257.10173-1-praneeth@ti.com>
In-Reply-To: <20210319181257.10173-1-praneeth@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.76.64]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [dunfell/master PATCH] packagegroups: tisdk-connectivity: Include BT_TI package for all platforms
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
X-List-Received-Date: Fri, 19 Mar 2021 18:19:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Praneeth,

It seems good to me..

Thanks
Hari

-----Original Message-----
From: Bajjuri, Praneeth=20
Sent: Friday, March 19, 2021 1:13 PM
To: Bajjuri, Praneeth <praneeth@ti.com>; Nagalla, Hari <hnagalla@ti.com>
Cc: meta-arago@arago-project.org; denys@konsulko.com
Subject: [dunfell/master PATCH] packagegroups: tisdk-connectivity: Include =
BT_TI package for all platforms

From: Hari Nagalla <hnagalla@ti.com>

Move BT_TI package (That consists bt_enable,bt_fw) to CONNECTIVITY_RDEPENDS=
.
This enables the package across all TI platforms.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
[praneeth@ti.com: addressed review comments from v1]
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-connectivity.bb
index 8a8189fe..1eb0e072 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
@@ -64,22 +64,17 @@ CONNECTIVITY_RDEPENDS =3D " \
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
+    ${BT_TI} \
 "
=20
 CONNECTIVITY_RDEPENDS_append_ti33x =3D "\
-    ${BT_TI} \
     ${DEMO_APPS} \
 "
=20
 CONNECTIVITY_RDEPENDS_append_ti43x =3D "\
-    ${BT_TI} \
     ${DEMO_APPS} \
 "
=20
-CONNECTIVITY_RDEPENDS_append_dra7xx =3D "\
-    ${BT_TI} \
-"
-
 RDEPENDS_${PN} =3D "\
     ${CONNECTIVITY_RDEPENDS} \
 "
--=20
2.17.1


