Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E4EFC52980
	for <meta-arago@arago-project.org>;
	Tue,  6 Aug 2019 19:44:05 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76JhAM3080434
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 14:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565120590;
	bh=G0B2c6Y6y4kHu4NfP0+Q7lUFDdmItS2+rkiLd2583IQ=;
	h=From:To:Subject:Date;
	b=bAzrtiUKc8nejwtZrg8QFcj0ceV3JA7GQSmXfGAkt8k37VFZy/YyYiTQIRSVUs2CQ
	ItjI6pjV748tTrQKc8HxjAwfSb/3h0uAckpqxJzGRBHtJ9rzWeIV+uwPqFS31T1VOE
	1ODw6dRkvxzQBCEHe/gev64WU5h0AgRA57YAsg9U=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76JhAUS116131
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 14:43:10 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 14:43:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 14:43:10 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76Jh9i5084537
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 14:43:09 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Aug 2019 15:43:05 -0400
Message-ID: <1565120586-55542-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] RTOS Patchset for using sysbios 6.76.02.02
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
X-List-Received-Date: Tue, 06 Aug 2019 19:44:06 -0000
Content-Type: text/plain

RTOS patchset containing the c6x big endian descope which is needed for using sysbios 6.76.02.02

Mahesh Radhakrishnan (1):
  fftlib: SRCREV update

 meta-arago-extras/recipes-ti/fftlib/fftlib.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


