Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3262752A66
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2013 22:52:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4EMq8aq021046
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 17:52:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4EMq8Ar023336
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 17:52:08 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 14 May 2013 17:52:07 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCHv3] arago-console: Adding pciutils package
Thread-Index: Ac5Q9Y2MWQrkiXv5SN6eVDVS5BdoSw==
Date: Tue, 14 May 2013 22:52:06 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905491F83E@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: [PATCHv3] arago-console: Adding pciutils package
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
X-List-Received-Date: Tue, 14 May 2013 22:52:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

   pciutils provides very basic utilities for
   querying the devices on the pci bus, when pci
   interface is supported in the platform and
   useful to be part of the console package

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-console.bb    |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-console.bb
index 5a80064..537f050 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb
@@ -1,6 +1,8 @@
 DESCRIPTION =3D "Extended task to get more basic and console apps"
 LICENSE =3D "MIT"
-PR =3D "r5"
+PR =3D "r6"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
@@ -25,6 +27,7 @@ ARAGO_UTILS =3D "\
     i2c-tools \
     iproute2 \
     strace \
+    ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
     "
=20
 ARAGO_SDK_PREREQ =3D "\
--=20
1.7.9.5


