Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8E4B752094
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2018 13:42:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8ODg2eB009915
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 08:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537796522;
	bh=8PP9pIqd0bJ+Nuq0DC964ouif7q3JLvWQwclcuNBSbY=;
	h=From:To:CC:Subject:Date;
	b=TAgqUQBfM7FkHSKkEFFiIJIzGYi8Nc8wF47mNZVUjlsTaWDQLr69QKkgNg+bYOYdx
	cdIqYGdhdtbUo3VtmWJichej7d6e+5ZueZ4qlbiBmyjQKkXWR+68f1l6U0ZZPcBdYN
	YpRWF8c+/Z9jAiPWO4c+Kkv5onpKv7M3vBtsGZAM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8ODg17K031758
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 08:42:02 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 24 Sep 2018 08:42:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 24 Sep 2018 08:42:00 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8ODg0p3021402;
	Mon, 24 Sep 2018 08:42:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Sep 2018 09:29:29 -0400
Message-ID: <1537795769-15998-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] iproute2: remove the debug print from the code
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2018 13:42:10 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...-prp-remove-the-debug-print-from-the-code.patch | 33 ++++++++++++++++++++++
 .../iproute2/iproute2_4.11.0.bbappend              |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-remove-the-debug-print-from-the-code.patch

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-remove-the-debug-print-from-the-code.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-remove-the-debug-print-from-the-code.patch
new file mode 100644
index 0000000..e6dc8b3
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-hsr-prp-remove-the-debug-print-from-the-code.patch
@@ -0,0 +1,33 @@
+From dafdd0fd2bf7ce1aa2806a02a40aa5b8350e9ca0 Mon Sep 17 00:00:00 2001
+From: Murali Karicheri <m-karicheri2@ti.com>
+Date: Fri, 21 Sep 2018 16:10:55 -0400
+Subject: [PATCH] hsr/prp: remove the debug print from the code.
+
+This debug print causes a parser error in iec62439 mib parser
+that expects the iplink -d output to be in a certain format to
+extract the hsr/prp interface details. This was a left over
+code from debugging which is removed to fix the issue. This print
+appears when iplink -d command is executed causing the issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
+---
+ ip/iplink_hsr.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
+index 2153494..34e9167 100644
+--- a/ip/iplink_hsr.c
++++ b/ip/iplink_hsr.c
+@@ -134,7 +134,6 @@ static void hsr_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+ 	if (!tb)
+ 		return;
+ 
+-	printf("%s\n", __func__);
+ 	if (tb[IFLA_HSR_SLAVE1] &&
+ 	    RTA_PAYLOAD(tb[IFLA_HSR_SLAVE1]) < sizeof(__u32))
+ 		return;
+-- 
+2.7.4
+
diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
index e65d90e..2b2d6d2 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.11.0.bbappend
@@ -1,8 +1,9 @@
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append = " \
            file://0001-add-support-for-prp-similar-to-hsr.patch \
            file://0001-hsr-prp-add-support-for-vlan-tagged-sv-frames.patch \
+           file://0001-hsr-prp-remove-the-debug-print-from-the-code.patch \
           "
-- 
2.7.4


