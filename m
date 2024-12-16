Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FD8E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 14:53:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.58337.1734360816855095746
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 06:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lhBL4N/C;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGErZP73562441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 08:53:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734360815;
	bh=2Dk8RqtYmrBXvZ7QXz7ZhWYuWayjbFPoICgjs2ars2Y=;
	h=From:To:Subject:Date;
	b=lhBL4N/CsY2eGOgj4ERbE75fkm1K6RBbXdkPTH2o/BRTfv1dJPSOF2m6qDETO+JjD
	 wDFaCiz3e6L7TVZxKEUzBv2yhSgbdE2WYo3ZcIguK/n7RfKymbidBJnHHOW/fZSIVv
	 C7uOIzyDuRiziMlvMoypwJY992rEvkDGBHsYCXjU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGErZHe052684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Dec 2024 08:53:35 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 08:53:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 08:53:35 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGErZCq079072;
	Mon, 16 Dec 2024 08:53:35 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tNCTX-0002ap-7K; Mon, 16 Dec 2024 08:53:35 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] xslt/bitbake-setup: Fix branch of oe-layersetup
Date: Mon, 16 Dec 2024 08:53:35 -0600
Message-ID: <20241216145335.9928-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Dec 2024 14:53:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15661

The branch was set to wip for testing and we forgot to update the branch
to master once testing was complete.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/arago-kirkstone-chromium-config.json              | 2 +-
 bitbake-setup/arago-kirkstone-config.json                       | 2 +-
 bitbake-setup/arago-kirkstone-next-config.json                  | 2 +-
 bitbake-setup/arago-kirkstone-wip-config.json                   | 2 +-
 bitbake-setup/arago-master-chromium-config.json                 | 2 +-
 bitbake-setup/arago-master-config.json                          | 2 +-
 bitbake-setup/arago-master-next-config.json                     | 2 +-
 bitbake-setup/arago-master-selinux-config.json                  | 2 +-
 bitbake-setup/arago-master-wip-config.json                      | 2 +-
 bitbake-setup/arago-scarthgap-chromium-config.json              | 2 +-
 bitbake-setup/arago-scarthgap-config.json                       | 2 +-
 bitbake-setup/arago-scarthgap-next-config.json                  | 2 +-
 bitbake-setup/arago-scarthgap-selinux-config.json               | 2 +-
 bitbake-setup/arago-scarthgap-wip-config.json                   | 2 +-
 bitbake-setup/coresdk_coresdk-09.00.00.006-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.00.00.007-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.00.00.011-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.01.00.001-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.01.00.003-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.01.00.007-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.01.00.008-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.02.00.008-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.02.00.009-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.02.00.010-config.json          | 2 +-
 bitbake-setup/coresdk_coresdk-09.03.05-config.json              | 2 +-
 bitbake-setup/coresdk_coresdk-10.00.07-config.json              | 2 +-
 bitbake-setup/coresdk_coresdk-10.01.08-config.json              | 2 +-
 bitbake-setup/coresdk_coresdk-10.01.10-config.json              | 2 +-
 bitbake-setup/distroless-kirkstone-config.json                  | 2 +-
 bitbake-setup/distroless-master-config.json                     | 2 +-
 bitbake-setup/distroless-scarthgap-config.json                  | 2 +-
 bitbake-setup/poky-kirkstone-config.json                        | 2 +-
 bitbake-setup/poky-master-config.json                           | 2 +-
 bitbake-setup/poky-master-wip-config.json                       | 2 +-
 bitbake-setup/poky-scarthgap-config.json                        | 2 +-
 ...r-sdk-analytics_processor-sdk-analytics-09.00.00-config.json | 2 +-
 ...r-sdk-analytics_processor-sdk-analytics-09.00.01-config.json | 2 +-
 ...r-sdk-analytics_processor-sdk-analytics-09.01.00-config.json | 2 +-
 ...r-sdk-analytics_processor-sdk-analytics-09.02.00-config.json | 2 +-
 ...r-sdk-analytics_processor-sdk-analytics-10.00.00-config.json | 2 +-
 .../processor-sdk-linux_processor-sdk-gateway-10_00.json        | 2 +-
 .../processor-sdk-linux_processor-sdk-linux-09_00_00_06.json    | 2 +-
 .../processor-sdk-linux_processor-sdk-linux-09_00_00_07.json    | 2 +-
 .../processor-sdk-linux_processor-sdk-linux-09_01_00_06.json    | 2 +-
 .../processor-sdk-linux_processor-sdk-linux-09_01_00_07.json    | 2 +-
 .../processor-sdk-linux_processor-sdk-linux-09_02_00_04.json    | 2 +-
 .../processor-sdk-linux_processor-sdk-linux-09_02_00_05.json    | 2 +-
 .../processor-sdk-linux_processor-sdk-linux-10_00_07_06.json    | 2 +-
 .../processor-sdk-linux_processor-sdk-linux-10_00_08_06.json    | 2 +-
 .../processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json  | 2 +-
 bitbake-setup/processor-sdk_processor-sdk-09.00.00-config.json  | 2 +-
 .../processor-sdk_processor-sdk-09.01.00-am65xx-config.json     | 2 +-
 bitbake-setup/processor-sdk_processor-sdk-09.01.00-config.json  | 2 +-
 .../processor-sdk_processor-sdk-09.01.00-legacy-config.json     | 2 +-
 .../processor-sdk_processor-sdk-09.02.00.08-am64x-config.json   | 2 +-
 .../processor-sdk_processor-sdk-09.03.05.02-legacy-config.json  | 2 +-
 ...rocessor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json | 2 +-
 ...rocessor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json | 2 +-
 ...sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json | 2 +-
 ...sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json | 2 +-
 ...rocessor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json | 2 +-
 ...sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json | 2 +-
 kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml   | 1 +
 src/xslt/bitbake-setup.xslt                                     | 2 +-
 64 files changed, 64 insertions(+), 63 deletions(-)

diff --git a/bitbake-setup/arago-kirkstone-chromium-config.json b/bitbake-setup/arago-kirkstone-chromium-config.json
index 1ca5b5a..977b95d 100644
--- a/bitbake-setup/arago-kirkstone-chromium-config.json
+++ b/bitbake-setup/arago-kirkstone-chromium-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-kirkstone-config.json b/bitbake-setup/arago-kirkstone-config.json
index 2ae277f..4921baf 100644
--- a/bitbake-setup/arago-kirkstone-config.json
+++ b/bitbake-setup/arago-kirkstone-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-kirkstone-next-config.json b/bitbake-setup/arago-kirkstone-next-config.json
index f52706f..0865573 100644
--- a/bitbake-setup/arago-kirkstone-next-config.json
+++ b/bitbake-setup/arago-kirkstone-next-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-kirkstone-wip-config.json b/bitbake-setup/arago-kirkstone-wip-config.json
index 4c47186..99cca73 100644
--- a/bitbake-setup/arago-kirkstone-wip-config.json
+++ b/bitbake-setup/arago-kirkstone-wip-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-master-chromium-config.json b/bitbake-setup/arago-master-chromium-config.json
index 0ae8a76..29deaa9 100644
--- a/bitbake-setup/arago-master-chromium-config.json
+++ b/bitbake-setup/arago-master-chromium-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-master-config.json b/bitbake-setup/arago-master-config.json
index f9232e9..4881f08 100644
--- a/bitbake-setup/arago-master-config.json
+++ b/bitbake-setup/arago-master-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-master-next-config.json b/bitbake-setup/arago-master-next-config.json
index 7ed1751..1b9238d 100644
--- a/bitbake-setup/arago-master-next-config.json
+++ b/bitbake-setup/arago-master-next-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-master-selinux-config.json b/bitbake-setup/arago-master-selinux-config.json
index a06000f..27f049c 100644
--- a/bitbake-setup/arago-master-selinux-config.json
+++ b/bitbake-setup/arago-master-selinux-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-master-wip-config.json b/bitbake-setup/arago-master-wip-config.json
index 79a2aa2..42885ed 100644
--- a/bitbake-setup/arago-master-wip-config.json
+++ b/bitbake-setup/arago-master-wip-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-scarthgap-chromium-config.json b/bitbake-setup/arago-scarthgap-chromium-config.json
index ddbe225..ad18b57 100644
--- a/bitbake-setup/arago-scarthgap-chromium-config.json
+++ b/bitbake-setup/arago-scarthgap-chromium-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-scarthgap-config.json b/bitbake-setup/arago-scarthgap-config.json
index acc15e2..d732a67 100644
--- a/bitbake-setup/arago-scarthgap-config.json
+++ b/bitbake-setup/arago-scarthgap-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-scarthgap-next-config.json b/bitbake-setup/arago-scarthgap-next-config.json
index 9fc1613..fa2fdfe 100644
--- a/bitbake-setup/arago-scarthgap-next-config.json
+++ b/bitbake-setup/arago-scarthgap-next-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-scarthgap-selinux-config.json b/bitbake-setup/arago-scarthgap-selinux-config.json
index 3cfb0dc..304cf22 100644
--- a/bitbake-setup/arago-scarthgap-selinux-config.json
+++ b/bitbake-setup/arago-scarthgap-selinux-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/arago-scarthgap-wip-config.json b/bitbake-setup/arago-scarthgap-wip-config.json
index f49791a..4c6d8ce 100644
--- a/bitbake-setup/arago-scarthgap-wip-config.json
+++ b/bitbake-setup/arago-scarthgap-wip-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.00.00.006-config.json b/bitbake-setup/coresdk_coresdk-09.00.00.006-config.json
index b7e5df6..4a577ff 100644
--- a/bitbake-setup/coresdk_coresdk-09.00.00.006-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.00.00.006-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.00.00.007-config.json b/bitbake-setup/coresdk_coresdk-09.00.00.007-config.json
index 467d24a..4e0637c 100644
--- a/bitbake-setup/coresdk_coresdk-09.00.00.007-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.00.00.007-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.00.00.011-config.json b/bitbake-setup/coresdk_coresdk-09.00.00.011-config.json
index 17b8635..ebe82de 100644
--- a/bitbake-setup/coresdk_coresdk-09.00.00.011-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.00.00.011-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.01.00.001-config.json b/bitbake-setup/coresdk_coresdk-09.01.00.001-config.json
index 9b0c9ef..9e53b3a 100644
--- a/bitbake-setup/coresdk_coresdk-09.01.00.001-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.01.00.001-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.01.00.003-config.json b/bitbake-setup/coresdk_coresdk-09.01.00.003-config.json
index 04221a1..6934a0d 100644
--- a/bitbake-setup/coresdk_coresdk-09.01.00.003-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.01.00.003-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.01.00.007-config.json b/bitbake-setup/coresdk_coresdk-09.01.00.007-config.json
index ad5728e..74fd9cc 100644
--- a/bitbake-setup/coresdk_coresdk-09.01.00.007-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.01.00.007-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.01.00.008-config.json b/bitbake-setup/coresdk_coresdk-09.01.00.008-config.json
index 541f25e..631d6cf 100644
--- a/bitbake-setup/coresdk_coresdk-09.01.00.008-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.01.00.008-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.02.00.008-config.json b/bitbake-setup/coresdk_coresdk-09.02.00.008-config.json
index a5aab79..e0ef11c 100644
--- a/bitbake-setup/coresdk_coresdk-09.02.00.008-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.02.00.008-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.02.00.009-config.json b/bitbake-setup/coresdk_coresdk-09.02.00.009-config.json
index 6d9b9a6..529c2df 100644
--- a/bitbake-setup/coresdk_coresdk-09.02.00.009-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.02.00.009-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.02.00.010-config.json b/bitbake-setup/coresdk_coresdk-09.02.00.010-config.json
index 6943852..99d9ae1 100644
--- a/bitbake-setup/coresdk_coresdk-09.02.00.010-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.02.00.010-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-09.03.05-config.json b/bitbake-setup/coresdk_coresdk-09.03.05-config.json
index c3f1422..45df6f7 100644
--- a/bitbake-setup/coresdk_coresdk-09.03.05-config.json
+++ b/bitbake-setup/coresdk_coresdk-09.03.05-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-10.00.07-config.json b/bitbake-setup/coresdk_coresdk-10.00.07-config.json
index e2a23dc..2564285 100644
--- a/bitbake-setup/coresdk_coresdk-10.00.07-config.json
+++ b/bitbake-setup/coresdk_coresdk-10.00.07-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-10.01.08-config.json b/bitbake-setup/coresdk_coresdk-10.01.08-config.json
index 685ab63..7fb45d7 100644
--- a/bitbake-setup/coresdk_coresdk-10.01.08-config.json
+++ b/bitbake-setup/coresdk_coresdk-10.01.08-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/coresdk_coresdk-10.01.10-config.json b/bitbake-setup/coresdk_coresdk-10.01.10-config.json
index dbd156c..6a1a840 100644
--- a/bitbake-setup/coresdk_coresdk-10.01.10-config.json
+++ b/bitbake-setup/coresdk_coresdk-10.01.10-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/distroless-kirkstone-config.json b/bitbake-setup/distroless-kirkstone-config.json
index a1e2090..b0ca7e7 100644
--- a/bitbake-setup/distroless-kirkstone-config.json
+++ b/bitbake-setup/distroless-kirkstone-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/distroless-master-config.json b/bitbake-setup/distroless-master-config.json
index 3f43de1..1479e27 100644
--- a/bitbake-setup/distroless-master-config.json
+++ b/bitbake-setup/distroless-master-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/distroless-scarthgap-config.json b/bitbake-setup/distroless-scarthgap-config.json
index ca73e99..bc34f7f 100644
--- a/bitbake-setup/distroless-scarthgap-config.json
+++ b/bitbake-setup/distroless-scarthgap-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/poky-kirkstone-config.json b/bitbake-setup/poky-kirkstone-config.json
index 3482e69..f577d85 100644
--- a/bitbake-setup/poky-kirkstone-config.json
+++ b/bitbake-setup/poky-kirkstone-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/poky-master-config.json b/bitbake-setup/poky-master-config.json
index a504ef2..7e99bd4 100644
--- a/bitbake-setup/poky-master-config.json
+++ b/bitbake-setup/poky-master-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/poky-master-wip-config.json b/bitbake-setup/poky-master-wip-config.json
index 6b36d59..063df20 100644
--- a/bitbake-setup/poky-master-wip-config.json
+++ b/bitbake-setup/poky-master-wip-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/poky-scarthgap-config.json b/bitbake-setup/poky-scarthgap-config.json
index 81c7f61..7d4cb50 100644
--- a/bitbake-setup/poky-scarthgap-config.json
+++ b/bitbake-setup/poky-scarthgap-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json
index 9ea8929..a371d64 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.00-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json
index e297fef..f6a90fc 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json
+++ b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.00.01-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json
index 12fccda..880511e 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.01.00-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json
index 86c66d6..edf3114 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-09.02.00-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json
index cb9d341..c8979db 100644
--- a/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics_processor-sdk-analytics-10.00.00-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-gateway-10_00.json b/bitbake-setup/processor-sdk-linux_processor-sdk-gateway-10_00.json
index e52a127..0496660 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-gateway-10_00.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-gateway-10_00.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_06.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_06.json
index 7784653..27b1c73 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_06.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_06.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_07.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_07.json
index cafe87a..1b65b00 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_07.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_00_00_07.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_06.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_06.json
index 853f6ed..df3bf13 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_06.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_06.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_07.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_07.json
index 1957d1b..b349a19 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_07.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_01_00_07.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_04.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_04.json
index 5862b37..f90a776 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_04.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_04.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_05.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_05.json
index 64ad14d..ae0d18a 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_05.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-09_02_00_05.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_07_06.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_07_06.json
index 746a9ca..0f49f93 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_07_06.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_07_06.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_08_06.json b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_08_06.json
index e54895c..213b129 100644
--- a/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_08_06.json
+++ b/bitbake-setup/processor-sdk-linux_processor-sdk-linux-10_00_08_06.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json b/bitbake-setup/processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json
index c8751e3..55ba7a4 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-09.00.00-am62xxsip-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.00.00-config.json b/bitbake-setup/processor-sdk_processor-sdk-09.00.00-config.json
index afd3e0d..95fd87e 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.00.00-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-09.00.00-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-am65xx-config.json b/bitbake-setup/processor-sdk_processor-sdk-09.01.00-am65xx-config.json
index 7e6497d..bbc816a 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-am65xx-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-09.01.00-am65xx-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-config.json b/bitbake-setup/processor-sdk_processor-sdk-09.01.00-config.json
index 8e82698..daec1ba 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-09.01.00-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-legacy-config.json b/bitbake-setup/processor-sdk_processor-sdk-09.01.00-legacy-config.json
index 813e35c..0ea7a01 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.01.00-legacy-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-09.01.00-legacy-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.02.00.08-am64x-config.json b/bitbake-setup/processor-sdk_processor-sdk-09.02.00.08-am64x-config.json
index c999c69..3ab024e 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.02.00.08-am64x-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-09.02.00.08-am64x-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-09.03.05.02-legacy-config.json b/bitbake-setup/processor-sdk_processor-sdk-09.03.05.02-legacy-config.json
index 08ff325..8424253 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-09.03.05.02-legacy-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-09.03.05.02-legacy-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json b/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json
index 4817671..ce27119 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.09-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json b/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json
index 3697aa3..24d8391 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-kirkstone-09.02.01.10-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json b/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json
index eb5e8fd..f408a5c 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.09-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json b/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json
index 0a9e6f8..808b637 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-kirkstone-chromium-09.02.01.10-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json
index 9a52e21..dfed0b4 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.00.07.04-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json
index bbdc378..0b4a703 100644
--- a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json
+++ b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.00.07.04-config.json
@@ -9,7 +9,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
diff --git a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
index 70f8c84..e3bb5b1 100644
--- a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
@@ -66,3 +66,4 @@ repos:
     commit: "e42b6a40a3a01e328966bb5ee1bb3e0993975b15"
     layers:
       meta:
+
diff --git a/src/xslt/bitbake-setup.xslt b/src/xslt/bitbake-setup.xslt
index 5385c1f..5f25a04 100644
--- a/src/xslt/bitbake-setup.xslt
+++ b/src/xslt/bitbake-setup.xslt
@@ -29,7 +29,7 @@
             "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
           }
         },
-        "rev": "wip"
+        "rev": "master"
       },
       "path": "oe-layersetup"
     },
-- 
2.17.1


