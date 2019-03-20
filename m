Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 23229529E3
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2019 17:07:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2KH6psr008449
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 12:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553101611;
	bh=s5BRJv2YwMnc0+6wEispOyw8n2aK6G0rcwy5xyfbj0A=;
	h=From:To:Subject:Date;
	b=uTlzMj4eoWFFPJuC8mBPhqNB9JIyGaaJ5aBfMix8yFDS+ejB4L/StTmX7X8vRTl7K
	3uDu4UYf1GYsF0nJ8+lRpjCVJy4Ra0mToMrx2DRPADDByzmnVjGqVpeAnb+uMm9Fz5
	hYPuX3KQzlEb92Wsbi5IWGk8qzbnDt3wIHF6kc20=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2KH6pep024688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 12:06:51 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 20 Mar 2019 12:06:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Wed, 20 Mar 2019 12:06:51 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2KH6pTe024971
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 12:06:51 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Mar 2019 13:06:37 -0400
Message-ID: <1553101598-12744-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] FFTLIB SRCREV bump for C64P be deprecation
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
X-List-Received-Date: Wed, 20 Mar 2019 17:07:05 -0000
Content-Type: text/plain

This patch updates the FFTLIB which now has changes to deprecate C64Pbe targets forced by the sysbios tool update (6.75.02.00)

Mahesh Radhakrishnan (1):
  fftlib: SRCREV bump

 recipes-ti/fftlib/fftlib.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


