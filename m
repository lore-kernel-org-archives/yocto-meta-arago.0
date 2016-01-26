Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id BB44852092
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2016 17:06:55 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1K004P7KV25680@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 26 Jan 2016 11:06:38 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8	a=64GYHyxuAAAA:8
	a=G2WmJx3zI3nAsHGOhdMA:9 a=hekxwLru1oAA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 01E7A161E1C;	Tue,
	26 Jan 2016 12:06:38 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 26 Jan 2016 12:06:37 -0500
Message-id: <1453827997-25553-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1453827997-25553-1-git-send-email-denis@denix.org>
References: <1453827997-25553-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] memtester: upgrade 4.1.3 -> 4.3.0
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
X-List-Received-Date: Tue, 26 Jan 2016 17:06:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../memtester/{memtester_4.1.3.bb => memtester_4.3.0.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-benchmark/memtester/{memtester_4.1.3.bb => memtester_4.3.0.bb} (71%)

diff --git a/meta-arago-extras/recipes-benchmark/memtester/memtester_4.1.3.bb b/meta-arago-extras/recipes-benchmark/memtester/memtester_4.3.0.bb
similarity index 71%
rename from meta-arago-extras/recipes-benchmark/memtester/memtester_4.1.3.bb
rename to meta-arago-extras/recipes-benchmark/memtester/memtester_4.3.0.bb
index 74e704b..0964c04 100644
--- a/meta-arago-extras/recipes-benchmark/memtester/memtester_4.1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/memtester/memtester_4.3.0.bb
@@ -5,11 +5,11 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "http://pyropus.ca/software/memtester/old-versions/memtester-${PV}.tar.gz"
+SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz"
 SRC_URI += "file://Makefile.patch"
 
-SRC_URI[md5sum] = "e562451620cf5343016950462bc0dc38"
-SRC_URI[sha256sum] = "ac56f0b6d6d6e58bcf2a3fa7f2c9b29894f5177871f21115a1906c535106acf6"
+SRC_URI[md5sum] = "598f41b7308e1f736164bca3ab84ddbe"
+SRC_URI[sha256sum] = "f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88"
 
 do_compile () {
     echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
-- 
2.2.0


