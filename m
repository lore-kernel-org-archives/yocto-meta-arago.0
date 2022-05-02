Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B366C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 21:36:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3302.1651527371510101050
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 May 2022 14:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iyvLfbm5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: detheridge@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 242La90p082249;
	Mon, 2 May 2022 16:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651527369;
	bh=ewskTbTcLM9MQI0l8LDl6H/Ge8G7CPWzVD47d+x4u54=;
	h=From:To:Subject:Date;
	b=iyvLfbm5pNOKwYuQspou1GlgTj0+8gilrXHwcSOl74dS/Fh3aQeqed3bgrfh/W85X
	 R+NijdWG5fKkrz63I6SFlfYK2kk/eb8MelbgK5txd1SOtsUMaCM/C3ueFNrfM7DaqK
	 lN7Soz+p+WpAlCvrdep2N1hUdc49+o5l6nSrBRcY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 242La9PE075933
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 May 2022 16:36:09 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 16:36:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 16:36:08 -0500
Received: from uda0867391.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 242La8gj048921;
	Mon, 2 May 2022 16:36:08 -0500
From: Darren Etheridge <detheridge@ti.com>
To: <nm@ti.com>, <denys@konsulko.com>, <reatmon@ti.com>, <k-bhargav@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] weston-init: fix killproc for thinlinux
 so that it doesn't kill itself
Date: Mon, 2 May 2022 16:35:24 -0500
Message-ID: <20220502213524.23063-1-detheridge@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 May 2022 21:36:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13831

busybox pidof doesn't omit the current pid
as this script is called weston on the target
in thinlinux with a busybox based utility load
later killproc operations end up killing this
script, which leads to the script not actually
starting weston.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 .../recipes-graphics/wayland/weston-init/init   | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index 461b0787..1f55ab76 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -9,8 +9,21 @@
 ### END INIT INFO
 
 killproc() {
-        pid=`/bin/pidof $1`
-        [ "$pid" != "" ] && kill $pid
+	all_pids=`/bin/pidof $1`
+
+	# busybox pidof doesn't ommit the current pid
+	# as this script is called weston on the target
+	# in thinlinux with a busybox based utility load
+	# later killproc operations end up killing this
+	# script.
+	for pid in $all_pids
+	do
+		if [ "$pid" != "$$" ]; then
+			kill_pids+=$pid
+		fi
+	done
+
+	[ "$kill_pids" != "" ] && kill $kill_pids
 }
 
 read CMDLINE < /proc/cmdline
-- 
2.17.1


