Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADE8C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 19:17:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15817.1722971866856232801
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Aug 2024 12:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E311E40C50;
	Tue,  6 Aug 2024 19:17:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mM6XRPtdOgJ0; Tue,  6 Aug 2024 19:17:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C98F2408CD;
	Tue,  6 Aug 2024 19:17:44 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D9AC9164052;
	Tue,  6 Aug 2024 15:17:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] gcc-cross-canadian: remove disabling of buildpaths check
Date: Tue,  6 Aug 2024 15:17:43 -0400
Message-Id: <20240806191743.4039774-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Aug 2024 19:17:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15500

From: Denys Dmytriyenko <denys@konsulko.com>

This has been fixed lately in OE-Core master branch and the local
suppression of the QA check is no longer needed, remove it.

This reverts commit 092178fe74b36c79da16e93cc6cbbc503a915501.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-devtools/gcc/gcc-cross-canadian_%.bbappend        | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/gcc/gcc-cross-cana=
dian_%.bbappend

diff --git a/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.=
bbappend b/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bb=
append
deleted file mode 100644
index 16df0c26..00000000
--- a/meta-arago-extras/recipes-devtools/gcc/gcc-cross-canadian_%.bbappen=
d
+++ /dev/null
@@ -1,4 +0,0 @@
-# Disable the "buildpaths" check while upstream oe-core figures out
-# how they are going to address it.  This will hopefully be a short
-# lived patch.
-INSANE_SKIP:${PN} +=3D "buildpaths"
--=20
2.25.1


