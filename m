Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 24D4152A6F
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 13:49:33 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MDnWJv021788
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 08:49:32 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MDnWXa024737
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 08:49:32 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 22 Aug 2012 08:49:32 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago-distro][PATCH] av-examples: Port av-examples from
	Arago
Thread-Index: AQHNgGtBl09buGEO1E2Ra+3XBGpeIZdl2IIg
Date: Wed, 22 Aug 2012 13:49:31 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2A840C@DFLE09.ent.ti.com>
References: <1345643365-4336-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1345643365-4336-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [meta-arago-distro][PATCH] av-examples: Port av-examples from Arago
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
X-List-Received-Date: Wed, 22 Aug 2012 13:49:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Incorrect subject. Updated patch sent.=20

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Wednesday, August 22, 2012 8:49 AM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-arago-distro][PATCH] av-examples: Port av-examples from Arag=
o

* Add av-examples from Arago
* Convert svn repository to git. Update makefiles to create
  needed directories since git doesn't allow empty directories
  to be stored.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../av-examples/av-examples_1.0.bb                 |   33 ++++++++++++++++=
++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/av-examples/av-exa=
mples_1.0.bb

diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1=
.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
new file mode 100644
index 0000000..1025f96
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
@@ -0,0 +1,33 @@
+DESCRIPTION =3D "Linux Audio Video Example Applications"
+HOMEPAGE =3D "https://gforge.ti.com/gf/project/av_examples/"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM :=3D "file://COPYING;md5=3D80ea1ff5788f65d5c5b3206d50d4bc=
6c"
+SECTION =3D "system"
+PRIORITY =3D "optional"
+
+PR =3D "r0"
+
+DEPENDS +=3D "virtual/kernel"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE =3D "(am37x-evm|am3517-evm)"
+
+BRANCH ?=3D "master"
+SRCREV =3D "ac75d09d29a805d89c49dd2741b79f3069e97827"
+
+SRC_URI =3D "git://gitorious.org/av_examples/av_examples.git;protocol=3Dgi=
t;branch=3D${BRANCH}"
+
+S =3D "${WORKDIR}/git"
+
+# TODO: Export LDFLAGS from Rules.make to eliminate use of INSANE_SKIP whi=
ch would otherwise lead to discrepancies between host and arago binaries
+INSANE_SKIP_${PN} =3D "True"
+
+do_compile() {
+	touch debug
+	export CROSS_COMPILE=3D${TARGET_PREFIX}
+	make release LINUXKERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}" PLATFORM=
=3D"${MACHINE}"
+}
+
+do_install() {
+	make DESTDIR=3D${D} install
+}
--=20
1.7.0.4


