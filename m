Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 67D555297D
	for <meta-arago@arago-project.org>;
	Fri, 21 Aug 2015 17:54:19 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTG009L11Q39N10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 21 Aug 2015 12:54:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=PA8LuDlAzGS-b3faOAsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2D588161B9F;	Fri,
	21 Aug 2015 13:54:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 21 Aug 2015 13:54:02 -0400
Message-id: <1440179642-11863-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] omapdrmtest: fix use of deprecated libav/ffmpeg API
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
X-List-Received-Date: Fri, 21 Aug 2015 17:54:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...1-util-demux-update-use-of-deprecated-API.patch | 38 ++++++++++++++++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |  8 +++--
 2 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch
new file mode 100644
index 0000000..ca3c431
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch
@@ -0,0 +1,38 @@
+From 7e3a5727e020ea05702d0d1d819409619c7980c1 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 21 Aug 2015 13:51:20 -0400
+Subject: [PATCH] util/demux: update use of deprecated API
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ util/demux.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/util/demux.c b/util/demux.c
+index fdd4b77..722fed7 100644
+--- a/util/demux.c
++++ b/util/demux.c
+@@ -46,17 +46,17 @@ static AVFormatContext *
+ open_file(const char *filename)
+ {
+ 	AVFormatContext *afc;
+-	int err = av_open_input_file(&afc, filename, NULL, 0, NULL);
++	int err = avformat_open_input(&afc, filename, NULL, NULL);
+ 
+ 	if (!err)
+-		err = av_find_stream_info(afc);
++		err = avformat_find_stream_info(afc, NULL);
+ 
+ 	if (err < 0) {
+ 		ERROR("%s: lavf error %d", filename, err);
+ 		exit(1);
+ 	}
+ 
+-	dump_format(afc, 0, filename, 0);
++	av_dump_format(afc, 0, filename, 0);
+ 
+ 	return afc;
+ }
+-- 
+2.2.0
+
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 5ed1783..5a850f7 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -6,10 +6,12 @@ DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux wayland"
 
 inherit autotools pkgconfig
 
-PR = "r7"
-SRCREV = "a2f483ef833ce7a6f3e0b975d9e49267960b288e"
+PR = "r8"
+SRCREV = "24db635c4689291ae350d0c940b30ba7203dc5b7"
 
-SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git"
+SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
+	file://0001-util-demux-update-use-of-deprecated-API.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.2.0


