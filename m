Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 973C152092
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 21:01:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RL1mk4123556
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 16:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538082108;
	bh=ZBiith+0ZSg54fzZkAa6NoiFuQlFsSMYn1IUc4CBhRM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UARZK2VDifMig7P1paCnAwXq8yubfBDEf0VUd3Hy7NkZjtDS7JCaaRDUjxI6iz5yt
	j24Yx9miko8K6oD/RVbGMd5kc06yqjDJywpTUcVd8pfavPZu8BBOqTBZg6eR0GKQlk
	ok0h2qylRSuKGN1fBNYczl75He3EfHsLCN90pMBo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RL1jrZ030276
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 16:01:48 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 16:01:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 16:01:45 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RL1j7m025863
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 16:01:45 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 17:01:43 -0400
Message-ID: <1538082103-53023-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538082103-53023-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538082103-53023-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [[meta-processor-sdk][PATCH v2] board-rtos: Removing the bbappend as the changes are upstreamed to meta-ti
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
X-List-Received-Date: Thu, 27 Sep 2018 21:01:57 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bbappend | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-bsp/board-rtos/board-rtos_git.bbappend
deleted file mode 100644
index 32567e2..0000000
--- a/recipes-bsp/board-rtos/board-rtos_git.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-PR_append = ".tisdk0"
-
-# The year in the license was updated to 2018
-LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=9bed8e4ac2fb37fc627cefe49eb1c919"
-
-BOARD_SRCREV = "983d89de8143645571e7893e95632a8be0fab67e"
-- 
1.9.1


