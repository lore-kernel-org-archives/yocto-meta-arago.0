Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D769652980
	for <meta-arago@arago-project.org>;
	Tue,  6 Aug 2019 18:58:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IvZWC064001
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 13:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117855;
	bh=2v5wlWdFMAUCHGUjSaMx4Cvz4yroIuF+6msijX1YwMU=;
	h=From:To:Subject:Date;
	b=x42AyW0zF9dLGTuw47VWvHEgr/H5k4DhoTn0rC/95JJoU6fwziHNVQ41SNCRP+kto
	XAPsuCUm0Upwh4cml85vn24KH4oaDmCkrLWUgpW5d2D8it5Wl3IxrwJ7fkXdM4X5Ng
	qmAz5/KQEbB3zava8BEj+7jDPN64sQlY9iyWqz3Y=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IvZfx066950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 13:57:35 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:57:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:57:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IvYkC091355
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 13:57:34 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Aug 2019 14:57:32 -0400
Message-ID: <1565117853-52717-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] RTOS patchset to use sysbios 6.76.02.02
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
X-List-Received-Date: Tue, 06 Aug 2019 18:58:31 -0000
Content-Type: text/plain

This patchset contains the RTOS patches with c6x big endian support descoped and is needed for use with sysbios 6.76.02.02

Mahesh Radhakrishnan (1):
  fftlib: SRCREV update

 meta-arago-extras/recipes-ti/fftlib/fftlib.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


