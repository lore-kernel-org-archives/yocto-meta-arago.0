Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5368452A76
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 20:15:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKFVAS006548
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:15:31 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKFVrW020824
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:15:31 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:15:28 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/7] board-port-labs: Remove board port
	labs	recipe
Thread-Index: AQHO5VFVZuJc7XhtH0aTrkDgvYDdp5os/YUA
Date: Tue, 19 Nov 2013 20:15:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839CF3@DLEE11.ent.ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
	<1384887728-8628-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1384887728-8628-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] board-port-labs: Remove board port labs	recipe
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
X-List-Received-Date: Tue, 19 Nov 2013 20:15:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 1:02 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 2/7] board-port-labs: Remove board
>port labs recipe
>
>* Since the board port labs will no longer be bundled within the
>SDK there is no
>  need to keep these recipes around.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../board-port-labs/board-port-labs-linux_git.bb   |   35 -------
>-------------
> .../board-port-labs/board-port-labs-u-boot_git.bb  |   35 -------
>-------------
> 2 files changed, 0 insertions(+), 70 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-linux_git.bb
> delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-u-boot_git.bb
>
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-linux_git.bb b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs-linux_git.bb
>deleted file mode 100644
>index 4ed1adf..0000000
>--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs-linux_git.bb
>+++ /dev/null
>@@ -1,35 +0,0 @@
>-DESCRIPTION =3D "Git repositories containing sample board port
>code"
>-HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
>-
>-LICENSE =3D "GPLv2"
>-LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>-
>-inherit allarch
>-
>-CREATE_SRCIPK =3D "1"
>-SRCIPK_INSTALL_DIR =3D "board-support/board-port-labs/sitara-board-
>port-linux"
>-SRCIPK_PRESERVE_GIT =3D "true"
>-
>-PR =3D "r0"
>-
>-BRANCH =3D "master"
>-SRC_URI =3D "git://gitorious.org/sitara-board-port/sitara-board-
>port-linux.git;protocol=3Dgit;branch=3D${BRANCH}"
>-
>-SRCREV =3D "30df33e7134ab507a339b89a864256cabfbddea1"
>-
>-S =3D "${WORKDIR}/git"
>-
>-adjust_git_prepend() {
>-
>-    # Checkout a specific branch instead of a commit that is used
>by default
>-    git checkout ${BRANCH}
>-}
>-
>-do_configure() {
>-    :
>-}
>-
>-do_compile() {
>-    :
>-}
>-
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-u-boot_git.bb b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs-u-boot_git.bb
>deleted file mode 100644
>index 5e68d30..0000000
>--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs-u-boot_git.bb
>+++ /dev/null
>@@ -1,35 +0,0 @@
>-DESCRIPTION =3D "Git repositories containing sample board port
>code"
>-HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
>-
>-LICENSE =3D "GPLv2+"
>-LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb"
>-
>-inherit allarch
>-
>-CREATE_SRCIPK =3D "1"
>-SRCIPK_INSTALL_DIR =3D "board-support/board-port-labs/sitara-board-
>port-u-boot"
>-SRCIPK_PRESERVE_GIT =3D "true"
>-
>-PR =3D "r0"
>-
>-BRANCH =3D "master"
>-SRC_URI =3D "git://gitorious.org/sitara-board-port/sitara-board-
>port-uboot.git;protocol=3Dgit;branch=3D${BRANCH}"
>-
>-SRCREV =3D "43a81af5ccddc67f9ed5f11664e5478f59574102"
>-
>-S =3D "${WORKDIR}/git"
>-
>-adjust_git_prepend() {
>-
>-    # Checkout a specific branch instead of a commit that is used
>by default
>-    git checkout ${BRANCH}
>-}
>-
>-do_configure() {
>-    :
>-}
>-
>-do_compile() {
>-    :
>-}
>-
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

