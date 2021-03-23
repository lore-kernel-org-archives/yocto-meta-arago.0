Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 28D8952A25
	for <meta-arago@arago-project.org>;
	Tue, 23 Mar 2021 14:51:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NEpZuJ096293;
	Tue, 23 Mar 2021 09:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616511095;
	bh=gjTkQAEvhWVXHdTBsoM4i3gieaaynE8QCIR341C4/KI=;
	h=From:To:CC:Subject:Date;
	b=xsU1ST8MdNam6tar+0HFEIYnEKkRSyPs70VWiXBuHwT4lheWnQC672YKI6mVoM8IH
	87qnJZ9TI5G6OJsSinzhRVdy4Qh5bzV7O32ehr3v8y2conFo9+S/Vs++oRtvvV3dzj
	sIHarIBjjO+Ysq7QAPyE9LrrXoP/ZezwkP5m6uCA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NEpZb5050095
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Mar 2021 09:51:35 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 23 Mar 2021 09:51:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 23 Mar 2021 09:51:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NEpZmI011471;
	Tue, 23 Mar 2021 09:51:35 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>
Date: Tue, 23 Mar 2021 09:51:33 -0500
Message-ID: <20210323145133.9940-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master][PATCH] layer.conf: Add hardknott to compatible release branches
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
X-List-Received-Date: Tue, 23 Mar 2021 14:51:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This follows commit cfe3f78 ("layer.conf: add hardknott to compatible
release branches") from meta-ti.

While we are at it, remove old releases before dunfell as we no longer
support the build of such configurations.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

WARNING: there is a bunch of work to do to move to gatesgarth /
hardknott .. https://pastebin.ubuntu.com/p/kKCqXvnDKf/

but this allows us to get started, I think.

 meta-arago-distro/conf/layer.conf | 2 +-
 meta-arago-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 2931bf9daf4a..1fa61207fe01 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
 
-LAYERSERIES_COMPAT_meta-arago-distro = "sumo thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arago-distro = "dunfell gatesgarth hardknott"
 
 LAYERDEPENDS_meta-arago-distro = " \
     core \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 7e3081b20ba8..d64a80f8890f 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
 BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-extras = "10"
 
-LAYERSERIES_COMPAT_meta-arago-extras = "sumo thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arago-extras = "dunfell gatesgarth hardknott"
 
 # Set a variable to get to the top of the metadata location
 ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
-- 
2.31.0


