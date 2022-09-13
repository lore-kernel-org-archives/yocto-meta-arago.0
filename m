Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D794C6FA8B
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.888.1663041770997633754
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 91DA440D99
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtwuqiBK4EZV for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 80F5140D7D
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E75171749D7
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 45/52] meta-arago-extras: recipes-devtools:
 eventdump: Fix linking against local library
Date: Tue, 13 Sep 2022 04:02:39 +0000
Message-Id: <20220913040246.2365077-46-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14025

From: Nishanth Menon <nm@ti.com>

https://github.com/TI-ECS/eventdump unfortunately is a unmaintained
project.

LDFLAGS +=3D -L$(NFSROOT)/lib should have dependent on NFSROOT variable.
Instead this forces the eventdump to break the sandbox and attempt to
link up against the local PC's lib - which is a NO-NO for many reasons.

Reported to have failed on a Fedora system.

Bump the PR up to indicate a fix up where we have proper linkage

Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../eventdump/eventdump_git.bb                |  7 ++--
 ...Play_nicer_with_bitbake-OpenEmbedded.patch | 34 +++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/eventdump/files/00=
01-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch

diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.b=
b b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index d52d5eaf..6fc9f5df 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -2,12 +2,15 @@ SUMMARY =3D "Utility for parsing system events"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://eventdump.c;beginline=3D1;endline=3D34;md5=3D=
23b59be24a88ddc407b553035f3fd3e9"
=20
-PR =3D "r3"
+PR =3D "r4"
 PV =3D "1.0+git${SRCPV}"
=20
 SRCREV =3D "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
=20
-SRC_URI =3D "git://github.com/TI-ECS/eventdump.git;protocol=3Dhttps;bran=
ch=3Dmaster"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+SRC_URI =3D "git://github.com/TI-ECS/eventdump.git;protocol=3Dhttps;bran=
ch=3Dmaster \
+	file://0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATC=
H_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch b/meta-arago-extras=
/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bit=
bake-OpenEmbedded.patch
new file mode 100644
index 00000000..b14d5bb3
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makef=
ile_Play_nicer_with_bitbake-OpenEmbedded.patch
@@ -0,0 +1,34 @@
+From e8c5094e2d59fe48ad0e7234f196d04508f53727 Mon Sep 17 00:00:00 2001
+From: Daniel Thompson <daniel.thompson@linaro.org>
+Date: Wed, 20 Jul 2022 18:05:09 +0100
+Subject: [PATCH] Makefile: Play nicer with bitbake/OpenEmbedded
+
+Unconditionally adding -L$(NFSROOT)/lib to the link line risks seriously
+confusing the linker if NFSROOT is not set (which would be common when
+building OE/bitbake) because we end up trying to link against whatever
+zany things we might find in the host /lib directory). Fix this the
+obvious way.
+
+Upstream-Status: Pending
+Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index e313e50..afb5472 100755
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,9 @@
+ CC =3D $(CROSS_COMPILE)gcc
+ CFLAGS =3D -O2 -Wall
+
++ifneq ($(NFSROOT),)
+ LDFLAGS +=3D -L$(NFSROOT)/lib
++endif
+ #LIBS +=3D -lopenobex -lbluetooth -lmisc
+
+ OBJS =3D eventdump.o
+--
+2.36.1
+
--=20
2.25.1


