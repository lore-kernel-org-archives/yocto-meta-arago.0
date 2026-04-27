Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DB6FF8867
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 23:39:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.722.1777333155093101605
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 16:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7F88A40CD6;
	Mon, 27 Apr 2026 23:39:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XqcuuGIYX6q; Mon, 27 Apr 2026 23:39:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5DCB440BD4;
	Mon, 27 Apr 2026 23:39:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 0C79C175FAD;
	Mon, 27 Apr 2026 19:39:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 2/3] ltp-ddt: correct re-enabling of memcg_stress test
Date: Mon, 27 Apr 2026 19:39:10 -0400
Message-Id: <20260427233911.2171996-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260427233911.2171996-1-denis@denix.org>
References: <20260427233911.2171996-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Apr 2026 23:39:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17496

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Upstream ltp disables memcg_stress test, while we want it to be
enabled, as the comment says. Hence this should be done at the
end of do_install, not at the beginning, when even "make install"
hasn't happened yet.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb=
 b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index c91f0052..13646a7c 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -36,7 +36,7 @@ RDEPENDS:${PN} +=3D "\
     iproute2-bridge \
 "
=20
-do_install:prepend() {
+do_install:append() {
 	# Upstream ltp recipe wants to remove this test case in do_install
 	install -d ${D}${prefix}/runtest/
 	echo "memcg_stress" >> ${D}${prefix}/runtest/controllers
--=20
2.25.1


