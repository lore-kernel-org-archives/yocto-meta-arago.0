Return-Path: <yan-liu@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E4AD952986
	for <meta-arago@arago-project.org>;
	Mon, 27 Nov 2017 23:11:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vARNBYfU019791
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 17:11:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511824294;
	bh=9d8YWTIECVpYEptFjnuth64HGXE7qDxu6T6RHtNkn/U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=mFKDtE/nFdznNNWaySpd701HVCweiu9bS3JaroAOCOBOYqQSjYHeCAELOh2Chl9Ud
	+LiL7UgzvlUH9G2+Gu1avMgrlq1Q5TGwGUaP74T9MOJLjcDVrsdMKLIIk/mJ7qFzy8
	DlKha3c/NMU+Tsw5PnSBDSm7oRFwRHLlWeuPb32w=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARNBT9D022714
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 17:11:29 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 27 Nov 2017 17:11:29 -0600
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
	DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
	15.01.0845.034; Mon, 27 Nov 2017 17:11:29 -0600
From: "Liu, Yan" <yan-liu@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][PATCH v1] ltp-ddt: Update to latest
Thread-Index: AQHTZ9R1c82Rc6FAnkScFjuYNVP7maMo2hew
Date: Mon, 27 Nov 2017 23:11:29 +0000
Message-ID: <9c7452d6781f4419b4330f4479f96e72@ti.com>
References: <1511823726-2643-1-git-send-email-yan-liu@ti.com>
In-Reply-To: <1511823726-2643-1-git-send-email-yan-liu@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.223]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Mon, 27 Nov 2017 23:11:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Please ignore this one. I will send another one which pulled in another ltp=
-ddt patch shortly.

Thanks,
Yan

-----Original Message-----
From: Liu, Yan=20
Sent: Monday, November 27, 2017 6:02 PM
To: meta-arago@arago-project.org
Cc: Liu, Yan
Subject: [meta-arago][PATCH v1] ltp-ddt: Update to latest

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb=
 b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
index ca30617..0e83556 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
@@ -4,7 +4,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
-PR =3D "r2"
+PR =3D "r3"
 PV_append =3D "+git${SRCPV}"
=20
 PROVIDES +=3D "ltp"
@@ -37,7 +37,7 @@ RDEPENDS_${PN} =3D "\
=20
 inherit autotools-brokensep
=20
-SRCREV =3D "53fa422841f1ed753728af61ca729baaa0519907"
+SRCREV =3D "c70b8372122f95c44b5d86b2ae0cea5e471dd15f"
 BRANCH ?=3D "master"
=20
 SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.=
git;branch=3D${BRANCH} \
--=20
1.7.9.5


