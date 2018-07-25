Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6A691529AE
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 13:59:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PDx2MD052388
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 08:59:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532527142;
	bh=lRyMHL1soz+lMBFjTRQS4n/13fKGnOBQrGiI41Pxmlk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=asAohH0DDq93mB2qzTyzgfzmifZ6ECHQNKhEylqJWl/xMss3wp6xbjmjq0PC3IU0x
	yceBHb+XmJW3ncKTi9ULlyykMn6XNAGPfJ5aPTbh8/RXCpeWe2D4WnX31b3WsMVBsS
	JXLicflURLSqQcFd0OFb2XbC9G4u0w3Psf1ZEqUo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PDx2ac001443
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 08:59:02 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 08:59:01 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1466.003; Wed, 25 Jul 2018 08:59:01 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH 3/3] packagegroup-arago-tisdk-opencl:
	add tidl-utils
Thread-Index: AQHUJA/AIUTTL7h9zkWeIlMudxH1r6Sf9xsw
Date: Wed, 25 Jul 2018 13:59:01 +0000
Message-ID: <bf08bfd0953a4eb89d87a43a50a8a6cb@ti.com>
References: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
	<1532519588-17585-3-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1532519588-17585-3-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.111.218]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][PATCH 3/3] packagegroup-arago-tisdk-opencl: add tidl-utils
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
X-List-Received-Date: Wed, 25 Jul 2018 13:59:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, July 25, 2018 7:53 AM
To: meta-arago@arago-project.org
Cc: Chengalvala, Vivek; Stiffler, Jacob; Senicic, Djordje
Subject: [meta-processor-sdk][PATCH 3/3] packagegroup-arago-tisdk-opencl: a=
dd tidl-utils

Cc: Djordje Senicic <x0157990@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend | 4 ++=
--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bba=
ppend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
index 782affe..b1b74a9 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
@@ -1,6 +1,6 @@
-PR_append =3D ".tisdk0"
+PR_append =3D ".tisdk1"
=20
-TIDL_PKGS =3D "tidl-examples-dev tidl-viewer"
+TIDL_PKGS =3D "tidl-examples-dev tidl-viewer tidl-utils"
=20
 EXTRA_PKGS_append_am57xx-evm =3D " ${TIDL_PKGS}"
 EXTRA_PKGS_append_am57xx-hs-evm =3D " ${TIDL_PKGS}"
--=20
2.7.4


