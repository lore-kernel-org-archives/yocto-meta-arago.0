Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C0B7C529B0
	for <meta-arago@arago-project.org>;
	Fri, 16 Aug 2013 11:00:20 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7GB0ETF008233
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2013 06:00:15 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7GB0CuD020291
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2013 06:00:13 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Fri, 16 Aug 2013 19:00:11 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCHv3] KMSCube: Add Demo 3D graphics application
Thread-Index: AQHOfJKQeygmuE3UIES7RKloopKrqZmX5lLQ
Date: Fri, 16 Aug 2013 11:00:11 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5444396@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: [PATCHv3] KMSCube: Add Demo 3D graphics application
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
X-List-Received-Date: Fri, 16 Aug 2013 11:00:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


* Showcases 3D graphics on SGX using kms and gbm

v2:

* Added DEPENDS for libdrm, libgbm and omap-sgx userspace
* INSANE_SKIP to avoid package dependencies

v3:

* Remove inc file as we have a version only .bb file. This
  fixes the review comment received with v1.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |   18 ++++++++++++++++=
++
 1 files changed, 18 insertions(+), 0 deletions(-)  create mode 100644 meta=
-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/=
meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
new file mode 100644
index 0000000..e18e398
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "Demo application to showcase 3D graphics on SGX using kms and=
 gbm"
+HOMEPAGE =3D "http://git.ti.com"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b=
309d4ee67b7315ff7381270dd631fb"
+
+DEPENDS =3D "libdrm libgbm-glsdk omap5-sgx-ddk-um-linux"
+
+COMPATIBLE_MACHINE =3D "omap-a15"
+
+inherit autotools pkgconfig
+
+SRC_URI =3D "git://git.ti.com/glsdk/kmscube.git;protocol=3Dgit"
+
+S =3D "${WORKDIR}/git"
+
+SRCREV =3D "5a03757c0aa52eff44fb0d8ac0529f8cc18b1da0"
+
+INSANE_SKIP_kmscube +=3D "dev-deps"
--
1.7.0.4


