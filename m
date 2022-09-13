Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0199BC6FD37
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.889.1663041767718244754
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 20B0F40D74
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hrCxZMwJrjz for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EAC640D4E
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:46 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 47E541749C8
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 01/52] devmem2: remove upstreamed fix
Date: Tue, 13 Sep 2022 04:01:55 +0000
Message-Id: <20220913040246.2365077-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13987

From: Denys Dmytriyenko <denys@konsulko.com>

As devmem2 was updated revamped in kirkstone upstream, drop local fix.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-support/devmem2/devmem2.bbappend  |  5 ---
 ...ort-different-page-sizes-at-run-time.patch | 35 -------------------
 2 files changed, 40 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/devmem2/devmem2.bba=
ppend
 delete mode 100644 meta-arago-extras/recipes-support/devmem2/devmem2/000=
1-devmem2-support-different-page-sizes-at-run-time.patch

diff --git a/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend b=
/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
deleted file mode 100644
index f282b247..00000000
--- a/meta-arago-extras/recipes-support/devmem2/devmem2.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-SRC_URI +=3D " \
-file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
-"
diff --git a/meta-arago-extras/recipes-support/devmem2/devmem2/0001-devme=
m2-support-different-page-sizes-at-run-time.patch b/meta-arago-extras/rec=
ipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at=
-run-time.patch
deleted file mode 100644
index 0da0732c..00000000
--- a/meta-arago-extras/recipes-support/devmem2/devmem2/0001-devmem2-supp=
ort-different-page-sizes-at-run-time.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0f6af48b2fbc71ec8abe862d3e9eb6da7b03538b Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Wed, 8 Aug 2018 14:38:00 -0400
-Subject: [PATCH] devmem2: support different page sizes at run-time
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- devmem2.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/devmem2.c b/devmem2.c
-index 68131b2..76af2d6 100644
---- a/devmem2.c
-+++ b/devmem2.c
-@@ -53,8 +53,6 @@
- #define FATAL do { fprintf(stderr, "Error at line %d, file %s (%d) [%s]=
\n", \
-   __LINE__, __FILE__, errno, strerror(errno)); exit(1); } while(0)
- =20
--#define MAP_SIZE 4096UL
--#define MAP_MASK (MAP_SIZE - 1)
-=20
- static inline void *fixup_addr(void *addr, size_t size);
-=20
-@@ -66,6 +64,8 @@ int main(int argc, char **argv) {
- 	int access_type =3D 'w';
- 	char fmt_str[128];
- 	size_t data_size;
-+	unsigned long MAP_SIZE =3D sysconf(_SC_PAGE_SIZE);
-+	unsigned long MAP_MASK =3D (MAP_SIZE - 1);
- =09
- 	if(argc < 2) {
- 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
---=20
-2.7.4
-
--=20
2.25.1


