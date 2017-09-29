Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 619AB52A87
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINY9v032440
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709414;
	bh=s5UUYhS+8u/VKvqfYLoDx/bjVRdsQNkldX3aDO/0DCw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fbi9jwRU1cqpLHWwKqsH8CAtQK+rYCzuUKBJd/mjLpM00CyCvJovHDD61390+jDMV
	1CDC1T0s2oQKBUoNJmJv6eYGFMm0xHg3Px50ObBewaeVvKKRb21kjkou4PeLHTo6wu
	Yvr7EmUEkvjuAMXlHyoT2RFKTy8sGWSe4mJXj/VI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINYgR010404
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:34 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:33 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8T006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:33 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:08 -0400
Message-ID: <1506709407-16448-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 04/ tisdk-rootfs-image: add packagegroup-arago-tisdk-graphics for omap-a15 unconditionally
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:37 -0000
Content-Type: text/plain

Note: This has been done for both ti33x and ti43x already.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/images/tisdk-rootfs-image.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/images/tisdk-rootfs-image.bbappend b/recipes-core/images/tisdk-rootfs-image.bbappend
index 7346c0d..4b5230f 100644
--- a/recipes-core/images/tisdk-rootfs-image.bbappend
+++ b/recipes-core/images/tisdk-rootfs-image.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk4"
+PR_append = ".tisdk5"
 
 IMAGE_INSTALL_append_ti43x = " \
 	packagegroup-arago-tisdk-graphics \
@@ -11,5 +11,6 @@ IMAGE_INSTALL_append_ti33x = " \
 
 
 IMAGE_INSTALL_append_omap-a15 = " \
+	packagegroup-arago-tisdk-graphics \
   	packagegroup-arago-tisdk-hmi \
 "
-- 
1.9.1


