Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A9EC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:40:39 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.11385.1741862431283041131
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XxJNbrV5;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUKo1850176
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 05:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741862430;
	bh=OQTvUPyaAyqgU6jX9aEVf5fyKbwvUuSrz+pvi6GEaII=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XxJNbrV5yJcLuurWl9nvEDvKbGly6TIk9yK+PYzlZAbZQqd4EFGZ/RZV5OkjhAnU1
	 lZqa1ck2l7M2y4/qIgxeF97ZDQKkcY//KKXKz1lvnJl1SjDP1VnrhqegN77t3rwkyf
	 SLTmjgq3v+pXbQi0V7xo/xIvUvtUIgEJVpjVWNiM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUeB056859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 05:40:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 05:40:29 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeTgB083617;
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsfzJ-0003uh-T0; Thu, 13 Mar 2025 05:40:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 03/13] libyang: Add BBCLASSEXTEND for native
Date: Thu, 13 Mar 2025 05:40:19 -0500
Message-ID: <20250313104029.14977-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313104029.14977-1-reatmon@ti.com>
References: <20250313104029.14977-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:40:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16015

We need to add BBCLASSEXTEND for native so that we can build
sysrepo-native for the netopeer2-server install.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-sysrepo/libnetconf2/libnetconf2_git.bb          | 6 +++---
 .../recipes-sysrepo/libyang/libyang_%.bbappend              | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend

diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
index c62d3faa..6b3f73ca 100644
--- a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08a5578c9bab06fb2ae84284630b973f"
 
 SRC_URI = "git://github.com/CESNET/libnetconf2.git;protocol=https;branch=devel"
 
-PV = "2.1.34+git"
-SRCREV = "91cd6d75722c65de5c005d908f6d645b48cee89b"
+PV = "3.5.5+git"
+SRCREV = "4c7858c9c41f1ac04d2b15c032291e335fc0f5f5"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libssh openssl libyang libxcrypt \
+DEPENDS = "libssh openssl libyang libxcrypt mbedtls curl \
     ${@bb.utils.contains('DISTRO_FEATURES','pam','libpam','',d)} \
 "
 
diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend b/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
new file mode 100644
index 00000000..608377e3
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


