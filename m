Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 15204529B5
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 11:33:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHBVinx000995
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:31:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576582304;
	bh=Jh7UpMTZu7vPvWP688OJS/OQs9rEfYnMgMn6uqAWwIQ=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=sIaba0UeLdqUmoCMirbKMR3ilLmSkW0X3ltvljxR8akiZaP8Qifj+DZDew+XLy2O6
	PfrsHE3rl4zDstoTfxjqLuGGEJPSGDUDGsB8syuxe+oku+A4J1z/GBGwVFlcrI4OSm
	ksc550OkHrNv67DadLc47oUaOG1x/a1q/JUujFso=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHBViEN123974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:31:44 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 05:31:43 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Tue, 17 Dec 2019 05:31:43 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master/thud/ti2019.05] [PATCH]
	matrix-gui-apps-git: bump SRCREV to update armnn_demo_livecam scripts
Thread-Index: AQHVsT+j8/OBNElNgk6sRZghuXFmvae+OJxw
Date: Tue, 17 Dec 2019 11:31:43 +0000
Message-ID: <bad79edd15744deda75f30478312e0a8@ti.com>
References: <20191212225329.28622-1-a0271529@ti.com>
In-Reply-To: <20191212225329.28622-1-a0271529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master/thud/ti2019.05] [PATCH] matrix-gui-apps-git: bump SRCREV to update armnn_demo_livecam scripts
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
X-List-Received-Date: Tue, 17 Dec 2019 11:33:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please backport to ti2019.05.

Thank you,
Jake

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Gou, Hongmei
Sent: Thursday, December 12, 2019 5:53 PM
To: meta-arago@arago-project.org
Cc: Gou, Hongmei
Subject: [EXTERNAL] [meta-arago] [master/thud/ti2019.05] [PATCH] matrix-gui=
-apps-git: bump SRCREV to update armnn_demo_livecam scripts

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc =
b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index ef4ffd21..d4956903 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb25f=
373057fa9"
 LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
=20
 SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protoco=
l=3Dgit;branch=3D${BRANCH}"
-SRCREV =3D "c062a7a1b465e3a0d2761abff8808606e88619e5"
+SRCREV =3D "30424117fc609beffb512450fe0d9b328d75b458"
 BRANCH =3D "master"
-INC_PR =3D "r75"
+INC_PR =3D "r76"
=20
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
--=20
2.17.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

