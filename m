Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7DE4952093
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 13:46:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TDkuxD017624
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 08:46:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TDkunb012880
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 08:46:56 -0500
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Fri, 29 May 2015 08:46:56 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] recovery-kernel: add recovery kernel dtb build for K2L
	and K2E
Thread-Index: AQHQmLxKMW2+vwnr6EONoye7X/aj7J2S+kyQ
Date: Fri, 29 May 2015 13:46:56 +0000
Message-ID: <ECA334CFBA16F74DB2C66A2F1181F4D63F9A88E4@DLEE09.ent.ti.com>
References: <1432758765-28548-1-git-send-email-hzhang@ti.com>
In-Reply-To: <1432758765-28548-1-git-send-email-hzhang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] recovery-kernel: add recovery kernel dtb build for K2L and K2E
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
X-List-Received-Date: Fri, 29 May 2015 13:46:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: Zhang, Hao=20
Sent: Wednesday, May 27, 2015 4:33 PM
To: meta-arago@arago-project.org
Cc: Zhang, Hao
Subject: [PATCH] recovery-kernel: add recovery kernel dtb build for K2L and=
 K2E

From: Hao Zhang <hzhang@ti.com>

The patch adds the Linux recovery kernel device tree build for K2L and K2E =
devices based on kernel v3.10.72.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../recovery-kernel/recovery-kernel_1.0.bb         |   18 ++++++++++++----=
--
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kern=
el_1.0.bb b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kerne=
l_1.0.bb
index ad3528e..6e4f9c7 100644
--- a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.=
bb
+++ b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1
+++ .0.bb
@@ -1,10 +1,10 @@
 DESCRIPTION =3D "Recovery kernel building for Keystone EVM"
 LICENSE =3D "GPLv2"
=20
-PR =3D "r2"
+PR =3D "r3"
 COMPATIBLE_MACHINE =3D "keystone"
-BRANCH =3D "master"
-SRCREV =3D "9bc93706b37c39c3a95593dc3d56773e9b7425ad"
+BRANCH =3D "v3.10.72/master"
+SRCREV =3D "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
 SRC_URI =3D "git://git.ti.com/keystone-linux/linux.git;protocol=3Dgit;bran=
ch=3D${BRANCH}"
 S =3D "${WORKDIR}/git"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd=
7"
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb=
0aad327b76f1be7cd7"
 FILES_${PN} +=3D "${bindir}/crashdump"
 LINUX_ZIMAGE =3D "zImage"
 KERNEL_MACHINE ?=3D "keystone2_recovery_defconfig"
-KERNEL_DTBTYPE =3D "k2hk-evm-recovery.dtb"
+KERNEL_DTBTYPE =3D "k2hk-evm-recovery.dtb k2l-evm-recovery.dtb k2e-evm-rec=
overy.dtb "
 CRASHDIR =3D "crashdump"
 ARCH =3D "${TARGET_ARCH}"
 CROSS_COMPILE =3D "${TARGET_PREFIX}"
@@ -27,11 +27,17 @@ do_configure () {
 do_compile() {
 	make ${LINUX_ZIMAGE} KALLSYMS_EXTRA_PASS=3D1
 	make ${KERNEL_DTBTYPE}
-	dtc -I dtb -O dtb -p 2048 -o ${KERNEL_DTBTYPE} arch/arm/boot/dts/${KERNEL=
_DTBTYPE}
+        for d in ${KERNEL_DTBTYPE}
+        do
+            dtc -I dtb -O dtb -p 2048 -o $d arch/arm/boot/dts/$d
+        done
 }
=20
 do_install () {
 	install -d ${D}${bindir}/${CRASHDIR}/
 	install ${S}/arch/arm/boot/${LINUX_ZIMAGE} ${D}${bindir}/${CRASHDIR}
-	install ${S}/${KERNEL_DTBTYPE} ${D}${bindir}/${CRASHDIR}
+        for d in ${KERNEL_DTBTYPE}
+        do
+            install ${S}/$d ${D}${bindir}/${CRASHDIR}
+        done
 }
--
1.7.9.5


