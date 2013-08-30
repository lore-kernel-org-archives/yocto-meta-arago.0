Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0773852A81
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2013 15:06:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7UF6pHT014552
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:06:51 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7UF6p4q027534
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:06:51 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 30 Aug 2013 10:06:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 6/6] board-port-labs: Remove old
	board-port-labs recipe
Thread-Index: AQHOo1pAs1cFUSJOvE2eWzGm75iqgJmt3mPQ
Date: Fri, 30 Aug 2013 15:06:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596F8209@DLEE11.ent.ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
	<1377633092-29917-6-git-send-email-fcooper@ti.com>
In-Reply-To: <1377633092-29917-6-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] board-port-labs: Remove old	board-port-labs recipe
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
X-List-Received-Date: Fri, 30 Aug 2013 15:06:52 -0000
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
>Subject: [meta-arago] [PATCH 6/6] board-port-labs: Remove old
>board-port-labs recipe
>
>* This recipe has been replaced by the new board-port-labs recipe
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../board-port-labs/board-port-labs/LICENSE        |   16 -------
>---
> .../board-port-labs/board-port-labs_git.bb         |   32 -------
>-------------
> 2 files changed, 0 insertions(+), 48 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs/LICENSE
> delete mode 100644 meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs_git.bb
>
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

