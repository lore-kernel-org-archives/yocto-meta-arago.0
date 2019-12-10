Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8F38C52988
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 21:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B12B40C06;
	Tue, 10 Dec 2019 21:55:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6arpyouVEb1A; Tue, 10 Dec 2019 21:55:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1227840BC4;
	Tue, 10 Dec 2019 21:55:39 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B311717434E;
	Tue, 10 Dec 2019 16:55:39 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 10 Dec 2019 16:55:39 -0500
Message-Id: <1576014939-30077-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] netperf, arago.conf: enable netperf intervals/pacing and histogram options
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
X-List-Received-Date: Tue, 10 Dec 2019 21:57:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                       | 3 +++
 meta-arago-distro/recipes-support/netperf/netperf_git.bbappend | 2 ++
 2 files changed, 5 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/netperf/netperf_git.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 3ae0065..fde8618 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -125,6 +125,9 @@ PACKAGECONFIG_append_pn-u-boot-ti-staging_k3 = " optee"
 # Enable encryption support in open62541
 PACKAGECONFIG_append_pn-open62541 = " encrypt"
 
+# Enable netperf intervals/pacing and histogram
+PACKAGECONFIG_append_pn-netperf = "intervals histogram"
+
 # Configure RAMFS for jailhouse linux-demo
 JH_RAMFS_IMAGE = "arago-tiny-image"
 
diff --git a/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend b/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
new file mode 100644
index 0000000..9527f36
--- /dev/null
+++ b/meta-arago-distro/recipes-support/netperf/netperf_git.bbappend
@@ -0,0 +1,2 @@
+PACKAGECONFIG[intervals] = "--enable-intervals,--disable-intervals,,"
+PACKAGECONFIG[histogram] = "--enable-histogram,--disable-histogram,,"
-- 
2.7.4


