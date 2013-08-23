Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B32C252A19
	for <meta-arago@arago-project.org>;
	Fri, 23 Aug 2013 14:36:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NEaU9H005588
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 09:36:30 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NEaUmr020277
	for <meta-arago@arago-project.org>; Fri, 23 Aug 2013 09:36:30 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 09:36:29 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Rini, Tom" <trini@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/4] board-port-labs: Use new
	SRCIPK_PRESERVE_GIT git feature in sourceipk.bbclass
Thread-Index: AQHOn3/+RHR6p9fG8UG2eR17ePBeU5mi2p0w
Date: Fri, 23 Aug 2013 14:36:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DCDC5@DLEE11.ent.ti.com>
References: <1377209433-10830-1-git-send-email-fcooper@ti.com>
	<1377209433-10830-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1377209433-10830-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] board-port-labs: Use new	SRCIPK_PRESERVE_GIT git feature in sourceipk.bbclass
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
X-List-Received-Date: Fri, 23 Aug 2013 14:36:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, August 22, 2013 5:11 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 3/4] board-port-labs: Use new
>SRCIPK_PRESERVE_GIT git feature in sourceipk.bbclass
>
>* Do to the inability to keep the git repository intact the board
>port labs
>  recipe manually ran git clone which took a very long time every
>time the
>  recipe was built.
>* Using the new SRCIPK_PRESERVE_GIT feature in sourceipk.bbclass
>the
>  repositories can now be treated like any other recipe and allow
>OE to handle
>  the cloning and unpacking.
>* This will significantly shorten the amount of time required to
>rebuild this
>  recipe.
>* Separate board-port-labs recipes into two.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> meta-arago-distro/classes/sourceipk.bbclass        |    1 -
> .../board-port-labs/board-port-labs-linux_git.bb   |   36
>++++++++++++++++++++
> .../board-port-labs/board-port-labs-u-boot_git.bb  |   36
>++++++++++++++++++++
> .../recipes-tisdk/board-port-labs/files/LICENSE    |   16
>+++++++++
> 4 files changed, 88 insertions(+), 1 deletions(-)
> create mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-linux_git.bb
> create mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-u-boot_git.bb
> create mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/files/LICENSE
>
>diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-
>arago-distro/classes/sourceipk.bbclass
>index 0f0c633..1ea0577 100644
>--- a/meta-arago-distro/classes/sourceipk.bbclass
>+++ b/meta-arago-distro/classes/sourceipk.bbclass
>@@ -61,7 +61,6 @@ SRCIPK_INCLUDE_EXTRAFILES ?=3D "1"
>
> SRCIPK_PRESERVE_GIT ?=3D "false"
>
>-# Remove git repositories before packaging up the sources
> adjust_git() {

This hunk should be part of the previous patch.

>
>     orig_dir=3D"$PWD"
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-linux_git.bb b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs-linux_git.bb
>new file mode 100644
>index 0000000..a105128
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs-linux_git.bb
>@@ -0,0 +1,36 @@
>+DESCRIPTION =3D "Git repositories containing sample board port
>code"
>+HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
>+LICENSE =3D "GPLv2"
>+
>+LIC_FILES_CHKSUM =3D
>"file://../LICENSE;md5=3Dd9fb2a547cd8e6bb75c0ecf427a139a9"

Why not point to the COPYING file in the kernel sources?

>+
>+inherit allarch
>+
>+CREATE_SRCIPK =3D "1"
>+SRCIPK_INSTALL_DIR =3D "board-support/board-port-labs/sitara-board-
>port-linux"
>+SRCIPK_PRESERVE_GIT =3D "true"
>+
>+PR =3D "r0"
>+
>+BRANCH =3D "master"
>+SRC_URI =3D "git://gitorious.org/sitara-board-port/sitara-board-
>port-linux.git;protocol=3Dgit;branch=3D${BRANCH} \
>+           file://LICENSE"
>+
>+SRCREV =3D "${AUTOREV}"
>+
>+S =3D "${WORKDIR}/git"
>+
>+adjust_git_prepend() {
>+
>+    # Checkout a specific branch instead of a commit that is used
>by default
>+    git checkout ${BRANCH}
>+}

Any reason this couldn't actually be part of the adjust_git function by def=
ault?  If a BRANCH is defined do this?

>+
>+do_configure() {
>+    :
>+}
>+
>+do_compile() {
>+    :
>+}
>+
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-u-boot_git.bb b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs-u-boot_git.bb
>new file mode 100644
>index 0000000..a66eaa4
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs-u-boot_git.bb
>@@ -0,0 +1,36 @@
>+DESCRIPTION =3D "Git repositories containing sample board port
>code"
>+HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
>+LICENSE =3D "GPLv2"

U-Boot license in the base recipes are GPLv2+ so this probably needs to mat=
ch.

>+
>+LIC_FILES_CHKSUM =3D
>"file://../LICENSE;md5=3Dd9fb2a547cd8e6bb75c0ecf427a139a9"

Why not use the file in the sources at Licenses/gpl-2.0.txt?

Tom, with all the licenses in that directory would you stay u-boot is still=
 GPLv2+?  It seems those other licenses are for the stand alone apps, but f=
or source distribution should this license be updated to include the other =
licenses?

>+
>+inherit allarch
>+
>+CREATE_SRCIPK =3D "1"
>+SRCIPK_INSTALL_DIR =3D "board-support/board-port-labs/sitara-board-
>port-u-boot"
>+SRCIPK_PRESERVE_GIT =3D "true"
>+
>+PR =3D "r0"
>+
>+BRANCH =3D "master"
>+SRC_URI =3D "git://gitorious.org/sitara-board-port/sitara-board-
>port-uboot.git;protocol=3Dgit;branch=3D${BRANCH} \
>+           file://LICENSE"
>+
>+SRCREV =3D "${AUTOREV}"
>+
>+S =3D "${WORKDIR}/git"
>+
>+adjust_git_prepend() {
>+
>+    # Checkout a specific branch instead of a commit that is used
>by default
>+    git checkout ${BRANCH}
>+}

Same comment as the kernel

>+
>+do_configure() {
>+    :
>+}
>+
>+do_compile() {
>+    :
>+}
>+
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/files/LICENSE b/meta-arago-distro/recipes-tisdk/board-port-
>labs/files/LICENSE
>new file mode 100644
>index 0000000..738cb23
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/board-port-
>labs/files/LICENSE
>@@ -0,0 +1,16 @@
>+The trees found within this directory are git trees for the Linux
>+kernel and u-boot.  These trees are based on the AM335x part and
>+are meant to serve as a reference for general tasks involved in a
>board
>+port.  These trees go along with the training available at:
>+
>+http://processors.wiki.ti.com/index.php/Sitara_Linux_Training
>+
>+Inside of each directory is a full git repository.  These
>repositories
>+have tags that make isolating the changes for each functionality
>easier.
>+You can view the tag using the "git tag" command and use "gitk --
>all"
>+to better view the git tree contents.
>+
>+The individual trees are licensed under the same license as the
>Linux
>+kernel and u-boot sources which is the GPLv2 license. A copy of
>license
>+for the kernel and u-boot can be found in a file called COPYING
>within
>+each of the respective git repositories.

U-boot doesn't have COPYING.

>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

