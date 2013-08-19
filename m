Return-Path: <a013216@uda0217541>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2C05A529E7
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 05:51:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7J5pjZk012387
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2013 00:51:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7J5pj30024685
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2013 00:51:45 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 19 Aug 2013 00:51:45 -0500
Received: from udx0201389 ([172.24.190.133])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r7J5piu5016225;
	Mon, 19 Aug 2013 00:51:45 -0500
Received: from a013216 by udx0201389 with local (Exim 4.76)	(envelope-from
	<a013216@uda0217541>)	id 1VBINU-0002dZ-0w;
	Mon, 19 Aug 2013 11:21:44 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Aug 2013 11:21:30 +0530
Message-ID: <1376891490-10099-3-git-send-email-mrinmayee@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376891490-10099-1-git-send-email-mrinmayee@ti.com>
References: <1376891490-10099-1-git-send-email-mrinmayee@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sample-files: Added conf.sample file for GLSDK
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
X-List-Received-Date: Mon, 19 Aug 2013 05:51:46 -0000
Content-Type: text/plain

v1:

* The local-glsdk.conf.sample files contains the GLSDK branding.
  It will b used to generate local.conf by oe-layertool-setup.sh

v2:

* Copied sample file from amsdk.con.sample instead of linaro.conf.sample

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 ...l-amsdk.conf.sample => local-glsdk.conf.sample} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 copy sample-files/{local-amsdk.conf.sample => local-glsdk.conf.sample} (99%)

diff --git a/sample-files/local-amsdk.conf.sample b/sample-files/local-glsdk.conf.sample
similarity index 99%
copy from sample-files/local-amsdk.conf.sample
copy to sample-files/local-glsdk.conf.sample
index 1a08f5c..acd094f 100644
--- a/sample-files/local-amsdk.conf.sample
+++ b/sample-files/local-glsdk.conf.sample
@@ -147,8 +147,8 @@ PARALLEL_MAKE = "-j 1"
 
 DISTRO   = "arago"
 
-# Set branding policy for AM-SDK
-ARAGO_BRAND = "amsdk"
+# Set branding policy for GLSDK
+ARAGO_BRAND = "glsdk"
 
 # Set terminal types by default it expects gnome-terminal
 # but we chose xterm
-- 
1.7.9.5


