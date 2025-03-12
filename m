Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F20C35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.38834.1741790742969719918
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iJKMf23+;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfWd1525240
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790741;
	bh=9hct/iIZFiI+hsUMmr1v4LZeCTcXEAvSY77Ks1A22EE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=iJKMf23+dQYuj7fguSxIdNMEUSOSXc7PsA2llcMlIx0BYAY1ZxC6GwTYlqKTXPCZW
	 6DH2Zu0fqRrWn07Yi/aHlG3KSrQ2Aa4uB7nHBGjY0VvujiRgjxnCCMicss7Pnjd5as
	 LElvQS54q7eWHvG0wgbZfLzatMhIqhUoz2vIhXMc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfRd013978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:45:41 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjfXW074647;
	Wed, 12 Mar 2025 09:45:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL3-0003tR-1g; Wed, 12 Mar 2025 09:45:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 09/10] open62541: Wrap the bbappend in a compliant manner
Date: Wed, 12 Mar 2025 09:45:39 -0500
Message-ID: <20250312144540.14210-10-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312144540.14210-1-reatmon@ti.com>
References: <20250312144540.14210-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16001

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...en62541_%.bbappend => open62541-arago.inc} |  8 ++--
 .../open62541/open62541_%.bbappend            | 42 ++-----------------
 2 files changed, 7 insertions(+), 43 deletions(-)
 copy meta-arago-extras/recipes-connectivity/open62541/{open62541_%.bbappend => open62541-arago.inc} (83%)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
similarity index 83%
copy from meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
copy to meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
index 765639fa..745c88a1 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
@@ -1,7 +1,8 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/open62541:"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-SRC_URI:append = " file://0001-examples-client-allow-configurable-server.patch \
-                   file://0001-examples-Remove-sys-io.h.patch \
+SRC_URI:append = " \
+    file://0001-examples-client-allow-configurable-server.patch \
+    file://0001-examples-Remove-sys-io.h.patch \
 "
 
 EXTRA_OECMAKE = "-DUA_BUILD_EXAMPLES=1"
@@ -37,4 +38,3 @@ ALLOW_EMPTY:${PN}-staticdev = "1"
 ALLOW_EMPTY:${PN}-tests = "1"
 
 BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
index 765639fa..c7e308c6 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
@@ -1,40 +1,4 @@
+OPEN62541_ARAGO = ""
+OPEN62541_ARAGO:arago = "open62541-arago.inc"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-SRC_URI:append = " file://0001-examples-client-allow-configurable-server.patch \
-                   file://0001-examples-Remove-sys-io.h.patch \
-"
-
-EXTRA_OECMAKE = "-DUA_BUILD_EXAMPLES=1"
-
-# Install examples and unit tests
-do_install:append() {
-    # Install examples
-    install -d "${D}${datadir}/${BPN}/examples"
-    for example in ${B}/bin/examples/*
-    do
-        install -m 755 "$example" "${D}${datadir}/${BPN}/examples"
-    done
-
-    if ${@bb.utils.contains('PACKAGECONFIG','unit_tests','true','false',d)}
-    then
-        # Install unittests
-        install -d "${D}${datadir}/${BPN}/tests"
-        for test in ${B}/bin/tests/*
-        do
-            install -m 755 "$test" "${D}${datadir}/${BPN}/tests"
-        done
-    fi
-}
-
-PACKAGES =+ "${PN}-examples ${PN}-tests"
-FILES:${PN} += "${bindir}"
-FILES:${PN}-dev += "${libdir}/cmake/* ${datadir}/${BPN}/tools"
-FILES:${PN}-examples += "${datadir}/${BPN}/examples"
-FILES:${PN}-tests += "${datadir}/${BPN}/tests"
-
-# Allow staticdev package to be empty incase sharedlibs is switched on
-ALLOW_EMPTY:${PN}-staticdev = "1"
-ALLOW_EMPTY:${PN}-tests = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
+require ${OPEN62541_ARAGO}
-- 
2.17.1


