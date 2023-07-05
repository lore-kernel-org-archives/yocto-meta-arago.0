Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739EDC001DB
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 13:09:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.16513.1688562578234163618
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 06:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xTpvyDep;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-luthra@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365D9b8f066243;
	Wed, 5 Jul 2023 08:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688562577;
	bh=pq3NU2HA/LqHtqFhvkvzEXga6B7b6l0LfW7gSfDLk10=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xTpvyDepXzB90VtbSsyAfDQg1Pu/05W+U2RkJcxatL3scF+tqjGHnx2ajPkUzMSsr
	 qw41tniBtbZz94FEAYrCDFWBP6kXdP3xDOlpJIbR/f+Qzb2JZEHQ678K91p/C4iNqF
	 JQHuF22ycAapVcu1joW9m4rwGhWNqOuUR9NgAfAQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365D9bm9108467
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 08:09:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 08:09:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 08:09:36 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365D9aRD061396;
	Wed, 5 Jul 2023 08:09:36 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Chirag
 Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH 3/3] meta-arago-distro: Package libcamera in tisdk
Date: Wed, 5 Jul 2023 18:39:28 +0530
Message-ID: <20230705130928.1201894-3-j-luthra@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705130928.1201894-1-j-luthra@ti.com>
References: <20230705130928.1201894-1-j-luthra@ti.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=j-luthra@ti.com; h=from:subject; bh=teFO1gnM9rHY9eC6D/ad3mGibdqLXx3Fw9fTuQPOe/k=; b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkpWtfu0A+oDKoGPCKD0uT4tYoJ64OLi71i0CTt 9sL0/cpFzSJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZKVrXwAKCRBD3pH5JJpx RYKwD/9Lccr0CI5LUo1BJuYHemt3MD7sQMqrPn8b4ORvTJK64IqhraVqS7SAzpYVd1vG+Nu8yYD fZ9RwDsRH4tH4fyPLHZnU75HRWMiKay9pZHflYpwOV3bJf7Qlb2l6IN53BpNutNV2iG87w1rakR MRagaSUc0coYBlCX3qN5VhEd7ff165FPb+y6P5y9pgoyFxJrZb+Kiy12d8tNCpFEACQvEam88EE tJ7RNalluVZVZUhz/qE6vmmD9y5WXFfXzkGE2+MGN4GpUzT8hn5I+F7xIZHT+9oB+U5nyQMysJd UFt8vTkixCc1HM8lv8TJxeSYwHXle1xSIEofyIPQyi3mTdsRITzCKv8lCfTODOIjBrcg0k9cU6c FAn4eWw0sW7SucOQULKixMw03zn8RTFZkW0YfDEPU42Ki87zyigcU9gLTC8oIC4IoyLxw1KkYCM 9o3GXjCbnbQB2ILv4Iyovrd6nklui6xrhV77LGdeu+VpB1mFxFDsZS4+Oilz05mroUwzYvSmZQt d/H8lXiW66K662oHbzaXmuDTctmfUGjFzp+VsF8u5c7aHiJPVAHal9grTzo2YKjWWqYzobqEzqo 3a4sZSwlwgeo/9KTafD869+InT2piUGnIfTClomXxXbuLnv+TIgh1/5e907kTobqrDa6jFyXC0R 46VprzSWZZqgCbg!
 ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp; fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Jul 2023 13:09:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14748

Libcamera is useful for testing simple camera pipelines, without
requiring manual configuration of media graph for all v4l2-subdevs.

Enable it for TISDK images, along with the optional libcamerasrc
gstreamer plugin package.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                       | 3 +++
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb       | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index e0087ab7..bb074478 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -128,6 +128,9 @@ PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
 # Enable kmssink in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
 
+# Enable gstreamer plugin for libcamera
+PACKAGECONFIG:append:pn-libcamera = " gst"
+
 # Disable pulseaudio routing in alsa by default
 PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index d06fbb6f..b4148882 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -8,6 +8,8 @@ inherit packagegroup
 
 MULTIMEDIA = " \
     amsdk-av-files \
+    libcamera \
+    libcamera-gst \
 "
 
 MULTIMEDIA:omapl138 = ""
-- 
2.41.0


