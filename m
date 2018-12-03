Return-Path: <manishalocal@uda0393239>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 09FC7529D6
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 20:25:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3KOqgr058950
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543868692;
	bh=xDlqwgVeeqcZjwtXjTrbNnnCMJc6StRLWXhFC8V4Ack=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Wjr5s+IjSEMOJ67eQO//DgQIV9nFTAz62sjBBMBnMCnMXkvcegZCZkVhrvIlgeMJ5
	t0rXYyBShk4QdB7weotZaVGPF4+jgv5pxAaTN/8YhwQorb7GmWKEp7rX2rf55Wt95v
	egH8m5GmaUuW02qei9xCvM5ZDQdd5Xevzui8dpkM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3KOpe4071912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:52 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 14:24:51 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 3 Dec 2018 14:24:51 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB3KOpII018176;
	Mon, 3 Dec 2018 14:24:51 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gTulv-0007AS-FC; Mon, 03 Dec 2018 14:24:51 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Dec 2018 14:24:37 -0600
Message-ID: <20181203202440.27508-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181203202440.27508-1-manisha.agrawal@ti.com>
References: <20181203202440.27508-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v1 2/5] package-group-arago-tisdk-hmi* : add mmwavegesture-hmi application
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
X-List-Received-Date: Mon, 03 Dec 2018 20:25:04 -0000
Content-Type: text/plain

Demonstration application is added to the AM335x, AM437x, AM57x and
AM654x devices.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb         | 4 ++++
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb     | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index dd3407d6..1399690b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -10,20 +10,24 @@ HMI = ""
 
 HMI_append_ti43x = " \
     evse-hmi-src \
+    mmwavegesture-hmi-src \
 "
 
 HMI_append_ti33x = " \
     evse-hmi-src \
     protection-relays-hmi-src \
+    mmwavegesture-hmi-src \
 "
 
 
 HMI_append_omap-a15 = " \
     evse-hmi-src \
+    mmwavegesture-hmi-src \
 "
 
 HMI_append_k3 = " \
     evse-hmi-src \
+    mmwavegesture-hmi-src \
 "
 
 RDEPENDS_${PN} = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
index 125443ae..74dbcd7b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -13,16 +13,23 @@ HMI = " \
 HMI_append_ti33x = " \
     evse-hmi \
     protection-relays-hmi \
+    mmwavegesture-hmi \
 "
 
 HMI_append_ti43x = " \
     evse-hmi \
+    mmwavegesture-hmi \
 "
 
 HMI_append_omap-a15 = " \
     evse-hmi \
+    mmwavegesture-hmi \
 "
 
+HMI_append_k3 = " \
+    evse-hmi \
+    mmwavegesture-hmi \
+"
 
 RDEPENDS_${PN} = "\
 	${HMI} \
-- 
2.13.0


