Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 32F0952A22
	for <meta-arago@arago-project.org>;
	Wed,  1 Jul 2015 17:29:51 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQT00N2QKKU4U10@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 01 Jul 2015 12:29:32 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=DcDq0aZW c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=RpGsS-YL7OMzZdSNXVsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 001FF161ABE;	Wed,
	1 Jul 2015 13:29:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 01 Jul 2015 13:29:17 -0400
Message-id: <1435771757-4156-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435771757-4156-1-git-send-email-denis@denix.org>
References: <1435771757-4156-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 2/2] local-arago64.conf.sample: switch SDK machine from 32 to 64 bit
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
X-List-Received-Date: Wed, 01 Jul 2015 17:29:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Unfortunately, latest Linaro prebuilt toolchains only support 64 bit host.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 sample-files/{local-arago.conf.sample => local-arago64.conf.sample} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 copy sample-files/{local-arago.conf.sample => local-arago64.conf.sample} (99%)

diff --git a/sample-files/local-arago.conf.sample b/sample-files/local-arago64.conf.sample
similarity index 99%
copy from sample-files/local-arago.conf.sample
copy to sample-files/local-arago64.conf.sample
index ea37da9..e5113fe 100644
--- a/sample-files/local-arago.conf.sample
+++ b/sample-files/local-arago64.conf.sample
@@ -79,7 +79,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 # you can build the SDK packages for architectures other than the machine you are 
 # running the build on (i.e. building i686 packages on an x86_64 host._
 # Supported values are i686 and x86_64
-SDKMACHINE ?= "i686"
+SDKMACHINE ?= "x86_64"
 
 #
 # Extra image configuration defaults
-- 
2.2.0


