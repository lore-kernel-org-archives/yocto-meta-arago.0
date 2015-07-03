Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 4352A52A08
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:43 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00LXQ5S5N440@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=C1XLAfSrumd4cOKOHToA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5550E161AED;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:02:04 -0400
Message-id: <1435892533-6046-46-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 45/54] iperf: fix build when B != S
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
index 32c76e1..5abce3b 100644
--- a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -4,7 +4,7 @@ SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz \
             file://000-Iperf_Fix-CPU-Usage.diff \
@@ -18,9 +18,9 @@ SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz \
 SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
 SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
 
-inherit autotools
+inherit autotools-brokensep
 
-S="${WORKDIR}/iperf-${PV}"
+S = "${WORKDIR}/iperf-${PV}"
 
 EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
@@ -31,7 +31,6 @@ do_configure() {
 }
 
 do_compile() {
-    cd ${WORKDIR}/iperf-${PV}
     oe_runmake
 }
 
-- 
2.2.0


