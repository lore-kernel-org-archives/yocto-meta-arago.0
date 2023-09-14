Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EB3EEAA77
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 20:59:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6083.1694725187431047361
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 13:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2D7F540C46;
	Thu, 14 Sep 2023 20:59:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDqpScB7HtRF; Thu, 14 Sep 2023 20:59:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 123F740C06;
	Thu, 14 Sep 2023 20:59:44 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 30119163CAA;
	Thu, 14 Sep 2023 16:59:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/2] omapdrmtest: explicitly specify branch in SRC_URI
Date: Thu, 14 Sep 2023 20:59:42 +0000
Message-Id: <20230914205942.2817800-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230914205942.2817800-1-denis@denix.org>
References: <20230914205942.2817800-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Sep 2023 20:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14901

From: Denys Dmytriyenko <denys@konsulko.com>

Fixes:

| WARNING: omapdrmtest_1.0.0.bb: URL: git://git.ti.com/git/glsdk/omapdrmt=
est.git;protocol=3Dhttps does not set any branch parameter. The future de=
fault branch used by tools and repositories is uncertain and we will ther=
efore soon require this is set in all git urls.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0=
.0.bb b/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 20b9bf0d..fb6e7a6a 100644
--- a/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-test/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -15,7 +15,7 @@ SRCREV =3D "1fceb3ac4b0e7ed014000a10dfe6ca8729f9cd8d"
 EXTRA_OEMAKE =3D "CC=3D"${CC}""
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
-SRC_URI =3D "git://git.ti.com/git/glsdk/omapdrmtest.git;protocol=3Dhttps=
 \
+SRC_URI =3D "git://git.ti.com/git/glsdk/omapdrmtest.git;protocol=3Dhttps=
;branch=3Dmaster \
         file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.=
patch \
 "
=20
--=20
2.25.1


