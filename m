Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F7EC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 18:22:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1260.1736878941661971795
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 10:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90D1240C86;
	Tue, 14 Jan 2025 18:22:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdQJJ1HIOYX9; Tue, 14 Jan 2025 18:22:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 76B3440A28;
	Tue, 14 Jan 2025 18:22:19 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9C987164152;
	Tue, 14 Jan 2025 13:22:18 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] gstreamer1.0-plugins-vpe: set branch explicitly
Date: Tue, 14 Jan 2025 13:22:18 -0500
Message-Id: <20250114182218.2138921-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 14 Jan 2025 18:22:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15692

From: Denys Dmytriyenko <denys@konsulko.com>

Set git branch explicitly to fix the corresponding QA warning.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreame=
r1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugin=
s-ti/gstreamer1.0-plugins-vpe_git.bb
index 2038e2b1..6d1f720d 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-pl=
ugins-vpe_git.bb
@@ -12,7 +12,7 @@ REQUIRED_MACHINE_FEATURES =3D "mmip"
 PR =3D "${INC_PR}.20"
 SRCREV =3D "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
=20
-SRC_URI =3D "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=3Dht=
tps \
+SRC_URI =3D "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=3Dht=
tps;branch=3Dmaster \
            file://0001-gstvpe-configure.ac-stop-using-export-symbols-reg=
ex.patch \
            file://0001-Switch-submodule-common-to-github.patch \
 "
--=20
2.25.1


