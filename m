Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 99B335298C
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 11:59:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99Bx2ll022745
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 06:59:02 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Bx2xd011110
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 06:59:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 06:59:02 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Bx2eV019603;
	Fri, 9 Oct 2015 06:59:02 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZkWKE-0000mK-6R; Fri, 09 Oct 2015 07:59:02 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 07:58:59 -0400
Message-ID: <1444391940-2958-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH v2 1/2] local-processor-sdk-64.conf.sample: Switch SDK machine to 64 bit
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
X-List-Received-Date: Fri, 09 Oct 2015 11:59:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: 
  * Add "oe-layersetup" prefix
  * Find copies harder

 ...cal-processor-sdk.conf.sample => local-processor-sdk-64.conf.sample} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 copy sample-files/{local-processor-sdk.conf.sample => local-processor-sdk-64.conf.sample} (99%)

diff --git a/sample-files/local-processor-sdk.conf.sample b/sample-files/local-processor-sdk-64.conf.sample
similarity index 99%
copy from sample-files/local-processor-sdk.conf.sample
copy to sample-files/local-processor-sdk-64.conf.sample
index d5af93a..726b1ba 100644
--- a/sample-files/local-processor-sdk.conf.sample
+++ b/sample-files/local-processor-sdk-64.conf.sample
@@ -79,7 +79,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 # you can build the SDK packages for architectures other than the machine you are 
 # running the build on (i.e. building i686 packages on an x86_64 host._
 # Supported values are i686 and x86_64
-SDKMACHINE ?= "i686"
+SDKMACHINE ?= "x86_64"
 
 #
 # Extra image configuration defaults
-- 
1.9.1


