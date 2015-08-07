Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id F18C252987
	for <meta-arago@arago-project.org>;
	Fri,  7 Aug 2015 21:20:34 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSQ000PNDXURS80@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 07 Aug 2015 16:20:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=3YOlTCtgfmSa5OwsoaIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2489A161B48;	Fri,
	7 Aug 2015 17:20:18 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 07 Aug 2015 17:20:09 -0400
Message-id: <1438982412-15565-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438982412-15565-1-git-send-email-denis@denix.org>
References: <1438982412-15565-1-git-send-email-denis@denix.org>
Subject: [fido/master][PATCH 2/5] vtun: fix build when B != S
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
X-List-Received-Date: Fri, 07 Aug 2015 21:20:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
index bf3ced1..81bb00f 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -13,7 +13,7 @@ SRC_URI += "file://remove_strip.patch \
 SRC_URI[md5sum] = "f3becf2a0270910a841060c08d1db824"
 SRC_URI[sha256sum] = "69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca5788413ac7edb9cb"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure() {
 	oe_runconf --with-lzo-headers=${STAGING_INCDIR}/lzo --with-lzo-lib=${STAGING_LIBDIR} --with-ssl-headers=${STAGING_INCDIR}/openssl --with-ssl-lib=${STAGING_LIBDIR}
-- 
2.2.0


