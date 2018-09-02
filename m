Return-Path: <x0257344@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 54D3852978
	for <meta-arago@arago-project.org>;
	Sun,  2 Sep 2018 18:55:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w82ItVPb092275
	for <meta-arago@arago-project.org>; Sun, 2 Sep 2018 13:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535914531;
	bh=R5EQy2KROMuB9/xDJktJ/NqNPPXhsAFBpl6vucoiolk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YeVeCRhOYTvwqWlgXW4IAUiGpvWhD49boyXvPwlBMFDGmLt6HFVX4GYHZ8y72ct0S
	x7qVvwF+xKQ7r4+C7+jF+iYNCjAj/O3CeXS1pVXT0VrPwIkNojs9nv9kmytyjAgZOW
	BgVWuF+4t2TyYrFj9J9k/0AQgnSPkWSo5WwxF6JU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w82ItVxq017079
	for <meta-arago@arago-project.org>; Sun, 2 Sep 2018 13:55:31 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Sun, 2 Sep 2018 13:55:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Sun, 2 Sep 2018 13:55:31 -0500
Received: from LAP000283.mistral.in (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w82It6kE003835
	for <meta-arago@arago-project.org>; Sun, 2 Sep 2018 13:55:30 -0500
From: Pratap Reddy <x0257344@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Sep 2018 00:24:57 +0530
Message-ID: <1535914497-12916-2-git-send-email-x0257344@ti.com>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1535914497-12916-1-git-send-email-x0257344@ti.com>
References: <1535914497-12916-1-git-send-email-x0257344@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] icss-emac-lld: Checksum update
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
X-List-Received-Date: Sun, 02 Sep 2018 18:55:39 -0000
Content-Type: text/plain

From: M V Pratap Reddy <x0257344@ti.com>

Signed-off-by: M V Pratap Reddy <x0257344@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
new file mode 100644
index 0000000..e2ef25c
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
@@ -0,0 +1 @@
+LIC_FILES_CHKSUM = "file://icss_emacDrv.h;beginline=1;endline=40;md5=590829f0298e5fc1165894e26d5380fc"
-- 
1.9.5.msysgit.1



