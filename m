Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5308152090
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 21:00:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKxr17101027
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 15:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538081993;
	bh=y0xpi9R/qeq998p8E42ZcKe1TO7qWBQ7OHhOdQbD7nI=;
	h=From:To:Subject:Date;
	b=NVCcOdAsq2EU004cDYuN9o+LDo3qm2tniATt87WyIHIlxTPWkeKeaQ1RYPvQ4aqFS
	bZ0ob8aF8FNZMZvDgU5OFYpc1WrAPc3zK7hsU8wU87r9KQ47QZ4z2OtCIqXzr7JmVQ
	sih/QMFs4bcJLNm1Of1nFhlAxkFpQepE9teaKEAc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKxr3X022802
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 15:59:53 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:59:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:59:53 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKxrMZ022588
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 15:59:53 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 16:59:49 -0400
Message-ID: <1538081991-52963-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master/ti2018.03][PATCH v2 0/2] Resubmitting the patch with proper branch prefix
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
X-List-Received-Date: Thu, 27 Sep 2018 21:00:03 -0000
Content-Type: text/plain

The subject prefix branch was wrongly mentioned as morty. It is corrected now to rocko/master/ti2018.03


Mahesh Radhakrishnan (2):
  posix-smp-demo: Update to versin 01.01.00.02B
  big-data-ipc-demo: Update to version 01.02.00.00

 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc            | 6 +++---
 meta-arago-extras/recipes-apps/posix-smp-demo/posix-smp-demo.inc    | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.9.1


