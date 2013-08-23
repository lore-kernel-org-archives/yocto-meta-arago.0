Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 73B485299F
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 14:39:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NEdCU8024068
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 09:39:12 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NEdCAj023597
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 09:39:12 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 09:39:12 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/4]
	packagegroup-arago-tisdk-amsdk-sdk-host:	Use new board-port-labs recipe
Thread-Index: AQHOn4AA57sfEq/r1kmaZqyPR9V3g5mi3bfQ
Date: Fri, 23 Aug 2013 14:39:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DCE08@DLEE11.ent.ti.com>
References: <1377209433-10830-1-git-send-email-fcooper@ti.com>
	<1377209433-10830-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1377209433-10830-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] packagegroup-arago-tisdk-amsdk-sdk-host:	Use new board-port-labs recipe
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
X-List-Received-Date: Fri, 23 Aug 2013 14:39:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, August 22, 2013 5:11 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 4/4] packagegroup-arago-tisdk-amsdk-
>sdk-host: Use new board-port-labs recipe
>
>* Switch from using the old board-port-labs recipe to the new
>recipes.
>* Delete old recipe.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    5 ++-
> .../board-port-labs/board-port-labs/LICENSE        |   16 -------
>---
> .../board-port-labs/board-port-labs_git.bb         |   32 -------


I would have split this into two patches.  One to update which recipe to us=
e in the package group and one to remove the old recipe.  That way if someo=
ne ever wanted to resurrect the old recipe they can do that easier.

>-------------
> 3 files changed, 3 insertions(+), 50 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs/LICENSE
> delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs_git.bb
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-amsdk-sdk-host.bb
>index 70f767d..94d8288 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-amsdk-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-amsdk-sdk-host.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install additional scripts and
>applications into the SDK"
> LICENSE =3D "MIT"
>-PR =3D "r11"
>+PR =3D "r12"
>
> inherit packagegroup
>
>@@ -24,7 +24,8 @@ RDEPENDS_${PN} =3D "\
>     ${TOOLS} \
>     ti-tisdk-setup \
>     ${EXTRA_FILES} \
>-    board-port-labs-src \
>+    board-port-labs-u-boot-src \
>+    board-port-labs-linux-src \
>     ti-tisdk-makefile \
>     ${U-BOOT_SRC} \
>     ${KERNEL_SRC} \
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs/LICENSE b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs/LICENSE
>deleted file mode 100644
>index 738cb23..0000000
>--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs/LICENSE
>+++ /dev/null
>@@ -1,16 +0,0 @@
>-The trees found within this directory are git trees for the Linux
>-kernel and u-boot.  These trees are based on the AM335x part and
>-are meant to serve as a reference for general tasks involved in a
>board
>-port.  These trees go along with the training available at:
>-
>-http://processors.wiki.ti.com/index.php/Sitara_Linux_Training
>-
>-Inside of each directory is a full git repository.  These
>repositories
>-have tags that make isolating the changes for each functionality
>easier.
>-You can view the tag using the "git tag" command and use "gitk --
>all"
>-to better view the git tree contents.
>-
>-The individual trees are licensed under the same license as the
>Linux
>-kernel and u-boot sources which is the GPLv2 license. A copy of
>license
>-for the kernel and u-boot can be found in a file called COPYING
>within
>-each of the respective git repositories.
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs_git.bb b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs_git.bb
>deleted file mode 100644
>index b7f7d29..0000000
>--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs_git.bb
>+++ /dev/null
>@@ -1,32 +0,0 @@
>-DESCRIPTION =3D "Git repositories containing sample board port
>code"
>-HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
>-LICENSE =3D "GPLv2"
>-DEPENDS +=3D "git-native"
>-
>-SRC_URI =3D "file://LICENSE"
>-LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3Dd9fb2a547cd8e6bb75c0ecf427a139a9"
>-
>-inherit allarch
>-
>-CREATE_SRCIPK =3D "1"
>-SRCIPK_INSTALL_DIR =3D "board-support/board-port-labs"
>-
>-PR =3D "r5"
>-
>-REPOS ?=3D "git://gitorious.org/sitara-board-port/sitara-board-
>port-linux.git \
>-          git://gitorious.org/sitara-board-port/sitara-board-
>port-uboot.git \
>-         "
>-
>-S =3D "${WORKDIR}"
>-
>-# Checkout the REPOS before the do_patch task so that it will be
>done prior
>-# to the srcipk being made.
>-do_repos_checkout() {
>-    cd ${S}
>-    for r in ${REPOS}
>-    do
>-        git clone $r
>-    done
>-}
>-
>-addtask repos_checkout after do_fetch before do_patch
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

