Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A822F529B5
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 11:33:37 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHBW1VM097386
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:32:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576582321;
	bh=HW0i3i4zk2YVZDoMjbUaIDtcNudlRCwF0CX9UW8UAEk=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=gBuoWczBks1TSmGBjO2SSE0SkYTh2uDcWsgT+JewyKAe20S0zSZAydWaMLBdUxAK3
	1WUrf7dlPkurg92KrFqYxO1vh896fsdJwqRNf9I8TTWxxp8FayeQ7bMNYY6hHTpmeZ
	6yCsINXcDgujzKePRz69cRLV+L2j+Gcn0Ga/pQp8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHBW1N7124203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 05:32:01 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 05:32:00 -0600
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1847.003; Tue, 17 Dec 2019 05:32:00 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [thud/master][PATCH]
	packagegroup-arago-tisdk-addons-sdk-target: Add IPCDEV packages for
	am65xx
Thread-Index: AQHVtFkDWZ55jy5bZE6B8NTt2XTdtqe+Mn1g
Date: Tue, 17 Dec 2019 11:32:00 +0000
Message-ID: <b6cac9efdfc8448f8417ca1fcf1523ad@ti.com>
References: <1576532235-40823-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1576532235-40823-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.87.211]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [thud/master][PATCH] packagegroup-arago-tisdk-addons-sdk-target: Add IPCDEV packages for am65xx
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
X-List-Received-Date: Tue, 17 Dec 2019 11:33:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please backport to ti2019.05.

Thank you,
Jake

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Nelson, Sam
Sent: Monday, December 16, 2019 4:37 PM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [thud/master][PATCH] packagegroup-arago-ti=
sdk-addons-sdk-target: Add IPCDEV packages for am65xx

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb          |=
 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-tisdk-addons-sdk-target.bb
index 7ba5143..fb12772 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons-sdk-target.bb
@@ -192,6 +192,7 @@ IPCDEV =3D " \
 EXTRA_PACKAGES_append_omap-a15 =3D " ${IPCDEV}"
 EXTRA_PACKAGES_append_keystone =3D " ${IPCDEV}"
 EXTRA_PACKAGES_append_omapl138 =3D " ${IPCDEV}"
+EXTRA_PACKAGES_append_am65xx =3D " ${IPCDEV}"
=20
 RDEPENDS_${PN} =3D "\
     ${UTILS} \
--=20
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

