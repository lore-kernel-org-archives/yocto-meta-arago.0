Return-Path: <karthik.ramanan@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id AA302529A0
	for <meta-arago@arago-project.org>;
	Sun, 21 Feb 2021 11:00:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11LB11Os077594
	for <meta-arago@arago-project.org>; Sun, 21 Feb 2021 05:01:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613905261;
	bh=tx4HbCGF1xcmf05hbXScSh/516X7U7vE1CNxzZAUkho=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=qzhGJszHrcmXmPvztnnfFPwjvniOi++zreb+P7be+RZZQu70qRp9WR5KoKO8WkYtB
	DlLb9xpJQZ6Cz/j3AAhWUEaHeXxvrsAg3XpV8qKBJIzHs+uxCuGVt8bH4FIrHHWTno
	7WwMvDP5aXrfVNssbLwrjDpK/AEjAh2rmE4MdfWw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11LB11Bu047419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sun, 21 Feb 2021 05:01:01 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sun, 21 Feb 2021 05:01:01 -0600
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
	DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
	15.01.1979.003; Sun, 21 Feb 2021 05:01:00 -0600
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "J, KEERTHY" <j-keerthy@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] meta-arago-extras: recipes-devtools: statcol: Add power
	monitoring support
Thread-Index: AQHXBHP9TNUtThtYFk2FmvhqrZvXUqpieLeQ
Date: Sun, 21 Feb 2021 11:01:00 +0000
Message-ID: <e2097e2cdc5f4cd680247439bf3d7290@ti.com>
References: <20210216145652.16871-1-j-keerthy@ti.com>
In-Reply-To: <20210216145652.16871-1-j-keerthy@ti.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.174.192]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [PATCH] meta-arago-extras: recipes-devtools: statcol: Add power monitoring support
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
X-List-Received-Date: Sun, 21 Feb 2021 11:00:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

-----Original Message-----
From: J, KEERTHY=20
Sent: Tuesday, 16 February, 2021 8:27 PM
To: meta-arago@arago-project.org
Cc: Weaver, Lucas <l-weaver@ti.com>; J, KEERTHY <j-keerthy@ti.com>; R, Kart=
hik <karthik.ramanan@ti.com>; J, KEERTHY <j-keerthy@ti.com>
Subject: [PATCH] meta-arago-extras: recipes-devtools: statcol: Add power mo=
nitoring support

From: Keerthy <a0393675@ti.com>

Add power monitoring support

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-a=
rago-extras/recipes-devtools/statcol/statcol.bb
index bb841d08..12e10bcf 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb6bc27cd44417c3=
89a180bd62f552a0"
=20
 PROTOCOL =3D "git"
 BRANCH =3D "master"
-SRCREV =3D "6420b4e6d98dc2c6825557d7d6f56ffd52fd230c"
+SRCREV =3D "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
 SRC_URI =3D "git://git.ti.com/glsdk/statcol.git;protocol=3D${PROTOCOL};bra=
nch=3D${BRANCH}"
=20
 DEPENDS =3D "ti-rpmsg-char websocketd"
@@ -18,3 +18,5 @@ EXTRA_OEMAKE +=3D "SYSROOT=3D${STAGING_DIR_TARGET} CROSS_=
COMPILE=3D${TARGET_PREFIX}"
 do_install() {
 	DESTDIR=3D${D} make install
 }
+
+PR_append =3D "_3"
--=20
2.17.1


