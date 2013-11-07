Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3026B5297F
	for <meta-arago@arago-project.org>;
	Thu,  7 Nov 2013 07:35:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA77ZJ20020970
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 01:35:19 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA77ZJVg023711
	for <meta-arago@arago-project.org>; Thu, 7 Nov 2013 01:35:19 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 7 Nov 2013 01:35:19 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
Thread-Index: AQHO23bL6sE81xWi8EuKy/nNRhgeTJoZXJfg
Date: Thu, 7 Nov 2013 07:35:18 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597FEDD2@DLEE11.ent.ti.com>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Thu, 07 Nov 2013 07:35:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Nelson, Sam
>Sent: Thursday, November 07, 2013 10:34 AM
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

This patch should be submitted to meta-ti@yoctoproject.org which is the met=
a-ti mailing list.

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

Not sure what the NAME variable is for

>+
>+# This package builds a kernel module, use kernel PR as base and
>append a local
>+PR =3D "${MACHINE_KERNEL_PR}"
>+PR_append =3D "a"
>+
>+PKG_${PN} =3D "kernel-module-${PN}"

I think what you are trying to do here is already handled by the package.bb=
class.  I assume you are trying to set the package name to kernel-module-cm=
em-mod?

This raises the question of whether you want this to be cmem-mod for the re=
cipe and PN or if you want cmem for the module and cmem-xyz for the librari=
es.

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

You should use the default do_compile in the module.bbclass I think.  You s=
hould be able to pass this with MAKE_TARGETS variable.

>+}
>+
>+do_install () {
>+    cd ${S}
>+    make -f lu.mak module_install
>KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
>EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
>INSTALL_MOD_PATH=3D"${D}"

Hmmm.  The default do_install for the module.bbclass uses "modules_install"=
 instead of "module_install".  If you can get the lu.mak file updated that =
would be ideal.  If not then you should at least copy the base function whi=
ch unsets some variables.

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

As Sidd pointed out is there any reason not to add the other devices like o=
map-a15 as compatible machines?

>+
>+BRANCH ?=3D "master"
>+#SRCREV =3D "4.00.00.06"

Remove this comment but add one that the commit id below corresponds to rel=
ease 4.00.00.06.

Is there perhaps a value to having the version in the package name instead =
of using _git versions?  Will all SDKs be in step with using the same versi=
on?

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

As Denys pointed out last time, if everything goes into cmem-test then why =
not just call this whole recipe cmem-test since the base cmem package is em=
pty.

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

