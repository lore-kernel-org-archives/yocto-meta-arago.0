Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F838C369A6
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:47:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.78916.1744127263911359899
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 08:47:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EAB2840C86;
	Tue,  8 Apr 2025 15:47:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xk_6l6HiZg0Q; Tue,  8 Apr 2025 15:47:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CCCD040C06;
	Tue,  8 Apr 2025 15:47:41 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E9BDE165934;
	Tue,  8 Apr 2025 11:47:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH 1/3] nativesdk-buildtools-perl-dummy: add missing perl packages
Date: Tue,  8 Apr 2025 11:47:37 -0400
Message-Id: <20250408154739.2716116-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 08 Apr 2025 15:47:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16160

From: Denys Dmytriyenko <denys@konsulko.com>

There are few more perl packages that get pulled into the SDK when
dummy nativesdk facility is used - add them here before they are
added upstream.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-per=
l-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtoo=
ls-perl-dummy.bbappend
index 35de49b4..b9d40d6e 100644
--- a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy=
.bbappend
+++ b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy=
.bbappend
@@ -1,4 +1,7 @@
 DUMMYPROVIDES +=3D "\
+    nativesdk-perl-dev \
+    nativesdk-perl-module-feature \
     nativesdk-perl-module-file-spec-unix \
+    nativesdk-perl-module-integer \
     nativesdk-perl-module-symbol \
 "
--=20
2.25.1


