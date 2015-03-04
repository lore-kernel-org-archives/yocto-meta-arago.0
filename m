Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 67D72529BD
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 23:43:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24NhO1H026632;
	Wed, 4 Mar 2015 17:43:24 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24NhNFp009654;
	Wed, 4 Mar 2015 17:43:23 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 4 Mar 2015 17:43:21 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] packagegroup-*-connectivity: enable
	wlan/bt on dra7xx soc unconditionally
Thread-Index: AQHQVpzC11P+pYgx7keL8btsmhboDp0M/Ciw
Date: Wed, 4 Mar 2015 23:43:21 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141042CF@DFLE09.ent.ti.com>
References: <1425488420-16525-1-git-send-email-denis@denix.org>
In-Reply-To: <1425488420-16525-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-*-connectivity: enable wlan/bt on dra7xx soc unconditionally
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
X-List-Received-Date: Wed, 04 Mar 2015 23:43:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is breaking am57xx-evm builds. From " meta-arago-extras/recipes-bsp/bt=
-firmware/bt-firmware_git.bb ":

COMPATIBLE_MACHINE =3D "ti33x|ti43x|dra7xx-evm"

- Jake


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Denys Dmytriyenko
Sent: Wednesday, March 04, 2015 12:00 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] [PATCH] packagegroup-*-connectivity: enable wlan/bt o=
n dra7xx soc unconditionally

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb          | 6 ++=
+---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-connectivity.bb
index 08d2a4a..f157676 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Task to install wireless packages into the target FS"
 LICENSE =3D "MIT"
-PR =3D "r31"
+PR =3D "r32"
=20
 inherit packagegroup
=20
@@ -64,10 +64,10 @@ CONNECTIVITY_RDEPENDS_ti43x =3D "\
     ${FIRMWARE_AND_DRIVERS} \
 "
=20
-CONNECTIVITY_RDEPENDS_dra7xx-evm =3D "\
+CONNECTIVITY_RDEPENDS_dra7xx =3D "\
     ${WLAN_COMMON} \
     ${BLUETOOTH_STACK} \
-    ${@base_contains('ARAGO_BRAND','glsdk','${FIRMWARE_AND_DRIVERS}','',d)=
} \
+    ${FIRMWARE_AND_DRIVERS} \
     bt-firmware \
 "
=20
--=20
2.2.0

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

