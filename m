Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 11351529D0
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 20:19:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEKJH7v058613
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 14:19:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544818757;
	bh=CDz2jad07T5Qf+gbN5I1uAdxCn/zlnAe0scrx/CfyK0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RJ7W7NzrQJ7OpJmvriPrsNczA7k5ffbW+cjT3ouBvxM0q1duKviHjMxKJ5gDJ5E13
	bh8ItHtsKc9XsI47UgjLqgrO01eVVFlR3cqTi+b9qdvV4NI4CfdCgulU7tjSNJQ+nq
	+0ibqb/VzJd1CO1iTRjnWo6/PlPY7MerwiuBVH9s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEKJH66070085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 14:19:17 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 14:19:17 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 14:19:17 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEKJHrW009682;
	Fri, 14 Dec 2018 14:19:17 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXtvY-00043B-Sj; Fri, 14 Dec 2018 14:19:16 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 14:19:12 -0600
Message-ID: <20181214201912.15528-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181214201912.15528-1-manisha.agrawal@ti.com>
References: <20181214201912.15528-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v1 2/2] packagegroup-arago-tisdk-hmi : add mmwavegesture-hmi demo
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
X-List-Received-Date: Fri, 14 Dec 2018 20:19:30 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb     | 7 +++++++
 1 file changed, 7 insertions(+)

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


