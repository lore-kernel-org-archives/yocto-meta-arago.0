Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 626C552AF4
	for <meta-arago@arago-project.org>;
	Fri,  9 Jul 2021 18:03:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169I44UY050913;
	Fri, 9 Jul 2021 13:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625853844;
	bh=inr10D5Y2gXFytzhzYj+NwQhir1xUuRWr0Mdv33ZN5g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fste7WylfHAzR+D6q40jAa1JaUCpnWd8PhOnacD1GI7OehVJl1Qz/gmpffjjgzx9s
	NMsCVqIwkWZ1gYHcHNSHIB5ENCmpjNZF4XF4yEoFmyM/zalqagXfSK6k0OU/lc+VZG
	x0BjncPqUHQXNxUF92JDcHrGOTu7kIEoZRIiKB74=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169I44qq083515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 9 Jul 2021 13:04:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169I44HY066570;
	Fri, 9 Jul 2021 13:04:04 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Date: Fri, 9 Jul 2021 13:04:00 -0500
Message-ID: <20210709180401.2977-5-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709180401.2977-1-nm@ti.com>
References: <20210709180401.2977-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [tisdk-build-scripts PATCH 4/5] config-build-env: Make sure that the git url points correctly
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
X-List-Received-Date: Fri, 09 Jul 2021 18:03:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make sure that the build scripts git url points to the correct location.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 lib/oesdk/config-build-env | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 885fbcfb50d9..cdfa6830eb51 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -47,6 +47,14 @@ checkout_layer_scripts() {
     else
         # This looks to be a git repo.  Hopefully it is the right one :)
         cd $BUILD_ROOT
+	# In case we have changed the location of our build scripts
+	# we should change our git url towards it.
+        mygit='git remote get-url  origin'
+        if [ "$mygit" != "$TI_SDK_OELAYER_SETUP"]; then
+            echo "$TI_SDK_OELAYER_SETUP Mismatch in git URL: $mygit vs $TI_SDK_OELAYER_SETUP. Force resetting the origin!"
+            git remote set-url origin $TI_SDK_OELAYER_SETUP
+        fi
+
         git fetch
         git reset --hard origin
     fi
-- 
2.32.0


