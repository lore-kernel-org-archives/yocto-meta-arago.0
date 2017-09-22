Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id AE56F52A69
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 19:34:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MJYQ7F031478
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506108866;
	bh=EJiM5eDzgkLFLSmqoeniMqxmxHIrVrRptV0hGiR6Ibg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O1zISqJUIkjDjbWWgM8NrAi0hwDIglf1BDOTvEtS0ITtPENZxFkEZtWW5s9+Dhi5y
	rjRFO5vNmer/v1KJZfell48dP7i/aE9IYYv3tBmdOGtWf43Ou/uq5SdC3VON036L1j
	W1taHjFB8yN10lswJ06cm6NI/312CjcQb+hToGl8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJYLqr023499
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:34:21 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 14:34:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 14:34:21 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJYLEN031509;
	Fri, 22 Sep 2017 14:34:21 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dvTiP-0000Qd-C0; Fri, 22 Sep 2017 14:34:21 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Sep 2017 14:34:15 -0500
Message-ID: <20170922193417.1595-4-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170922193417.1595-1-manisha.agrawal@ti.com>
References: <20170922193417.1595-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v2 4/6] packagegroup-arago-tisdk-matrix : add protection-relays-hmi demo
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
X-List-Received-Date: Fri, 22 Sep 2017 19:34:36 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 0fa50f85..027cbe5d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -96,6 +96,7 @@ MATRIX_APPS_append_ti33x = "        \
     matrix-gui-ethernet-demos       \
                                     \
     matrix-hmi-demo-evse            \
+    matrix-hmi-demo-protection-relays \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
-- 
2.13.0


