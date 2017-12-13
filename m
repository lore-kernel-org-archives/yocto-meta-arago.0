Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id B4B6B52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 22:17:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDMHUoR015623
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:17:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513203450;
	bh=tijJIjXjcw9oZ5sPFSO17nwJ3sx2Z37oQhf2Mw7TPvk=;
	h=From:To:Subject:Date;
	b=WvBZNw+scyokGNGD01eFhILijBzz7ioFMZhg1IcVyorXUb++ewHqlGOwUKGFOLaRy
	FbPahEBpVDzuZC0LpAl3TI4LSbuGxX+VOnQdPxGP12h5duj2OnQzEznjohIIWUnigH
	fR75m0ul5E93WcD1KwL2Z3azx9nVB+P+X/Wv8vmE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDMHPJO007324
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:17:25 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 16:17:24 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 13 Dec 2017 16:17:25 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDMHODk007705
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 16:17:24 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 17:17:22 -0500
Message-ID: <1513203442-24103-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2 ] uart-lld-rtos: Updating to version 1.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 22:17:40 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Renaming the extension of the file to bbappend 
 v1 - Initial draft

 recipes-bsp/uart-lld/{uart-lld-rtos_git.bb => uart-lld-rtos_git.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-bsp/uart-lld/{uart-lld-rtos_git.bb => uart-lld-rtos_git.bbappend} (100%)

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend
similarity index 100%
rename from recipes-bsp/uart-lld/uart-lld-rtos_git.bb
rename to recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend
-- 
1.9.1


