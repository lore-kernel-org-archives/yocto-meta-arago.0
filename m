Return-Path: <yan-liu@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8BBA05296D
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 18:23:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2AINmoU005064
	for <meta-arago@arago-project.org>; Fri, 10 Mar 2017 12:23:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489170229;
	bh=o+XL0iHpcBrw2mCNfJuIrWrIwq16LmKwJYWkSeviuWw=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Pwt6XLn0uhNoGwa/8tpV7trElQRyhdogUHJ2SAsZioTfF7sKgQU58je8QfwLERyo5
	Y8RoUZJZzf9fDRVbvkEsLp2HJWczVhc/amtqTV/tjkpB/f0AEl+XqhrjonAlFDfTMJ
	vZ6WDBCVV2ENhYjGdqSH0S2IB+aUCgxtC304LzzM=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2AINmrK023685
	for <meta-arago@arago-project.org>; Fri, 10 Mar 2017 12:23:48 -0600
Received: from DFLE11.ent.ti.com ([fe80::56d:4651:6f4f:2245]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Fri, 10 Mar 2017 12:23:48 -0600
From: "Liu, Yan" <yan-liu@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] ltp-ddt: Update to latest ltp-ddt
Thread-Index: AQHSmctT7rjvtYHvHkOCQ7j7GmhrraGOYzIg
Date: Fri, 10 Mar 2017 18:23:48 +0000
Message-ID: <F6C8C9AE19BA6340B5979F11BB1005B51563D192@DFLE11.ent.ti.com>
References: <1489170216-21929-1-git-send-email-yan-liu@ti.com>
In-Reply-To: <1489170216-21929-1-git-send-email-yan-liu@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: ltp-ddt: Update to latest ltp-ddt
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
X-List-Received-Date: Fri, 10 Mar 2017 18:23:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this one. I forgot to copy the latest commit.

-----Original Message-----
From: Liu, Yan=20
Sent: Friday, March 10, 2017 1:24 PM
To: meta-arago@arago-project.org
Cc: Liu, Yan
Subject: [meta-arago] ltp-ddt: Update to latest ltp-ddt

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb=
 b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
index 2d78fa8..5448baf 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
@@ -4,7 +4,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
-PR =3D "r11"
+PR =3D "r12"
 PV_append =3D "+git${SRCPV}"
=20
 PROVIDES +=3D "ltp"
@@ -14,7 +14,7 @@ RDEPENDS_${PN} +=3D "pm-qa serialcheck"
=20
 inherit autotools-brokensep
=20
-SRCREV =3D "7b43afae8b931541388b0a7e6f65d7ceb6d01b3e"
+SRCREV =3D "9473eaa39794df30e30beadb59bbd53215a70f00"
 BRANCH ?=3D "master"
=20
 SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.=
git;branch=3D${BRANCH}"
--=20
1.7.9.5


