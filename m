Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id CF5E752BBF
	for <meta-arago@arago-project.org>;
	Fri, 16 Apr 2021 17:10:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13GHBB23120228;
	Fri, 16 Apr 2021 12:11:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618593071;
	bh=WjWvnbuC09v0wY0yeCqgYp3JdTr0imD/+zU2MeqUr8w=;
	h=From:To:CC:Subject:Date;
	b=xuHMunJJ7MpAEv2Lmiz0hTMOPkJJ6X+oEVy3t8CWvuDlSYikJIVTaq6YwRSkrryNC
	Cy9ql/+rpR2tMoyld8YOumTRCCUfE1tDJZ8prnzKZczELyLRvfzK3rFnzUSif/YcwH
	GJn9mo36s5WBsrffMTsooUnBoKWo8sicZnt7UgXQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13GHBBM2035117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 12:11:11 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 16 Apr 2021 12:11:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 16 Apr 2021 12:11:11 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13GHBBTu100680;
	Fri, 16 Apr 2021 12:11:11 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	13GHBBiU095039; Fri, 16 Apr 2021 12:11:11 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Date: Fri, 16 Apr 2021 12:11:06 -0500
Message-ID: <20210416171107.24234-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH 1/2] packagegroups: remove jailhouse package for k3 platforms
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
X-List-Received-Date: Fri, 16 Apr 2021 17:10:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

jailhouse is not yet updated for kernel 5.10, remove the package for all
k3 platforms for now.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f92367d0..287cba63 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -59,7 +59,6 @@ UTILS_append_omap-a15 = " mmc-utils \
 UTILS_append_k3 = " mmc-utils \
                     switch-config \
                     irqbalance \
-                    jailhouse \
                     ti-rpmsg-char \
                     ti-rpmsg-char-examples \
                     statcol \
-- 
2.31.1


