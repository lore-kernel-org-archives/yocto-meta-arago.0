Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AAB9A5299E
	for <meta-arago@arago-project.org>;
	Wed, 20 Nov 2013 13:11:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAKDBIUA016610
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2013 07:11:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAKDBIHG010711
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2013 07:11:18 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 20 Nov 2013 07:11:18 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
Thread-Index: AQHO23bL6sE81xWi8EuKy/nNRhgeTJouKauw
Date: Wed, 20 Nov 2013 13:11:18 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015983FDC3@DLEE11.ent.ti.com>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Wed, 20 Nov 2013 13:11:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sam,

Were you going to post an updated set of these patches to meta-ti so you ca=
n align with Mrinmayee? I think your approach of splitting out the packages=
 in linux-utils is a good one and will be cleaner going forward.  Since bot=
h of your groups share these packages aligning between the two would be hel=
pful.

As a side note I assume you have other recipes that depend on the cmem libr=
aries that your cmem recipe provides.  Can you post one of those or share i=
t with Mrinmayee as an example of how you are able to point to the right st=
aging location for the libraries and headers for cmem in other recipes.  I'=
m hoping we can start getting rid of ti-paths.inc but I'd like to see how y=
ou were working around this.

Denys,=20

Since ti-linuxutils has other modules in it for edma, sdma, and irq but tho=
se are only for legacy devices can we just replace the whole ti-linuxutils =
with the cmem package which seems to be the main package needed?  Or do you=
 want to see additional recipes for the sdma, edma, and irq moduled?

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Wednesday, November 06, 2013 11:04 PM
>To: meta-arago@arago-project.org; Nelson, Sam
>Subject: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
>
>- Cmem module is used for user space contiguous memory alloation
>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> recipes-bsp/cmem/cmem-mod_git.bb |   26
>++++++++++++++++++++++++++
> recipes-bsp/cmem/cmem.inc        |   12 ++++++++++++
> recipes-bsp/cmem/cmem_git.bb     |   16 ++++++++++++++++
> 3 files changed, 54 insertions(+)
> create mode 100644 recipes-bsp/cmem/cmem-mod_git.bb
> create mode 100644 recipes-bsp/cmem/cmem.inc
> create mode 100644 recipes-bsp/cmem/cmem_git.bb
>
>diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-
>bsp/cmem/cmem-mod_git.bb
>new file mode 100644
>index 0000000..c402b72
>--- /dev/null
>+++ b/recipes-bsp/cmem/cmem-mod_git.bb
>@@ -0,0 +1,26 @@
>+DESCRIPTION=3D"Contiguous memory allocation kernel module for
>contiguous memory allocation from userspace "
>+
>+include cmem.inc
>+
>+NAME=3D"cmem"
>+
>+# This package builds a kernel module, use kernel PR as base and
>append a local
>+PR =3D "${MACHINE_KERNEL_PR}"
>+PR_append =3D "a"
>+
>+PKG_${PN} =3D "kernel-module-${PN}"
>+
>+S =3D "${WORKDIR}/git"
>+
>+inherit module
>+
>+do_compile () {
>+    cd ${S}
>+    make -f lu.mak module_clean
>+    make -f lu.mak module
>KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
>TOOLCHAIN_PREFIX=3D${CROSS_COMPILE}
>+}
>+
>+do_install () {
>+    cd ${S}
>+    make -f lu.mak module_install
>KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
>EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
>INSTALL_MOD_PATH=3D"${D}"
>+}
>diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
>new file mode 100644
>index 0000000..5d17d8e
>--- /dev/null
>+++ b/recipes-bsp/cmem/cmem.inc
>@@ -0,0 +1,12 @@
>+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
>+
>+LICENSE =3D "GPLv2"
>+LIC_FILES_CHKSUM =3D
>"file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3Db86138d4028fb
>8310b3b983024edc620"
>+
>+COMPATIBLE_MACHINE =3D "keystone-evm"
>+
>+BRANCH ?=3D "master"
>+#SRCREV =3D "4.00.00.06"
>+SRCREV =3D "c2cf2406702bcb889c10d0e6e7d298ba7b84ae7d"
>+
>+SRC_URI =3D
>"git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BRANCH}"
>diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-
>bsp/cmem/cmem_git.bb
>new file mode 100644
>index 0000000..f415630
>--- /dev/null
>+++ b/recipes-bsp/cmem/cmem_git.bb
>@@ -0,0 +1,16 @@
>+DESCRIPTION=3D"The cmem component supports contiguous memory
>allocation from userspace "
>+
>+include cmem.inc
>+
>+RDEPENDS_${PN} =3D "cmem-mod"
>+
>+S =3D "${WORKDIR}/git"
>+
>+PR =3D "r0"
>+
>+PACKAGES =3D+ "${PN}-test"
>+
>+FILES_${PN}-test =3D "${bindir}/*"
>+
>+inherit autotools
>+
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

