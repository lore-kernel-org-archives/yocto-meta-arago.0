Return-Path: <a013216@uda0217541>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E8C8E529D0
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 05:51:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7J5pj88016736
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2013 00:51:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7J5pjMc024682
	for <meta-arago@arago-project.org>; Mon, 19 Aug 2013 00:51:45 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 19 Aug 2013 00:51:45 -0500
Received: from udx0201389 ([172.24.190.133])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r7J5piRl016224;
	Mon, 19 Aug 2013 00:51:44 -0500
Received: from a013216 by udx0201389 with local (Exim 4.76)	(envelope-from
	<a013216@uda0217541>)	id 1VBINT-0002dX-So;
	Mon, 19 Aug 2013 11:21:43 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Aug 2013 11:21:29 +0530
Message-ID: <1376891490-10099-2-git-send-email-mrinmayee@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376891490-10099-1-git-send-email-mrinmayee@ti.com>
References: <1376891490-10099-1-git-send-email-mrinmayee@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] configs : Override OECORELOCALCONF to use the glsdk.conf.sample
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

* The OECORELOCALCONF variable specifis the conf.sample file to be used
  to generate local.conf.
* Overriding it to the GLSDK conf.sample that contains the GLSDK branding.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 configs/glsdk/glsdk-06.01.00-config.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.01.00-config.txt
index 5708106..8bb1963 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.01.00-config.txt
@@ -8,4 +8,4 @@ meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago.conf.sample
+OECORELOCALCONF=./sample-files/local-glsdk.conf.sample
-- 
1.7.9.5


