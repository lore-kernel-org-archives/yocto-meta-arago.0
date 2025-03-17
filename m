Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D34C36008
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.60912.1742236646563119690
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XTfZ6U2V;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPRI2373296
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 13:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236645;
	bh=hMG2hEIy8LGttlkWD2sTUfY0iBIVbLbeEXvpnKVLz1o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XTfZ6U2VJF+5VbfMyR93ewLcHzmf5LXBLd7rA4imfpAAdFjEar8rMDGue3vSNxiuC
	 sNQJEtCAMDXoMsTBoUtqmHFYxXIuZO9jB40gXk2myz4UftJPL1eJ5cvPX5cNvYEOxn
	 lvjZwVVy3oryTqdwuZkhPnzuylDM6yqNzjpfYIjo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPvl092936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:25 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbPBr000464;
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL3-0008ES-1t; Mon, 17 Mar 2025 13:37:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 04/14] libnetconf2: Update to version 3.5.5
Date: Mon, 17 Mar 2025 13:37:14 -0500
Message-ID: <20250317183724.31563-6-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250317183724.31563-1-reatmon@ti.com>
References: <20250317183724.31563-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 18:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16060

With the update to libyang we need to move to a newer version of
libnetconf2.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-sysrepo/libnetconf2/libnetconf2_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
 
-- 
2.17.1


