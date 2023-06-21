Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98728EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 11:19:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.8419.1687346335731194353
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 04:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=hbwOCr+i;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35LBIqpg064683;
	Wed, 21 Jun 2023 06:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687346332;
	bh=WBzLCnPsYd1uYmzWwGmXjkcWjUBe2cM11b9g2VC+37c=;
	h=From:To:CC:Subject:Date;
	b=hbwOCr+iCoi9AeNtNqvSmNqdM6Irx8iA527Y0MByxd5AyhFnnXg2wHJ5UNbYXvCqz
	 NJ9wUMDlhbQvh3b7gMiE1ueOXXVc8WqWxCUntl6QssMB7bR7o1jPEIrXY8ZPA1jjUb
	 mZAoOzqhEZaSP3Ad3YBstLGYudKBwIoYDupKFyow=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35LBIq9Y025382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 06:18:52 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 06:18:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 06:18:52 -0500
Received: from SHIELD01.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35LBInck034172;
	Wed, 21 Jun 2023 06:18:50 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] recipes-core: systemd: Fix Date and Time Service
Date: Wed, 21 Jun 2023 16:48:28 +0530
Message-ID: <20230621111828.448565-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 35LBIqpg064683
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jun 2023 11:19:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14670

- Currently oe-core's systemd-timesyncd defaults to Google's time servers=
. However those servers are not always reachable.
Even if they are, it is much more sensible to use pool servers from ntp.o=
rg and ubuntu. Hence, add a new timesyncd.conf file
for the same.

- For the above issue, oe-core maintainers suggested to use bbappends in =
own layers to point to the time servers suitable
for your projects [1]. Hence, use systemd_%.bbappend to install the newly=
 created timesyncd.conf file in filesystem.


Reference
---------
[1] https://www.openembedded.org/pipermail/openembedded-core/2019-Novembe=
r/289792.html

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-core/systemd/systemd/timesyncd.conf | 17 +++++++++++++++++
 .../recipes-core/systemd/systemd_%.bbappend     |  6 +++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/timesy=
ncd.conf

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/timesyncd.con=
f b/meta-arago-distro/recipes-core/systemd/systemd/timesyncd.conf
new file mode 100644
index 00000000..a9f762b7
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/timesyncd.conf
@@ -0,0 +1,17 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it un=
der the
+#  terms of the GNU Lesser General Public License as published by the Fr=
ee
+#  Software Foundation; either version 2.1 of the License, or (at your o=
ption)
+#  any later version.
+#
+# Entries in this file show the compile time defaults. Local configurati=
on
+# should be created by either modifying this file, or by creating "drop-=
ins" in
+# the timesyncd.conf.d/ subdirectory. The latter is generally recommende=
d.
+# Defaults can be restored by simply deleting this file and all drop-ins.
+#
+# See timesyncd.conf(5) for details.
+=E2=80=8B
+[Time]
+NTP=3D0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org
+FallbackNTP=3Dntp.ubuntu.com
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/=
meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 3de94336..a4437449 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,4 +1,4 @@
-PR:append =3D ".arago6"
+PR:append =3D ".arago7"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
@@ -11,6 +11,7 @@ SRC_URI:append =3D " \
     file://30-wlan.network \
     file://60-usb.network \
     file://sync-clocks.service \
+    file://timesyncd.conf \
 "
=20
 do_install:append() {
@@ -38,4 +39,7 @@ do_install:append() {
     # Need NAMESPACES enabled in the kernel, workaround for now
     install -m 0644 ${D}${systemd_system_unitdir}/systemd-hostnamed.serv=
ice ${D}${sysconfdir}/systemd/system/
     sed -i 's/PrivateNetwork=3Dyes/PrivateNetwork=3Dno/g' ${D}${sysconfd=
ir}/systemd/system/systemd-hostnamed.service
+   =20
+    install -d ${D}${sysconfdir}/systemd/
+    install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
 }
--=20
2.34.1


