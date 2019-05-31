Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 2F65652092
	for <meta-arago@arago-project.org>;
	Fri, 31 May 2019 17:48:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VHmBlU006423
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559324891;
	bh=U1Zf5UF6+ItYQByDlat4gEnQwMcENyEEkqGjRWRR7kE=;
	h=From:To:Subject:Date;
	b=nGZn/6OAZu4kEScHbRK9Gae/Ko3H/T9vG1CTaYb8HQWb6jcmizsIMM52XWqnrxso0
	MnUzvT0nNkTuJtkqVjOxzZd1QVAgLBdkyBXwPH6r2nKO5GPt8DONdJx4Y3Kjy+D1RP
	20zw/f5EQk2SawsCC3qiMmjhUOBYD7D6s2zO8RLc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VHmB0l039807
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 31 May 2019 12:48:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 31 May 2019 12:48:11 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VHmANL118948
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:10 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 May 2019 13:47:51 -0400
Message-ID: <20190531174754.42586-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 0/3] Non-sgx build cleanup
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
X-List-Received-Date: Fri, 31 May 2019 17:48:48 -0000
Content-Type: text/plain

-enable AM5/6 support
-Remove obsolete components and recipes


Eric Ruei (3):
  tisdk-roofs-image: add packagegroup-arago-tisdk-graphics
    unconditionally
  packagegroup-arago-qte: remove qtquick1 components
  ti-sgx-ddk-um: remove unused file

 recipes-core/images/tisdk-rootfs-image.bbappend           | 8 +++++++-
 .../packagegroups/packagegroup-arago-qte.bbappend         | 4 ++--
 .../packagegroups/packagegroup-arago-tisdk-qte.bbappend   | 4 ++--
 .../libgles/ti-sgx-ddk-um_1.14.3699939.bbappend           | 4 ----
 4 files changed, 11 insertions(+), 9 deletions(-)
 delete mode 100644 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend

-- 
2.17.1


