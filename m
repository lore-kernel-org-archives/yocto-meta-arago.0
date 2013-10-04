Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A1247529CC
	for <meta-arago@arago-project.org>;
	Fri,  4 Oct 2013 15:01:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94F1RC3000727
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 10:01:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94F1Rfg018879
	for <meta-arago@arago-project.org>; Fri, 4 Oct 2013 10:01:27 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 4 Oct 2013 10:01:27 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] Generalize PACKAGE_BOOT_UIMAGE variable
Thread-Index: AQHOvspe2+PvJnRry0KS/JcE7YOYLpnhtt6AgALwe4A=
Date: Fri, 4 Oct 2013 15:01:27 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C56B041@DFLE08.ent.ti.com>
References: <1380650659-16536-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015977A7B9@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015977A7B9@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] Generalize PACKAGE_BOOT_UIMAGE variable
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
X-List-Received-Date: Fri, 04 Oct 2013 15:01:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Are you ok with this patch?

> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, October 02, 2013 8:07 AM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 1/3] Generalize PACKAGE_BOOT_UIMAGE
> variable
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> But this isn't for meta-arago so the subject is misleading.
>=20
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Tuesday, October 01, 2013 1:04 PM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [PATCH 1/3] Generalize PACKAGE_BOOT_UIMAGE
> >variable
> >
> >* The device tree files along with the uImage sometimes aren't used in
> >the boot
> >  partition.
> >* To reflect this change the variable PACKAGE_BOOT_UIMAGE to
> >  PACKAGE_BOOT_KERNEL_FILES.
> >* Also when this variable is set to false remove the kernel and dtb
> >files from
> >  the boot partition instead of avoiding renaming it.
> >
> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > configs/amsdk-config-05.06.00.00.txt     |   10 +++++-----
> > configs/amsdk-config-05.07.00.00.txt     |   10 +++++-----
> > configs/amsdk-config-06.00.00.00.txt     |   10 +++++-----
> > configs/amsdk-config-07.00.00.00.txt     |   10 +++++-----
> > configs/arago-core-amsdk-2013.04.01.txt  |   10 +++++-----
> > configs/arago-core-tisdk-2013.04.00.txt  |   10 +++++-----
> > configs/arago-core-tisdk-2013.04.01.txt  |   10 +++++-----
> > configs/arago-core-tisdk-2013.04.02.txt  |   10 +++++-----
> > configs/arago-core-tisdk-dylan-puget.txt |   10 +++++-----
> > configs/arago-core-tisdk-puget.txt       |   10 +++++-----
> > lib/oesdk/package-sdks                   |   12 ++++++++----
> > 11 files changed, 58 insertions(+), 54 deletions(-)
> >
> >diff --git a/configs/amsdk-config-05.06.00.00.txt b/configs/amsdk-
> >config-05.06.00.00.txt index 706a24b..f2d3d1f 100644
> >--- a/configs/amsdk-config-05.06.00.00.txt
> >+++ b/configs/amsdk-config-05.06.00.00.txt
> >@@ -216,11 +216,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"true"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"true"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/amsdk-config-05.07.00.00.txt b/configs/amsdk-
> >config-05.07.00.00.txt index 3b0ba8e..8a7107a 100644
> >--- a/configs/amsdk-config-05.07.00.00.txt
> >+++ b/configs/amsdk-config-05.07.00.00.txt
> >@@ -231,11 +231,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"true"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"true"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/amsdk-config-06.00.00.00.txt b/configs/amsdk-
> >config-06.00.00.00.txt index edf8ba7..ea84183 100644
> >--- a/configs/amsdk-config-06.00.00.00.txt
> >+++ b/configs/amsdk-config-06.00.00.00.txt
> >@@ -237,11 +237,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"true"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"true"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/amsdk-config-07.00.00.00.txt b/configs/amsdk-
> >config-07.00.00.00.txt index 1f4c86d..a011f83 100644
> >--- a/configs/amsdk-config-07.00.00.00.txt
> >+++ b/configs/amsdk-config-07.00.00.00.txt
> >@@ -237,11 +237,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"true"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"true"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/arago-core-amsdk-2013.04.01.txt
> >b/configs/arago-core-amsdk-2013.04.01.txt
> >index 4c7e1bd..420452b 100644
> >--- a/configs/arago-core-amsdk-2013.04.01.txt
> >+++ b/configs/arago-core-amsdk-2013.04.01.txt
> >@@ -239,11 +239,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"false"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"false"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/arago-core-tisdk-2013.04.00.txt
> >b/configs/arago-core-tisdk-2013.04.00.txt
> >index ef228ca..a811dbd 100644
> >--- a/configs/arago-core-tisdk-2013.04.00.txt
> >+++ b/configs/arago-core-tisdk-2013.04.00.txt
> >@@ -239,11 +239,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"true"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"true"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/arago-core-tisdk-2013.04.01.txt
> >b/configs/arago-core-tisdk-2013.04.01.txt
> >index ffeb1d2..35c9df3 100644
> >--- a/configs/arago-core-tisdk-2013.04.01.txt
> >+++ b/configs/arago-core-tisdk-2013.04.01.txt
> >@@ -239,11 +239,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"false"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"false"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/arago-core-tisdk-2013.04.02.txt
> >b/configs/arago-core-tisdk-2013.04.02.txt
> >index 55ba7d8..f2b1db8 100644
> >--- a/configs/arago-core-tisdk-2013.04.02.txt
> >+++ b/configs/arago-core-tisdk-2013.04.02.txt
> >@@ -239,11 +239,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"false"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"false"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/arago-core-tisdk-dylan-puget.txt
> >b/configs/arago-core-tisdk-dylan-puget.txt
> >index 5398e87..a2639f7 100644
> >--- a/configs/arago-core-tisdk-dylan-puget.txt
> >+++ b/configs/arago-core-tisdk-dylan-puget.txt
> >@@ -238,11 +238,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"false"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"false"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/configs/arago-core-tisdk-puget.txt b/configs/arago-
> >core-tisdk-puget.txt index 8e1fd98..cfda50f 100644
> >--- a/configs/arago-core-tisdk-puget.txt
> >+++ b/configs/arago-core-tisdk-puget.txt
> >@@ -238,11 +238,11 @@
> >INSTALL_BUILDER_PROJECT=3D"$SCRIPTS_ROOT/installer-files/tisdk.xml"
> > # the symlink.
> > SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
> >
> >-# This variable determines whether the uImage should be placed in the
> >boot -# partition tarball or not.  For newer kernel and u-boot
> >combinations the -# uImage is kept in the rootfs partition and placing
> >it in the boot partition -# will cause confusion.
> >-PACKAGE_BOOT_UIMAGE=3D"false"
> >+# This variable determines whether the uImage and dtb files
> >should be placed in
> >+# the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> >+# the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> >+# the boot partition will cause confusion.
> >+PACKAGE_BOOT_KERNEL_FILES=3D"false"
> >
> > # This variable points to the directory where the webgen tool has been
> ># Installed.
> >diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks index
> >148dadc..49f1fe7 100644
> >--- a/lib/oesdk/package-sdks
> >+++ b/lib/oesdk/package-sdks
> >@@ -42,15 +42,19 @@ create_sd_card_content() {
> >         mv u-boot-$m.bin u-boot.bin
> >     fi
> >
> >-    # For some devices the uImage is read from the /boot
> >directory of the
> >-    # rootfs.  In this case do not package the uImage into the
> >boot partition
> >-    # as it will cause confusion.
> >-    if [ "$PACKAGE_BOOT_UIMAGE" =3D "true" ]
> >+    # For some devices the uImage  and dtb files are read from
> >the /boot
> >+    # directory of the rootfs.  In this case do not package the
> >uImage
> >+    # and device tree files into the boot partition as it will
> >cause
> >+    # confusion.
> >+    if [ "$PACKAGE_BOOT_KERNEL_FILES" =3D "true" ]
> >     then
> >         if [ -e uImage-$m.bin ]
> >         then
> >             mv uImage-$m.bin uImage
> >         fi
> >+    else
> >+        rm -f uImage*
> >+        rm -f *.dtb
> >     fi
> >
> >     # Copy the MLO if it exists for the device
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

