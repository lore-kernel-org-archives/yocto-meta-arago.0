Return-Path: <manishalocal@uda0393239>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5D47E529E6
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 20:25:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3KOq8k117596
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543868692;
	bh=bDCBCUQ0uflTHjQbNnSXw+hjT0Un/pUuYaf56Cf7jUQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SQiBSficS+fKbjBiu8J23+7wfreL9a/WpzzBzDdD5ZffVjnzHcS2UYJ/HHixfRii3
	MkA2uzgfCERl7/9hqxKHAsfJ2YvkEODlSKmiZ42jG1tBVvMGko+GDan33rpj4nRx7q
	LlTLBXiMxjMVfb0gFFUXsbDILIos4OomD2/gGrFg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3KOqoB098037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:52 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 14:24:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 3 Dec 2018 14:24:51 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB3KOpxX012828;
	Mon, 3 Dec 2018 14:24:51 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gTulv-0007AW-Ik; Mon, 03 Dec 2018 14:24:51 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Dec 2018 14:24:38 -0600
Message-ID: <20181203202440.27508-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181203202440.27508-1-manisha.agrawal@ti.com>
References: <20181203202440.27508-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v1 3/5] arago-source-ipk: add mmwavegesture-hmi source ipk
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
X-List-Received-Date: Mon, 03 Dec 2018 20:25:05 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 0ec31388..d9582686 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -73,6 +73,9 @@ SRCIPK_INSTALL_DIR_pn-evse-hmi = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-protection-relays-hmi = "1"
 SRCIPK_INSTALL_DIR_pn-protection-relays-hmi = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-mmwavegesture-hmi = "1"
+SRCIPK_INSTALL_DIR_pn-mmwavegesture-hmi = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-image-gallery = "1"
 SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
 
-- 
2.13.0


