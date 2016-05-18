Return-Path: <anandb@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C689A52A0B
	for <meta-arago@arago-project.org>;
	Wed, 18 May 2016 07:24:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4I7O4hD027219;
	Wed, 18 May 2016 02:24:04 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4I7O3p0017382;
	Wed, 18 May 2016 02:24:04 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4I7O0El021449;
	Wed, 18 May 2016 12:54:02 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Wed, 18 May 2016 12:54:00 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [RFC][PATCH 2/2] weston-init: disable systemd
	service to fall back to old initscript
Thread-Index: AQHRr/kxfQ0P7DNtrE+t2Tcs4ZQGlJ++TB+g
Date: Wed, 18 May 2016 07:23:59 +0000
Message-ID: <05CF4794C98B244ABDC620C10903762273299878@DBDE04.ent.ti.com>
References: <1463461288-32423-1-git-send-email-denis@denix.org>
	<1463461288-32423-2-git-send-email-denis@denix.org>
In-Reply-To: <1463461288-32423-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [RFC][PATCH 2/2] weston-init: disable systemd service to fall back to old initscript
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
X-List-Received-Date: Wed, 18 May 2016 07:24:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Instead of the following:=20
> +    rm -rf ${D}${systemd_system_unitdir}

should you have this line:
rm -f ${D}${systemd_system_unitdir}/weston.service

Regards,
Anand

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Denys Dmytriyenko
Sent: Tuesday, May 17, 2016 10:31 AM
To: meta-arago@arago-project.org
Subject: [meta-arago] [RFC][PATCH 2/2] weston-init: disable systemd service=
 to fall back to old initscript

From: Denys Dmytriyenko <denys@ti.com>

Touchscreen calibration and other customizations are required from initscri=
pt

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend  | 5 ++++-=
  meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappen=
d b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 78a839f..041e5ab 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,4 +1,4 @@
-PR_append =3D ".arago6"
+PR_append =3D ".arago7"
=20
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
=20
@@ -9,4 +9,7 @@ SRC_URI_append =3D " \
 do_install_append() {
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
+    rm -rf ${D}${systemd_system_unitdir}
 }
+
+SYSTEMD_SERVICE_${PN} =3D ""
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWest=
on b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
index 6ef574a..aed5d5f 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
=20
 clear
 cat << EOF
--
2.2.0

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

