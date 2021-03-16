Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 0D6DE529B7
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 17:08:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GH90iR105091;
	Tue, 16 Mar 2021 12:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615914540;
	bh=PSi060Fxa89iI5UZL0fdKBH2VpiGbQyaKfwym8JX/n4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VusfryXqtqs+Ec4Nk7RR7TNdpiJyJug7dqUyIz7FzewLGi8v8xJd5wxC+OitPhaHL
	JyQmzF+K6VVsDL9kGVSA0AACUMriev69NXhRayM1SBW8f7qm4/MDb7shQ6fV6Bmvaa
	s7W8mhc6FJy30pcJxUK3Rw33r7Z9CLpvClB3wZAw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GH900K076570
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Mar 2021 12:09:00 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 16 Mar 2021 12:08:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 16 Mar 2021 12:08:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GH8xYc011567;
	Tue, 16 Mar 2021 12:08:59 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
Date: Tue, 16 Mar 2021 12:08:57 -0500
Message-ID: <20210316170857.9547-3-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
In-Reply-To: <20210316170857.9547-1-nm@ti.com>
References: <20210316170857.9547-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup][PATCH 2/2] Revert "arago-dunfell: Pin all layers to last known good build SHA"
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
X-List-Received-Date: Tue, 16 Mar 2021 17:08:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit 3e3b838e5cee047251fa97842509de70d1d5b42f.

Now that we dont have an issue with upstream dunfell, switch to bleeding
edge of dunfell

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 configs/arago-dunfell-config.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index b82c0d79f306..b45ee3e026df 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,92cd3467502bd27b98a76862ca6525ce425a8479,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,f2d02cb71eaff8eb285a1997b30be52486c160ae,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,72431ee8de5e3a53d259cebf420a7713ac9e1f14,layers=meta
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.25.1.377.g2d2118b814c1


