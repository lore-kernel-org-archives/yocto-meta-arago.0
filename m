Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 77EEB529B2
	for <meta-arago@arago-project.org>;
	Thu, 12 Jul 2018 21:47:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6CLkuad027604
	for <meta-arago@arago-project.org>; Thu, 12 Jul 2018 16:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531432016;
	bh=BPGK/4PUQLB3ZHqPY9zUD/1YLdpqmVdg+H0OZP52bbk=;
	h=From:To:CC:Subject:Date;
	b=sfrmAs5xtX0EdnBFW4DWYCawe0yOxLTKYx9wSxkfYL/i8YLVEVoPr1Df/O48vuBzw
	wgHSyT0t3s6LJT4gKnPcIFSfXIb2o0TJAjg0a8YhIplzBv+/uD1KTPCM7/CnECpZlo
	cZlE+MJ9Qu0UDGmpgpGUCoOJcuf4hgq24uFzYY4Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CLkuEA018450
	for <meta-arago@arago-project.org>; Thu, 12 Jul 2018 16:46:56 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 12 Jul 2018 16:46:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 12 Jul 2018 16:46:56 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6CLkulx005968;
	Thu, 12 Jul 2018 16:46:56 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Jul 2018 21:45:24 +0000
Message-ID: <20180712214524.12947-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] external-linaro-toolchain: switch from USE_LDCONFIG to ldconfig distro feature
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
X-List-Received-Date: Thu, 12 Jul 2018 21:47:03 -0000
Content-Type: text/plain

Corresponding change was made upstream and USE_LDCONFIG is no longer set.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index 6ebcb4be..8230790d 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -26,7 +26,7 @@ RDEPENDS_libubsan += "libstdc++"
 PKGV = "${ELT_VER_LIBC}"
 PKGV_glibc-thread-db = "${ELT_VER_LIBC}"
 
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
+FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_${PN} += "\
 	${libdir}/bin \
 	${libdir}/locale \
-- 
2.17.1


