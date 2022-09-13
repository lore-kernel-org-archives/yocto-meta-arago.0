Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C6DC6FD27
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.896.1663041770196501603
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BFB5A40D8A
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9pA-DgDlmO2 for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B571640D8C
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 58DB81749D9
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 30/52] cifs-utils: add patch for upstream
 build bug
Date: Tue, 13 Sep 2022 04:02:24 +0000
Message-Id: <20220913040246.2365077-31-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14014

From: Daniel Parks <danielrparks@ti.com>

cifs-utils upstream has a bug that causes our build to fail when
PARALLEL_MAKE is set to "-j1". This adds an overlay with the patch for
the bug, which I have also submitted upstream.

Signed-off-by: Daniel Parks <danielrparks@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...automake-treat-sbin-as-exec-not-data.patch | 35 +++++++++++++++++++
 .../cifs/cifs-utils_6.14.bbappend             |  4 +++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils/000=
1-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
 create mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils_6.1=
4.bbappend

diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-=
utils-Make-automake-treat-sbin-as-exec-not-data.patch b/meta-arago-distro=
/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin=
-as-exec-not-data.patch
new file mode 100644
index 00000000..dd9c7958
--- /dev/null
+++ b/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-M=
ake-automake-treat-sbin-as-exec-not-data.patch
@@ -0,0 +1,35 @@
+From fd5f395514256572c451127006a68483106cf2b8 Mon Sep 17 00:00:00 2001
+From: Daniel Parks <danielrparks@ti.com>
+Date: Fri, 3 Jun 2022 15:34:59 -0500
+Subject: [PATCH] cifs-utils: Make automake treat /sbin as exec, not data
+
+Otherwise, $(DESTDIR)/sbin doesn't get created until install-data on a
+-j1 build and install-exec-hook can fail because it might not exist.
+
+Steps to reproduce this bug:
+$ autoreconf -i
+$ ./configure
+$ mkdir image
+$ make DESTDIR=3Dimage install -j1
+
+Upstream-Status: Pending
+Signed-off-by: Daniel Parks <danielrparks@ti.com>
+---
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e9be6b3..edb1b7f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,8 +1,8 @@
+ AM_CFLAGS =3D -Wall -Wextra -D_FORTIFY_SOURCE=3D2 $(PIE_CFLAGS) $(RELRO=
_CFLAGS)
+ ACLOCAL_AMFLAGS =3D -I aclocal
+=20
+-root_sbindir =3D $(ROOTSBINDIR)
+-root_sbin_PROGRAMS =3D mount.cifs
++root_exec_sbindir =3D $(ROOTSBINDIR)
++root_exec_sbin_PROGRAMS =3D mount.cifs
+ mount_cifs_SOURCES =3D mount.cifs.c mtab.c resolve_host.c util.c
+ mount_cifs_LDADD =3D $(LIBCAP) $(CAPNG_LDADD) $(RT_LDADD)
+ include_HEADERS =3D cifsidmap.h
diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils_6.14.bbapp=
end b/meta-arago-distro/recipes-support/cifs/cifs-utils_6.14.bbappend
new file mode 100644
index 00000000..c145cf63
--- /dev/null
+++ b/meta-arago-distro/recipes-support/cifs/cifs-utils_6.14.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRC_URI +=3D "file://0001-cifs-utils-Make-automake-treat-sbin-as-exec-no=
t-data.patch"
+
--=20
2.25.1


