Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 90BF652A81
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2013 15:06:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7UF6JCB016437
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:06:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7UF6JYd026929
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:06:19 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 30 Aug 2013 10:06:19 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/6 v2] board-port-labs-u-boot: Create new
	recipe using new sourceipk.bbclass feature
Thread-Index: AQHOo1pATlLyK5OwWkSrB2bA/PZk9pmt3j1g
Date: Fri, 30 Aug 2013 15:06:19 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596F81C5@DLEE11.ent.ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
	<1377633092-29917-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1377633092-29917-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/6 v2] board-port-labs-u-boot: Create new	recipe using new sourceipk.bbclass feature
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
X-List-Received-Date: Fri, 30 Aug 2013 15:06:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, August 27, 2013 2:52 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 4/6 v2] board-port-labs-u-boot:
>Create new recipe using new sourceipk.bbclass feature
>
>* Do to the inability to keep the git repository intact the board
>port labs
>  recipe manually ran git clone which took a long time every time
>the recipe was
>  built.
>* Using the new SRCIPK_PRESERVED_GIT feature in sourceipk.bbclass
>the recipes
>* can
>  now be treated like any other recipe and allow OE to handle the
>cloning and
>  unpacking.
>* This will significantly shorten the amount of time required to
>rebuild this
>  recipe.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
>Version 2 changes:
>Place recipe in its own patch.
>Use U-boot's license.
>
> .../board-port-labs/board-port-labs-u-boot_git.bb  |   35
>++++++++++++++++++++
> 1 files changed, 35 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-u-boot_git.bb
>
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-u-boot_git.bb b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs-u-boot_git.bb
>new file mode 100644
>index 0000000..46e75bd
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs-u-boot_git.bb
>@@ -0,0 +1,35 @@
>+DESCRIPTION =3D "Git repositories containing sample board port
>code"
>+HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
>+
>+LICENSE =3D "GPLv2+"
>+LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb"
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
>port-uboot.git;protocol=3Dgit;branch=3D${BRANCH}"
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
>+
>+do_configure() {
>+    :
>+}
>+
>+do_compile() {
>+    :
>+}
>+
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

