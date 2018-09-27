Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4DE4F52090
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 16:54:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RGrxDk045192
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 11:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538067239;
	bh=OGt6TqzOG7AOD+2aRMa3Aoq3cPr+M0rVuhjmf4ZNrJE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=XJY4HViM1jOBUEOqhkBkcPGPt1zb6rOTF8cqc7mVHpC5pKSFkryFEze2DSJlPZlg8
	7INlSc44GoBz5/hq2D/+8Y4R3B9nOK9tZuczE+Dxd4agD/mXxE4xcVQQNR1SBsjTWz
	MElwPsKcRTMN84a/KfjQZ4cV+v6DrLVvABwf0lSo=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RGrxaD022086
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 11:53:59 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 11:53:59 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Thu, 27 Sep 2018 11:53:59 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Chengalvala, Vivek" <vchengalvala@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	board-rtos: Removing the bbappend as the changes are upstreamed to
	meta-ti
Thread-Index: AQHUVnZj8xezzgTqp0+eyhor90WLo6UEoRaA//+3NEA=
Date: Thu, 27 Sep 2018 16:53:59 +0000
Message-ID: <7d7667590d734f7a82ea34adefff97d3@ti.com>
References: <1538061940-55063-1-git-send-email-m-radhakrishnan2@ti.com>
	<5481e784099e41c5acc743d279cad93c@ti.com>
In-Reply-To: <5481e784099e41c5acc743d279cad93c@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] board-rtos: Removing the bbappend as the changes are upstreamed to meta-ti
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
X-List-Received-Date: Thu, 27 Sep 2018 16:54:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for noticing this. I will resubmit the patch

-----Original Message-----
From: Chengalvala, Vivek=20
Sent: Thursday, September 27, 2018 12:14 PM
To: Radhakrishnan, Mahesh; meta-arago@arago-project.org
Subject: RE: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH] boa=
rd-rtos: Removing the bbappend as the changes are upstreamed to meta-ti

rocko/master/ti2018.03.,  not morty/meta-processor-sdk.. :)


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Radhakrishnan, Mahesh
Sent: Thursday, September 27, 2018 11:26 AM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH] board-r=
tos: Removing the bbappend as the changes are upstreamed to meta-ti

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/b=
oard-rtos/board-rtos_git.bbappend
deleted file mode 100644
index 32567e2..0000000
--- a/recipes-bsp/board-rtos/board-rtos_git.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PR_append =3D ".tisdk0"
-
-# The year in the license was updated to 2018
-LIC_FILES_CHKSUM =3D "file://board.h;beginline=3D1;endline=3D32;md5=3D9bed=
8e4ac2fb37fc627cefe49eb1c919"
-
-BOARD_SRCREV =3D "983d89de8143645571e7893e95632a8be0fab67e"
--=20
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

