Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2F3EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 17:19:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.30602.1688663986547498552
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 10:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B37A540C16;
	Thu,  6 Jul 2023 17:19:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OJU89Mui6bj; Thu,  6 Jul 2023 17:19:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9898940C13;
	Thu,  6 Jul 2023 17:19:44 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DF7E2163BD7;
	Thu,  6 Jul 2023 13:19:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] nativesdk-buildtools-perl-dummy: update the exclusion list
Date: Thu,  6 Jul 2023 17:19:43 +0000
Message-Id: <20230706171943.1889601-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 17:19:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14775

From: Denys Dmytriyenko <denys@konsulko.com>

Most of the entries already got added upstream in OE-Core

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../nativesdk-buildtools-perl-dummy.bbappend  | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-per=
l-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtoo=
ls-perl-dummy.bbappend
index b83e4e35..35de49b4 100644
--- a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy=
.bbappend
+++ b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy=
.bbappend
@@ -1,23 +1,4 @@
 DUMMYPROVIDES +=3D "\
-    nativesdk-perl-module-bytes \
-    nativesdk-perl-module-carp \
-    nativesdk-perl-module-constant \
-    nativesdk-perl-module-data-dumper \
-    nativesdk-perl-module-errno \
-    nativesdk-perl-module-exporter \
-    nativesdk-perl-module-file-basename \
-    nativesdk-perl-module-file-compare \
-    nativesdk-perl-module-file-copy \
-    nativesdk-perl-module-file-find \
-    nativesdk-perl-module-file-glob \
-    nativesdk-perl-module-file-spec \
     nativesdk-perl-module-file-spec-unix \
-    nativesdk-perl-module-file-stat \
-    nativesdk-perl-module-getopt-long \
-    nativesdk-perl-module-io-file \
-    nativesdk-perl-module-overloading \
-    nativesdk-perl-module-posix \
     nativesdk-perl-module-symbol \
-    nativesdk-perl-module-thread-queue \
-    nativesdk-perl-module-threads \
 "
--=20
2.25.1


