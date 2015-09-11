Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 2633A52094
	for <meta-arago@arago-project.org>;
	Fri, 11 Sep 2015 18:19:37 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUI00539YW3HZ70@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 11 Sep 2015 13:19:16 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=-yrKPREcibZsVZ526qMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8CF84161BEA;	Fri,
	11 Sep 2015 14:19:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 11 Sep 2015 14:19:14 -0400
Message-id: <1441995554-18225-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] omapdrmtest: bump srcrev, update patch to init variable
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
X-List-Received-Date: Fri, 11 Sep 2015 18:19:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-util-demux-update-use-of-deprecated-API.patch   | 16 +++++++++-------
 .../recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb    |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch
index ca3c431..387568e 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest/0001-util-demux-update-use-of-deprecated-API.patch
@@ -1,22 +1,24 @@
-From 7e3a5727e020ea05702d0d1d819409619c7980c1 Mon Sep 17 00:00:00 2001
+From 50a533a969a0efd9c4c7713ad571b8f853b1b7e5 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
-Date: Fri, 21 Aug 2015 13:51:20 -0400
+Date: Fri, 11 Sep 2015 12:57:56 -0400
 Subject: [PATCH] util/demux: update use of deprecated API
 
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- util/demux.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ util/demux.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/util/demux.c b/util/demux.c
-index fdd4b77..722fed7 100644
+index d739519..e932ac4 100644
 --- a/util/demux.c
 +++ b/util/demux.c
-@@ -46,17 +46,17 @@ static AVFormatContext *
+@@ -44,18 +44,18 @@ int get_esds_offset(const char *filename, struct demux *demux);
+ static AVFormatContext *
  open_file(const char *filename)
  {
- 	AVFormatContext *afc;
+-	AVFormatContext *afc;
 -	int err = av_open_input_file(&afc, filename, NULL, 0, NULL);
++	static AVFormatContext *afc = NULL;
 +	int err = avformat_open_input(&afc, filename, NULL, NULL);
  
  	if (!err)
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 5a850f7..ac45da3 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -7,7 +7,7 @@ DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux wayland"
 inherit autotools pkgconfig
 
 PR = "r8"
-SRCREV = "24db635c4689291ae350d0c940b30ba7203dc5b7"
+SRCREV = "152713c45d7972ed08f506255c43ce7ff634a9f5"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
 	file://0001-util-demux-update-use-of-deprecated-API.patch \
-- 
2.2.0


