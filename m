Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C65FF8864
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 23:39:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.697.1777333154874188959
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 16:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0555540CC4;
	Mon, 27 Apr 2026 23:39:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Xtkkqdeoig4; Mon, 27 Apr 2026 23:39:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D222C40B66;
	Mon, 27 Apr 2026 23:39:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D5EEC175ED5;
	Mon, 27 Apr 2026 19:39:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 1/3] ltp-ddt: move iproute2-bridge from ltp to ltp-ddt
Date: Mon, 27 Apr 2026 19:39:09 -0400
Message-Id: <20260427233911.2171996-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Apr 2026 23:39:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17495

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

The .inc file of ltp recipe should be a verbatim copy of the upstream
recipe from OE-Core so it's easy to maintain and upgrade.

iproute2-bridge dependency was added when OE-Core started packaging
bridge into own package[1], but it should have been added to ltp-ddt
instead, fix it here.

[1] https://git.yoctoproject.org/meta-arago/commit/?id=3Da57fbdefd04305eb=
187fad262d7b19a104977e28

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 1 +
 meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc    | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb=
 b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 0168d125..c91f0052 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -33,6 +33,7 @@ RDEPENDS:${PN} +=3D "\
     serialcheck \
     memtester \
     libgpiod-tools \
+    iproute2-bridge \
 "
=20
 do_install:prepend() {
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc b/=
meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
index 560e9b4e..d63b936f 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp_20260130.inc
@@ -98,7 +98,6 @@ RDEPENDS:${PN} =3D "\
     gdb \
     gzip \
     iproute2 \
-    iproute2-bridge \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '',=
 d)} \
     ldd \
     libaio \
--=20
2.25.1


