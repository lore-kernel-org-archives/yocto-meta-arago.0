Return-Path: <x0038811@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A5EE152A4C
	for <meta-arago@arago-project.org>;
	Thu, 21 Feb 2019 09:18:53 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1L9Ip0V027379
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550740731;
	bh=Wk14nXdUc+shepnifVBiJe1AJx8p5WC2h6ktJW6oqG0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q01e/6ySbdu/I5zbrDe0bM3O9GHQkryWb9cBRxHxISOEBovpkbTNAClTXcAk69IJl
	ULC9Wc6kchK/bLslNOaJx1T00i8Ef/fi16CB/pQ6dFHls01tulqUdRSSbHjW18O/XV
	r/uxZsyhdG/xdcyDuDoiC+4LYZ6Y0hVWKdfPqzy8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1L9IpxG080463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:51 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 21 Feb 2019 03:18:50 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 21 Feb 2019 03:18:50 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1L9IdpM009115;
	Thu, 21 Feb 2019 03:18:50 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Feb 2019 14:48:23 +0530
Message-ID: <1550740703-19443-9-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550740703-19443-1-git-send-email-x0038811@ti.com>
References: <1550740703-19443-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master 8/8] branding-core: Re-enable mmip
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
X-List-Received-Date: Thu, 21 Feb 2019 09:18:57 -0000
Content-Type: text/plain

Multimedia is re-enabled as gstreamer 1.14 compilation
issues are resolved.

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 07cde67..8ed51c4 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -12,10 +12,6 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
 
-# Temporarily disable "mmip" machine feature for all SOCs while building
-# latest code base, until it is fixed for gstreamer > 1.10
-MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
-
 # Temporarily disable "dsp" machine feature for all SOCs while building
 # latest code base, until it is fixed for gdbc6x, qt-openvc-opencl
 MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('dsp', '')}"
-- 
1.9.1


