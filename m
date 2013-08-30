Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 35E7252A81
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2013 15:05:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7UF5vLC016277
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:05:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7UF5vcS026158
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:05:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 30 Aug 2013 10:05:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/6 v2] board-port-labs-linux: Create new
	recipe using new sourceipk.bbclass feature
Thread-Index: AQHOo1pAsslqceXk+kSQ21R6G/FwnZmt3iEg
Date: Fri, 30 Aug 2013 15:05:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596F8186@DLEE11.ent.ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
	<1377633092-29917-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1377633092-29917-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/6 v2] board-port-labs-linux: Create new	recipe using new sourceipk.bbclass feature
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
X-List-Received-Date: Fri, 30 Aug 2013 15:05:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, August 27, 2013 2:51 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 3/6 v2] board-port-labs-linux: Create
>new recipe using new sourceipk.bbclass feature
>
>* Do to the inability to keep the git repository intact the board
>port labs
>  recipe manually ran git clone which took a long time every time
>the recipe was
>  built.
>* Using the new SRCIPK_PRESERVED_GIT feature in sourceipk.bbclass
>the recipes can
>  now be treated like any other recipe and allow OE to handle the
>cloning and
>  unpacking.
>* This will significantly shorten the amount of time required to
>rebuild this
>  recipe.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
>Changes Version 2:
>Split recipe into its own patch.
>Also use the kernel's license.
>
> .../board-port-labs/board-port-labs-linux_git.bb   |   35
>++++++++++++++++++++
> 1 files changed, 35 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-linux_git.bb
>
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs-linux_git.bb b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs-linux_git.bb
>new file mode 100644
>index 0000000..711e3a8
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs-linux_git.bb
>@@ -0,0 +1,35 @@
>+DESCRIPTION =3D "Git repositories containing sample board port
>code"
>+HOMEPAGE =3D "https://gitorious.org/sitara-board-port"
>+
>+LICENSE =3D "GPLv2"
>+LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
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
>port-linux.git;protocol=3Dgit;branch=3D${BRANCH}"
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

