Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F20FF8872
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 23:39:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.698.1777333155225820457
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 16:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7CB2E40B66;
	Mon, 27 Apr 2026 23:39:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRrxXaIY4Zvi; Mon, 27 Apr 2026 23:39:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F94040C2A;
	Mon, 27 Apr 2026 23:39:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1916C175FB5;
	Mon, 27 Apr 2026 19:39:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 3/3] ltp-ddt: sync up ltp with upstream
Date: Mon, 27 Apr 2026 19:39:11 -0400
Message-Id: <20260427233911.2171996-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260427233911.2171996-1-denis@denix.org>
References: <20260427233911.2171996-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Apr 2026 23:39:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17494

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Update ltp .inc file with the latest verbatim copy of ltp recipe from
OE-Core.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 .../recipes-devtools/ltp-ddt/ltp_20260130.inc         | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/=
meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
index d63b936f..3108cc6c 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -79,6 +79,15 @@ do_install(){
     # The controllers memcg_stree test seems to cause us hangs and takes=
 900s
     # (maybe we expect more regular output?), anyhow, skip it
     sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
+
+    # min_free_kbytes can be disruptive on constrained targets
+    sed -e '/^min_free_kbytes/d' -i ${D}${prefix}/runtest/mm
+
+    # cve-2018-13405 triggers memory deadlock kernel panic on constraine=
d targets
+    sed -e '/^cve-2018-13405/d' -i ${D}${prefix}/runtest/cve
+
+    # cve-2020-36557 triggers memory deadlock kernel panic on constraine=
d targets
+    sed -e '/^cve-2020-36557/d' -i ${D}${prefix}/runtest/cve
 }
=20
 RDEPENDS:${PN} =3D "\
@@ -128,7 +137,7 @@ remove_broken_musl_sources() {
 	[ "${TCLIBC}" =3D "musl" ] || return 0
=20
 	cd ${S}
-	echo "WARNING: remove unsupported tests (until they're fixed)"
+	bbverbnote "remove unsupported tests (until they're fixed)"
=20
 	# sync with upstream
 	# https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L3=
3
--=20
2.25.1


