Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB73C3DA4B
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 01:50:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1211.1721094618996719655
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 18:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5BE6F407DA;
	Tue, 16 Jul 2024 01:50:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVIdiEI5BMoB; Tue, 16 Jul 2024 01:50:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3517E40C6C;
	Tue, 16 Jul 2024 01:50:16 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1F5C6163FF4;
	Mon, 15 Jul 2024 21:50:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] ti-llvm: adopt an LLVM fix for buildpaths errors
Date: Mon, 15 Jul 2024 21:50:13 -0400
Message-Id: <20240716015013.3051611-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240716015013.3051611-1-denis@denix.org>
References: <20240716015013.3051611-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Jul 2024 01:50:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15444

From: Denys Dmytriyenko <denys@konsulko.com>

Make sure llvm-configs doesn't have absolute build paths.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta=
-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 4b990b7f..810c603b 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -62,6 +62,11 @@ EXTRA_OECONF +=3D " --enable-targets=3D"host,arm,c6000=
,msp430" \
=20
 EXTRA_OEMAKE +=3D "LIBXML2_INC=3D"${LIBXML2_INC}" LIBXML2_LIBS=3D"${LIBX=
ML2_LIBS}""
=20
+# patch out build host paths for reproducibility
+do_compile:prepend() {
+        sed -i -e "s,${WORKDIR},,g" ${LLVM_BUILD_DIR}/tools/llvm-config/=
Release/BuildVariables.inc
+}
+
 do_compile:class-native() {
   cd ${LLVM_BUILD_DIR}
=20
--=20
2.25.1


