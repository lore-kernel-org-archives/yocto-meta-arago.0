Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4975952974
	for <meta-arago@arago-project.org>;
	Fri,  3 Jun 2016 15:47:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u53FlGvt021884
	for <meta-arago@arago-project.org>; Fri, 3 Jun 2016 10:47:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u53FlMoD010526
	for <meta-arago@arago-project.org>; Fri, 3 Jun 2016 10:47:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Jun 2016 10:47:22 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u53FlMwY015212;
	Fri, 3 Jun 2016 10:47:22 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1b8rJh-0000BG-Uk; Fri, 03 Jun 2016 11:47:21 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Jun 2016 11:47:20 -0400
Message-ID: <1464968840-658-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH] tisdk.xml: update recommended Ubuntu version
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
X-List-Received-Date: Fri, 03 Jun 2016 15:47:24 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 installer-files/tisdk.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/installer-files/tisdk.xml b/installer-files/tisdk.xml
index d7370ef..e763f1e 100644
--- a/installer-files/tisdk.xml
+++ b/installer-files/tisdk.xml
@@ -70,7 +70,7 @@
             <title>Linux Environment Support Message</title>
             <description></description>
             <explanation></explanation>
-            <value>It is highly recommend that the user, or especially new users, install this SDK into a Ubuntu 12.04 distribution environment. This is the environment that was used to develop and test this SDK.
+            <value>It is highly recommend that the user, or especially new users, install this SDK into a Ubuntu 14.04 or Ubuntu 16.04 distribution environment. This is the environment that was used to develop and test this SDK.
 
 Please note that this suggestion does not prevent the SDK from installing on other Linux Distributions.</value>
             <default></default>
-- 
1.9.1


