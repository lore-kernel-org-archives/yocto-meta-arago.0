Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id DBBAE52ABA
	for <meta-arago@arago-project.org>;
	Thu,  8 Jul 2021 17:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8793040BA8;
	Thu,  8 Jul 2021 17:59:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pKfYI6Gdtfue; Thu,  8 Jul 2021 17:59:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6B7F740C1D;
	Thu,  8 Jul 2021 17:59:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2F032174626;
	Thu,  8 Jul 2021 13:59:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  8 Jul 2021 13:59:43 -0400
Message-Id: <1625767184-49268-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625767184-49268-1-git-send-email-denis@denix.org>
References: <1625767184-49268-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 3/4] pcitest: upgrade 5.4 -> 5.10
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
X-List-Received-Date: Thu, 08 Jul 2021 17:59:49 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

pcitest resides in kernel tree - use the same tree and commit ID as for the
kernel and linux-libc-headers.

COPYING file had minor changes, adjust checksum accordingly.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/pcitest/{pcitest_5.4.bb => pcitest_5.10.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-kernel/pcitest/{pcitest_5.4.bb => pcitest_5.10.bb} (73%)

diff --git a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
similarity index 73%
rename from meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
rename to meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
index 8edbd93..733f3ba 100644
--- a/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.4.bb
+++ b/meta-arago-extras/recipes-kernel/pcitest/pcitest_5.10.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Linux Kernel PCI test"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-BRANCH = "ti-linux-5.4.y"
-SRCREV = "738552d0b0292e148b35d60ec47ca3c8dd6007b4"
+BRANCH = "ti-linux-5.10.y"
+SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


