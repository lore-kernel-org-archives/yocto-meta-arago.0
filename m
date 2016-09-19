Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 12A8E5299F
	for <meta-arago@arago-project.org>;
	Mon, 19 Sep 2016 17:47:27 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODR00JAOIQD2900@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 19 Sep 2016 12:47:01 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=b01i9L7eAAAA:8 a=NEAV23lmAAAA:8
	a=urWRJy5xc-Yxx_1JFboA:9
Received: by 100.15.110.130 with SMTP id 70021af7;
	Mon, 19 Sep 2016 17:47:01 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id CA9C4162138;	Mon, 19 Sep 2016 13:47:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 19 Sep 2016 13:47:00 -0400
Message-id: <1474307220-14376-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cpuset: update to 1.5.7 and move from googlecode to github
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
X-List-Received-Date: Mon, 19 Sep 2016 17:47:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/cpuset/{cpuset_1.5.6.bb => cpuset_1.5.7.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-support/cpuset/{cpuset_1.5.6.bb => cpuset_1.5.7.bb} (57%)

diff --git a/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.6.bb b/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.7.bb
similarity index 57%
rename from meta-arago-extras/recipes-support/cpuset/cpuset_1.5.6.bb
rename to meta-arago-extras/recipes-support/cpuset/cpuset_1.5.7.bb
index 16c6ab0..c3690f0 100644
--- a/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.6.bb
+++ b/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.7.bb
@@ -3,10 +3,10 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "https://cpuset.googlecode.com/files/${P}.tar.gz"
+SRC_URI = "https://github.com/lpechacek/cpuset/archive/v${PV}.tar.gz"
 
-SRC_URI[md5sum] = "50a0251c31990bb4ad63312e356ffcb5"
-SRC_URI[sha256sum] = "800d9312bccb5b9802c04661464c6d8f14be8c677f68502e82558c6cb1b03413"
+SRC_URI[md5sum] = "6ad79b26ba03f559604d74513cc34392"
+SRC_URI[sha256sum] = "32334e164415ed5aec83c5ffc3dc01c418406eb02d96d881fdfd495587ff0c01"
 
 S = "${WORKDIR}/${P}"
 
-- 
2.7.4


