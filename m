Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id ABCE852996
	for <meta-arago@arago-project.org>;
	Mon, 11 Apr 2016 03:09:12 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5G00A6J8QWQ830@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 10 Apr 2016 22:08:57 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=xNf9USuDAAAA:8 a=cH6R9-kdAAAA:8
	a=FP58Ms26AAAA:8 a=-iLcRP7g064gVotAwm4A:9
Received: by 100.15.86.14 with SMTP id 485a25c8; Mon, 11 Apr 2016 03:08:57 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AF3A0161F8A;	Sun,
	10 Apr 2016 23:08:56 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 10 Apr 2016 23:08:56 -0400
Message-id: <1460344136-27266-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] vtun: fix compile with gcc5, don't pre-create /var/run dir
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
X-List-Received-Date: Mon, 11 Apr 2016 03:09:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../vtun/vtun/08-gcc5-inline.patch                   | 20 ++++++++++++++++++++
 .../recipes-connectivity/vtun/vtun_3.0.3.bb          |  7 ++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch

diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch b/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch
new file mode 100644
index 0000000..c9a0090
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun/08-gcc5-inline.patch
@@ -0,0 +1,20 @@
+Description: fix gcc5 build failure:
+ The visibility of one of the functions in the yacc grammar is increased so
+ the program links without error now.
+Origin: vendor
+Bug-Debian: https://bugs.debian.org/778164
+Author: "Potter, Tim (Cloud Services)" <timothy.potter@hp.com>
+Reviewed-by: gregor herrmann <gregoa@debian.org>
+Last-Update: 2015-07-23
+
+--- a/cfg_file.y
++++ b/cfg_file.y
+@@ -624,7 +624,7 @@
+ }
+ 
+ /* Clear the VTUN_NAT_HACK flag which are not relevant to the current operation mode */
+-inline void clear_nat_hack_flags(int svr)
++extern inline void clear_nat_hack_flags(int svr)
+ {
+ 	if (svr)
+ 		llist_trav(&host_list,clear_nat_hack_server,NULL);
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
index 81bb00f..7b31421 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://vtun.h;startline=1;endline=17;md5=9ac9e7fefca60c72400
 SRC_URI = "http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun-${PV}.tar.gz"
 
 SRC_URI += "file://remove_strip.patch \
-	    file://Add_search_path.patch"
+	    file://Add_search_path.patch \
+	    file://08-gcc5-inline.patch"
 
 SRC_URI[md5sum] = "f3becf2a0270910a841060c08d1db824"
 SRC_URI[sha256sum] = "69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca5788413ac7edb9cb"
@@ -18,3 +19,7 @@ inherit autotools-brokensep
 do_configure() {
 	oe_runconf --with-lzo-headers=${STAGING_INCDIR}/lzo --with-lzo-lib=${STAGING_LIBDIR} --with-ssl-headers=${STAGING_INCDIR}/openssl --with-ssl-lib=${STAGING_LIBDIR}
 }
+
+do_install_append() {
+	rm -rf ${D}${localstatedir}/run
+}
-- 
2.2.0


