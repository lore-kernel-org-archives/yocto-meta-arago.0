Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id 200D6529B3
	for <meta-arago@arago-project.org>;
	Tue, 12 Apr 2016 21:13:11 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5J00LJQHLJ4SA0@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 12 Apr 2016 16:12:55 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=XKdr95i7JqerCAM43OYA:9
Received: by 100.15.86.14 with SMTP id 1236fc94; Tue, 12 Apr 2016 21:12:55 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 22872161F9C;	Tue,
	12 Apr 2016 17:12:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 12 Apr 2016 17:12:54 -0400
Message-id: <1460495574-30213-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] tiff: update bbappend to disable xz/lzma
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
X-List-Received-Date: Tue, 12 Apr 2016 21:13:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../libtiff/{tiff_4.0.3.bbappend => tiff_%.bbappend}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-distro/recipes-multimedia/libtiff/{tiff_4.0.3.bbappend => tiff_%.bbappend} (51%)

diff --git a/meta-arago-distro/recipes-multimedia/libtiff/tiff_4.0.3.bbappend b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
similarity index 51%
rename from meta-arago-distro/recipes-multimedia/libtiff/tiff_4.0.3.bbappend
rename to meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
index c4d0e3b..10fc5ff 100644
--- a/meta-arago-distro/recipes-multimedia/libtiff/tiff_4.0.3.bbappend
+++ b/meta-arago-distro/recipes-multimedia/libtiff/tiff_%.bbappend
@@ -1,5 +1,5 @@
 PR_append = "-arago0"
 
 # Remove xz/lzma support to avoid pulling in additional GPLv3 licenses
-DEPENDS := "${@oe_filter_out('xz','${DEPENDS}', d)}"
-EXTRA_OECONF += " --disable-lzma"
+DEPENDS_remove = "xz"
+EXTRA_OECONF += "--disable-lzma"
-- 
2.2.0


