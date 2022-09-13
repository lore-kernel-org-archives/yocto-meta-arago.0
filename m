Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD24C6FA90
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.898.1663041770757102381
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4EF0C40D79
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e98uwgjX_iIi for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 456CA40D94
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C6C8D1749DD
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 42/52] oe-core: Fix rm_work issue with some
 packages from oe-core.
Date: Tue, 13 Sep 2022 04:02:36 +0000
Message-Id: <20220913040246.2365077-43-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14020

From: Ryan Eatmon <reatmon@ti.com>

There appears to be an issue with a few packages from oe-core
and the rm_work feature when combined with the srcipk feature
of arago.  These recipes patch files and after the rm_work the
bitbake flow does not re-fetch the source again, so the patch
fails the second time around.  Easy fix is to just exclude
rm_worke on these packages.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-devtools/opkg-utils/opkg-utils_%.bbappend          | 3 +++
 meta-arago-distro/recipes-devtools/swig/swig_%.bbappend        | 3 +++
 meta-arago-distro/recipes-extended/bc/bc_%.bbappend            | 3 +++
 3 files changed, 9 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/opkg-utils/opkg-ut=
ils_%.bbappend
 create mode 100644 meta-arago-distro/recipes-devtools/swig/swig_%.bbappe=
nd
 create mode 100644 meta-arago-distro/recipes-extended/bc/bc_%.bbappend

diff --git a/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.b=
bappend b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbap=
pend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/opkg-utils/opkg-utils_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE +=3D "${PN}"
+
diff --git a/meta-arago-distro/recipes-devtools/swig/swig_%.bbappend b/me=
ta-arago-distro/recipes-devtools/swig/swig_%.bbappend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/swig/swig_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE +=3D "${PN}"
+
diff --git a/meta-arago-distro/recipes-extended/bc/bc_%.bbappend b/meta-a=
rago-distro/recipes-extended/bc/bc_%.bbappend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/bc/bc_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE +=3D "${PN}"
+
--=20
2.25.1


