Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 90FC752AF6
	for <meta-arago@arago-project.org>;
	Fri,  9 Jul 2021 18:03:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169I44aO107453;
	Fri, 9 Jul 2021 13:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625853844;
	bh=gc/Ddxj2MBgLZLZWnfhyQutsjlpz8/K7qjw14LtmTLY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=auuWXQOdTFXdRKM4iWHIfVXtH5W8UyCsfPs9IvdjWSL2FxAP5kBqYZgYIFCK/ztcm
	CpWRseB0i9ITQUAOML4aj/dsRlT4UR0xUmBMWBv7T6Txdjg+Q94anTqx9hzyxQAWdV
	t0idYL9so5ne6NHvnncuniK+BdZ4LJbNsuK8fGJk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169I439g087113
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 9 Jul 2021 13:04:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169I4484128601;
	Fri, 9 Jul 2021 13:04:04 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Date: Fri, 9 Jul 2021 13:03:58 -0500
Message-ID: <20210709180401.2977-3-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709180401.2977-1-nm@ti.com>
References: <20210709180401.2977-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [tisdk-build-scripts PATCH 2/5] config-build-env: Lets make sure we are really in a build folder
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
X-List-Received-Date: Fri, 09 Jul 2021 18:04:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets make sure that we are really in a build folder if for some
reason we end up at a top layer script issue and we mess up the build
machine.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 lib/oesdk/config-build-env | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 11fab2de6097..058823562693 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -21,6 +21,13 @@ checkout_layer_scripts() {
 
     name=`basename $BUILD_ROOT`
 
+    # Paranoid check: Am I really a build folder?
+    amibuild=`echo $BUILD_ROOT|grep "build$"`
+    if [ -z "$amibuild" ]; then
+        echo "Something horrible has happened.. BUILD_ROOT=$BUILD_ROOT does'nt end with 'build'. maynot be build folder. Aborting!"
+        exit 1
+    fi
+
     if [ ! -d $name ]
     then
         git clone "$TI_SDK_OELAYER_SETUP" $name
-- 
2.32.0


