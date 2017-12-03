Return-Path: <eyalr@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8E18352A42
	for <meta-arago@arago-project.org>;
	Sun,  3 Dec 2017 10:38:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB3AcjTW008146
	for <meta-arago@arago-project.org>; Sun, 3 Dec 2017 04:38:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512297525;
	bh=i6b0pbwq2lO3dawz5YvHFxhbiOwbbo8yAMCr4BkWpF4=;
	h=From:To:CC:Subject:Date;
	b=ZF/zQ8zbc0mJR921/3oCQIYGJ/QAyoJLSXCqDOo7oWyRkFrfI10SyEFIuAcEgCOvc
	7ntj0c+5M+n6Efz9tqdYS9zccNAREPaEcNTwCc5287xhVPMBD8G/QXpQBpPm+kjAwZ
	P2X36zvofpYpqgpQjhz5R4eNjRAzLiYLqy6aVCLA=
Received: from DFRE70.ent.ti.com (dncmailx.itg.ti.com [10.167.188.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB3AceOf013540
	for <meta-arago@arago-project.org>; Sun, 3 Dec 2017 04:38:40 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE70.ent.ti.com ([fe80::645e:109b:13d3:dfa7%25]) with mapi id
	14.03.0294.000; Sun, 3 Dec 2017 11:38:39 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/2] wpa-supplicant-wl18xx: update recipe for version
	R8.7_SP3
Thread-Index: AdNsItnSg8TUtEVaSy+wVhHvaUC4Ag==
Date: Sun, 3 Dec 2017 10:38:39 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B364A85BA@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.94]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH 1/2] wpa-supplicant-wl18xx: update recipe for version R8.7_SP3
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
X-List-Received-Date: Sun, 03 Dec 2017 10:38:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb              | 16 ++++++++----=
----
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supp=
licant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wp=
a-supplicant-wl18xx.bb
index 9e98080..1b3b8d0 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-=
wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-=
wl18xx.bb
@@ -4,19 +4,19 @@
 require wpa-supplicant.inc
=20
 LICENSE =3D "GPLv2 | BSD"
-LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D36b27801447e0662ee0138d17fe9=
3880 \
-                    file://../README;md5=3D7f393579f8b109fe91f3b9765d26c7d=
3 \
-                    file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=
=3D8a3131126465e08eb6b8d17ea880e162"
+LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D292eece3f2ebbaa25608eed84640=
18a3 \
+                    file://../README;md5=3D3f01d778be8f953962388307ee38ed2=
b \
+                    file://wpa_supplicant.c;beginline=3D1;endline=3D17;md5=
=3D35e6d71fea6b15f61a9fac935bcf410f"
=20
 FILESEXTRAPATHS_append :=3D ":${THISDIR}/wpa-supplicant"
=20
-# Tag: R8.6
-SRCREV =3D "f80fe345acf103ba6882ac8396f19584ac184904"
-BRANCH =3D "upstream_24"
-PR_append =3D "a"
+# Tag: R8.7_SP3
+SRCREV =3D "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
+BRANCH =3D "upstream_25_rebase"
+PR_append =3D "b"
=20
 # Add ti to the PV to indicate that this is a TI modify version of wpa-sup=
plicant.
-PV =3D "R8.6-devel-ti+git${SRCPV}"
+PV =3D "R8.7_SP3-devel-ti+git${SRCPV}"
=20
 PROVIDES +=3D "wpa-supplicant"
 RPROVIDES_${PN}  +=3D "wpa-supplicant"
--=20
2.7.4


