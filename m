Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8118152990
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 17:52:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61HqD04019555;
	Mon, 1 Jul 2013 12:52:13 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61HqD4L012564;
	Mon, 1 Jul 2013 12:52:13 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 12:52:13 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] arago-test: define system test
	packagegroup and image
Thread-Index: AQHOdnhgj+S3NxBZSk6NKANgNHAeIZlQGltA
Date: Mon, 1 Jul 2013 17:52:12 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015962C583@DLEE11.ent.ti.com>
References: <1372696212-29133-1-git-send-email-denis@denix.org>
In-Reply-To: <1372696212-29133-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arago-test: define system test	packagegroup and image
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
X-List-Received-Date: Mon, 01 Jul 2013 17:52:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, July 01, 2013 11:30 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/2] arago-test: define system test
>packagegroup and image
>
>From: Carlos Hernandez <ceh@ti.com>
>

Commit message would be nice for why this image exists.

>Signed-off-by: Carlos Hernandez <ceh@ti.com>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-core/images/arago-test-image.bb         | 21
>+++++++++++++++++++++
> .../packagegroups/packagegroup-arago-test-addons.bb | 20
>++++++++++++++++++++
> 2 files changed, 41 insertions(+)
> create mode 100644 meta-arago-distro/recipes-core/images/arago-
>test-image.bb
> create mode 100644 meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-test-addons.bb
>
>diff --git a/meta-arago-distro/recipes-core/images/arago-test-
>image.bb b/meta-arago-distro/recipes-core/images/arago-test-
>image.bb
>new file mode 100644
>index 0000000..49e5a8d
>--- /dev/null
>+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
>@@ -0,0 +1,21 @@
>+# Arago System Test image
>+# gives you test applications
>+LICENSE =3D "MIT"
>+LIC_FILES_CHKSUM =3D
>"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
>+
>+require arago-image.inc
>+
>+COMPATIBLE_MACHINE =3D
>"omap3|dm365|omapl138|ti813x|ti814x|ti816x|omap4|ti33x"
>+
>+IMAGE_INSTALL +=3D "\
>+    packagegroup-arago-base \
>+    packagegroup-arago-console \
>+    packagegroup-arago-base-tisdk \
>+    packagegroup-arago-tisdk-crypto \
>+    packagegroup-arago-tisdk-multimedia \
>+    packagegroup-arago-tisdk-addons \
>+    packagegroup-arago-test \
>+    packagegroup-arago-test-addons \
>+    "
>+
>+export IMAGE_BASENAME =3D "arago-test-image"
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-test-addons.bb b/meta-arago-
>distro/recipes-core/packagegroups/packagegroup-arago-test-
>addons.bb
>new file mode 100644
>index 0000000..3f44133
>--- /dev/null
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-test-addons.bb
>@@ -0,0 +1,20 @@
>+DESCRIPTION =3D "Task to install additional utilities/demos for
>test image"
>+LICENSE =3D "MIT"
>+LIC_FILES_CHKSUM =3D
>"file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4
>de20420"
>+PR =3D "r0"
>+
>+ALLOW_EMPTY =3D "1"
>+
>+inherit packagegroup
>+
>+TEST_ADDONS =3D " \
>+    bridge-utils \
>+    "
>+
>+TEST_ADDONS_TI =3D " \
>+    "
>+
>+RDEPENDS_${PN} =3D "\
>+    ${TEST_ADDONS} \
>+    ${TEST_ADDONS_TI} \
>+    "
>--
>1.8.2.1
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

