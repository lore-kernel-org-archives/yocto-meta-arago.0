Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C7AD2CE17
	for <webhook@archiver.kernel.org>; Sun,  7 Dec 2025 17:03:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30915.1765126999906395524
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 07 Dec 2025 09:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E87D40CAB;
	Sun,  7 Dec 2025 17:03:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfMfNqpqZs92; Sun,  7 Dec 2025 17:03:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF0A040A22;
	Sun,  7 Dec 2025 17:03:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BEC2B17599B;
	Sun,  7 Dec 2025 12:03:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 2/2] libyang: suppress multilib error
Date: Sun,  7 Dec 2025 12:03:09 -0500
Message-Id: <20251207170309.1924061-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251207170309.1924061-1-denis@denix.org>
References: <20251207170309.1924061-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 07 Dec 2025 17:03:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16869

From: Denys Dmytriyenko <denys@konsulko.com>

Version 2.x of libyang had config.h file that needs to be processed
for multilib, while newer 3.x renamed the file to ly_config.h. As
meta-oe/scarthgap expects the old config.h file for multilib, which
cannot be disabled, let's duplicate the new ly_config.h as config.h
to avoid the error.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-extended/sysrepo/libyang-arago.inc        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc=
 b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
index b76701a8..9744ea3a 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
+++ b/meta-arago-extras/recipes-extended/sysrepo/libyang-arago.inc
@@ -4,6 +4,17 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9bb3d334294e8=
719f41c531e28a9a697"
=20
 SRCREV =3D "03e294d83b610f89e8ba7b2156a80dc0ad534443"
=20
+# 2.x still uses config.h and meta-oe/scarthgap tries
+# to process it for multilib, which cannot be disabled
+# and results in an error. Just duplicate the actual
+# ly_config.h to suppress the error.
+do_install:prepend () {
+    install -d ${D}${includedir}/libyang
+    install -m 644 libyang/ly_config.h ${D}${includedir}/libyang/config.=
h
+}
+
+# 3.x now comes with ly_config.h, so process it here
+# for multilib
 do_install:append () {
     oe_multilib_header  libyang/ly_config.h
 }
--=20
2.25.1


