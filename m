Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DEF4752A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:51:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KpFYH012493
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504299075;
	bh=EJiM5eDzgkLFLSmqoeniMqxmxHIrVrRptV0hGiR6Ibg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=feBTNiO3oDWL4ISeMHnG3HCVRcjunGHrZjnLIRv+iSlRtqY1kX4MEjyMmcqusu4EH
	A9+feget2a9NC7untiH4Mj3Vy72gSnKI3FnJe+BQX5onsPzWtPQhQtEvv3BclSsFWV
	Lp2lRElE1iN8ngo9GmS5buecVnuLu/0c/ZB3wsHw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KpA44030745
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:51:10 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:51:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:51:09 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81Kp9Zi000576;
	Fri, 1 Sep 2017 15:51:09 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsuD-0006dY-Jl; Fri, 01 Sep 2017 15:51:09 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:51:05 -0500
Message-ID: <20170901205107.25462-4-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901205107.25462-1-manisha.agrawal@ti.com>
References: <20170901205107.25462-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v1 4/6] packagegroup-arago-tisdk-matrix : add protection-relays-hmi demo
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
X-List-Received-Date: Fri, 01 Sep 2017 20:51:25 -0000
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


