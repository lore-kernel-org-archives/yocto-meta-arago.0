Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C6C4A52986
	for <meta-arago@arago-project.org>;
	Mon, 16 Apr 2018 22:12:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3GMCfoM011092
	for <meta-arago@arago-project.org>; Mon, 16 Apr 2018 17:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523916761;
	bh=mKxSRf1xi+EeJqLVwmtDeW1m2wK3HvqEVUzdggEeyp4=;
	h=From:To:CC:Subject:Date;
	b=nWlmwGAB6Lhovxdg0z19hBNoTeNAxJINniVBxGzfLV0kcYGAuRAMw7ktzptYLtC6L
	CIC5FCAuyt/+Mhdtja607wU/94XhVBjg+xkLeTTXucu99QedZ8l1HgtZGzmayY0C7o
	IpD8zdlB3hoKput70dk58PTgw25KdZts5OBOPUW0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GMCf3e007964
	for <meta-arago@arago-project.org>; Mon, 16 Apr 2018 17:12:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 16 Apr 2018 17:12:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 16 Apr 2018 17:12:41 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GMCfkb006425;
	Mon, 16 Apr 2018 17:12:41 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Apr 2018 18:12:33 -0400
Message-ID: <1523916755-32359-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [arm_benchmarks] [PATCH 0/2] Fix compilation warnings
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
X-List-Received-Date: Mon, 16 Apr 2018 22:12:45 -0000
Content-Type: text/plain

This patch set is to be applied on git://git.ti.com/apps/arm_benchmarks.git
to fix compilation warnings.

Hongmei Gou (2):
  linpack: fix compilation warnings
  dhrystone: fix compilation warnings

 dhrystone/dhry.h   | 14 +++++++++++++-
 dhrystone/dhry_1.c | 18 ++++++------------
 dhrystone/dhry_2.c |  6 +++---
 linpack/linpack.c  | 22 +++++++++++++++-------
 4 files changed, 37 insertions(+), 23 deletions(-)

-- 
1.9.1


