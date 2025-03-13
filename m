Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC8EC36002
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 19:05:23 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.23086.1741892718941025973
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 12:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=stpWSw6J;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5Ina1947894
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 13 Mar 2025 14:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741892718;
	bh=LC653WEHRIDpOsCpTLcZxYJltDQ0Ug6+jrMj4gXqp0E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=stpWSw6JMGFsFLz9fMN0D21dfBPXEZVB7P/YNn2o7S+nB6XReXCfHXObuDVzHhTCA
	 gcTTnJPT3J+dXlRNjobtTiHTAGAbd14pXg8KIpFiWzi2EIzqjUvficxk2KITaG+/6f
	 dXv6i32iNW1F6ubo3HGWu5yIDsO5GSGSj0Zuc/fI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DJ5I7t099369;
	Thu, 13 Mar 2025 14:05:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 14:05:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 14:05:17 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DJ5Hgr026774;
	Thu, 13 Mar 2025 14:05:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsnrp-0005t6-OE; Thu, 13 Mar 2025 14:05:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 10/14] libnetconf2: move and clean up
Date: Thu, 13 Mar 2025 14:05:12 -0500
Message-ID: <20250313190516.22522-11-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313190516.22522-1-reatmon@ti.com>
References: <20250313190516.22522-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 19:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16039

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Shorten SUMMARY, split DESCRIPTION
* Don't hardcode /usr when passing to CMake

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../sysrepo}/libnetconf2_git.bb                          | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/libnetconf2 => recipes-extended/sysrepo}/libnetconf2_git.bb (54%)

diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
similarity index 54%
rename from meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
rename to meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
index 6b3f73ca..0d124890 100644
--- a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/libnetconf2_git.bb
@@ -1,5 +1,6 @@
-SUMMARY = "libnetconf2 is a NETCONF library in C intended for building NETCONF clients and servers"
-DESCRIPTION = "The library provides functions to connect NETCONF client and server to each other via SSH and to send, receive and process NETCONF messages."
+SUMMARY = "NETCONF library in C for building NETCONF clients and servers"
+DESCRIPTION = "The library provides functions to connect NETCONF client and server \
+to each other via SSH and to send, receive and process NETCONF messages."
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=08a5578c9bab06fb2ae84284630b973f"
@@ -19,8 +20,6 @@ FILES:${PN} += "${datadir}/yang/modules/libnetconf2/*"
 
 inherit cmake pkgconfig
 
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-#EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release -DLIBYANG_INCLUDE_DIR=/usr/include -DLIBYANG_LIBRARY=/usr/lib "
-EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release "
+EXTRA_OECMAKE = "-DCMAKE_INSTALL_PREFIX:PATH=${prefix} -DCMAKE_BUILD_TYPE:String=Release"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


