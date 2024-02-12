Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67D0C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:57:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13365.1707760634361716905
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 09:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jWRrNGkD;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CHvCoB045618;
	Mon, 12 Feb 2024 11:57:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707760632;
	bh=Hj/c74aOV16fZYA/4WuibithBi1xkqs3003gBp717mk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jWRrNGkDPjSHunjo8ky+uAy9xByuC4ji37Sbh+LiabLPjVqIfQl98oZlqxGSlm+Z0
	 /vzGd4GzpGbpATY3Y/34B6Ec6rb2Q6kaEjCtQ/p3+YAJJgvk63pvcOJFcqJjlPFkeZ
	 ZPHWu68okAA+BQ0fC+fJNJTCw2ZGNPdT5MYDclZI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CHvCf8023823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 11:57:12 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 11:57:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 11:57:12 -0600
Received: from uda0500640.dal.design.ti.com (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CHv7cY116944;
	Mon, 12 Feb 2024 11:57:10 -0600
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <r-gunasekaran@ti.com>, <srk@ti.com>, <c-shilwant@ti.com>
Subject: [master/kirkstone][PATCH v3 1/2] meta-arago-extras: sysrepo: Adopt Yocto variable names
Date: Mon, 12 Feb 2024 23:27:05 +0530
Message-ID: <20240212175706.27950-2-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240212175706.27950-1-r-gunasekaran@ti.com>
References: <20240212175706.27950-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 17:57:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15169

Use Yocto variable names instead of path value

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

* Newly introduced in the series

 .../libnetconf2/libnetconf2_git.bb             |  2 +-
 .../recipes-sysrepo/libyang/libyang_git.bb     |  2 +-
 .../netopeer2-server/netopeer2-server_git.bb   | 16 ++++++++--------
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb     | 18 +++++++++---------
 .../tsn-yang-models/tsn-yang-models_git.bb     | 16 ++++++++--------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
index a534b9ac..aaf134ea 100644
--- a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "libssh openssl libyang libxcrypt libpam"
 
-FILES:${PN} += "/usr/share/yang/modules/libnetconf2/*"
+FILES:${PN} += "${datadir}/yang/modules/libnetconf2/*"
 
 inherit cmake pkgconfig
 
diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
index c984a252..cd5a2afd 100644
--- a/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "libpcre2"
 
-FILES:${PN} += "/usr/share/yang/modules/libyang/*"
+FILES:${PN} += "${datadir}/yang/modules/libyang/*"
 
 inherit cmake pkgconfig
 
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
index e4278d23..96853ecf 100644
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/git"
 DEPENDS = "libyang libnetconf2 sysrepo curl"
 RDEPENDS:${PN} += "bash curl"
 
-FILES:${PN} += "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sysrepo-plugind/*"
+FILES:${PN} += "${datadir}/yang* ${datadir}/netopeer2/* ${libdir}/sysrepo-plugind/*"
 
 inherit cmake pkgconfig
 
@@ -21,11 +21,11 @@ inherit cmake pkgconfig
 EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE:String=Release -DINSTALL_MODULES=OFF -DGENERATE_HOSTKEY=OFF -DMERGE_LISTEN_CONFIG=OFF"
 
 do_install:append () {
-    install -d ${D}/etc/netopeer2/scripts
-    install -o root -g root ${S}/scripts/setup.sh ${D}/etc/netopeer2/scripts/setup.sh
-    install -o root -g root ${S}/scripts/merge_hostkey.sh ${D}/etc/netopeer2/scripts/merge_hostkey.sh
-    install -o root -g root ${S}/scripts/merge_config.sh ${D}/etc/netopeer2/scripts/merge_config.sh
-    install -d ${D}/etc/netopeer2
-    install -d ${D}/etc/init.d
-    install -m 0755 ${WORKDIR}/netopeer2-server ${D}/etc/init.d/
+    install -d ${D}${sysconfdir}/netopeer2/scripts
+    install -o root -g root ${S}/scripts/setup.sh ${D}${sysconfdir}/netopeer2/scripts/setup.sh
+    install -o root -g root ${S}/scripts/merge_hostkey.sh ${D}${sysconfdir}/netopeer2/scripts/merge_hostkey.sh
+    install -o root -g root ${S}/scripts/merge_config.sh ${D}${sysconfdir}/netopeer2/scripts/merge_config.sh
+    install -d ${D}${sysconfdir}/netopeer2
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/netopeer2-server ${D}${sysconfdir}/init.d/
 }
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
index 18da3ca3..3a77e170 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "libyang protobuf protobuf-c protobuf-c-native libredblack libev libnetconf2"
 
-FILES:${PN} += "/usr/share/yang/* /usr/lib/sysrepo-plugind/*"
+FILES:${PN} += "${datadir}/yang/* ${libdir}/sysrepo-plugind/*"
 
 inherit cmake pkgconfig python3native python3-dir
 
@@ -23,12 +23,12 @@ EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Rel
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append () {
-    install -d ${D}/etc/sysrepo/data/notifications
-    install -d ${D}/etc/sysrepo/yang
-    install -o root -g root ${S}/modules/ietf-netconf-notifications.yang ${D}/etc/sysrepo/yang/ietf-netconf-notifications@2012-02-06.yang
-    install -o root -g root ${S}/modules/ietf-netconf-with-defaults.yang ${D}/etc/sysrepo/yang/ietf-netconf-with-defaults@2011-06-01.yang
-    install -o root -g root ${S}/modules/ietf-netconf.yang ${D}/etc/sysrepo/yang/ietf-netconf@2011-06-01.yang
-    install -d ${D}/etc/init.d
-    install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.d/
-    install -d ${D}/usr/lib/sysrepo/plugins
+    install -d ${D}${sysconfdir}/sysrepo/data/notifications
+    install -d ${D}${sysconfdir}/sysrepo/yang
+    install -o root -g root ${S}/modules/ietf-netconf-notifications.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf-notifications@2012-02-06.yang
+    install -o root -g root ${S}/modules/ietf-netconf-with-defaults.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf-with-defaults@2011-06-01.yang
+    install -o root -g root ${S}/modules/ietf-netconf.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf@2011-06-01.yang
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0775 ${WORKDIR}/sysrepo ${D}${sysconfdir}/init.d/
+    install -d ${D}${libdir}/sysrepo/plugins
 }
diff --git a/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb b/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
index 47f578e5..d46176ce 100644
--- a/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
@@ -11,14 +11,14 @@ SRCREV = "d3f6ca02ec9ce7c96b55066d209d08adbe851897"
 
 S = "${WORKDIR}/git"
 
-FILES:${PN} += "/usr/share/yang/*"
+FILES:${PN} += "${datadir}/yang/*"
 
 do_install:append () {
-    install -d ${D}/usr/share/yang/modules/netopeer2
-    install -o root -g root ${S}/standard/ietf/RFC/iana-if-type.yang ${D}/usr/share/yang/modules/netopeer2/iana-if-type@2017-01-19.yang
-    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-types.yang ${D}/usr/share/yang/modules/netopeer2/ieee802-types@2022-10-31.yang
-    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-types.yang ${D}/usr/share/yang/modules/netopeer2/ieee802-dot1q-types@2022-10-31.yang
-    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-bridge.yang ${D}//usr/share/yang/modules/netopeer2/ieee802-dot1q-bridge@2022-10-31.yang
-    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-sched.yang ${D}//usr/share/yang/modules/netopeer2/ieee802-dot1q-sched@2022-08-18.yang
-    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-sched-bridge.yang ${D}//usr/share/yang/modules/netopeer2/ieee802-dot1q-sched-bridge@2022-08-18.yang
+    install -d ${D}${datadir}/yang/modules/netopeer2
+    install -o root -g root ${S}/standard/ietf/RFC/iana-if-type.yang ${D}${datadir}/yang/modules/netopeer2/iana-if-type@2017-01-19.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-types.yang ${D}${datadir}/yang/modules/netopeer2/ieee802-types@2022-10-31.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-types.yang ${D}${datadir}/yang/modules/netopeer2/ieee802-dot1q-types@2022-10-31.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-bridge.yang ${D}${datadir}/yang/modules/netopeer2/ieee802-dot1q-bridge@2022-10-31.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-sched.yang ${D}${datadir}/yang/modules/netopeer2/ieee802-dot1q-sched@2022-08-18.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-sched-bridge.yang ${D}${datadir}/yang/modules/netopeer2/ieee802-dot1q-sched-bridge@2022-08-18.yang
 }
-- 
2.17.1


