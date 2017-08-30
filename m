Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id BCF7052ACD
	for <meta-arago@arago-project.org>;
	Wed, 30 Aug 2017 17:57:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UHutkV032023
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504115815;
	bh=ZPAb3gciWrnacLc7265SpWfNEHEsFF+AcMMWZTqTWoE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=npHyywhiicZgtz6E+fK6BK40D1rx1ar2RXk6IBhkxJKENn7YvQF8jgqkSBAcO+ADw
	03IpLTO3E+rgtuk6U7X1epvkGyTkzF8quDWOGpSJTdp8fmbbISwOydPLOY3AxzxJcq
	o/UV+dMgrfGFtqqX4RqUuMlEeI5HI4ZMPE+2gQgE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHuo6q020586
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:56:50 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 30 Aug 2017 12:56:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 30 Aug 2017 12:56:50 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHuoJ4011838;
	Wed, 30 Aug 2017 12:56:50 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dn7EQ-0002zG-7M; Wed, 30 Aug 2017 12:56:50 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Aug 2017 12:56:45 -0500
Message-ID: <20170830175647.11427-5-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170830175647.11427-1-manisha.agrawal@ti.com>
References: <20170830175647.11427-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v3 5/7] packagegroup-arago-tisdk-hmi: add hmi specific packagegroups
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
X-List-Received-Date: Wed, 30 Aug 2017 17:57:06 -0000
Content-Type: text/plain

Create packagegroup for HMI related demos. HMI is one of the focus
growth area for Sitara platform and demos planned for individual target end
equipments. Add evse-hmi demo to the packagegroup.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../packagegroup-arago-tisdk-hmi-sdk-host.bb       | 26 ++++++++++++++++++++
 .../packagegroups/packagegroup-arago-tisdk-hmi.bb  | 28 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
 create mode 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
new file mode 100755
index 00000000..735dda8e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Task to add HMI related sources into the SDK"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+HMI = ""
+
+HMI_append_ti43x = " \
+    evse-hmi-src \
+"
+
+HMI_append_ti33x = " \
+    evse-hmi-src \
+"
+
+
+HMI_append_omap-a15 = " \
+    evse-hmi-src \
+"
+
+RDEPENDS_${PN} = "\
+    ${HMI} \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
new file mode 100755
index 00000000..38ff06b4
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Task to add HMI related packages"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+HMI = " \
+"
+
+
+HMI_append_ti33x = " \
+    evse-hmi \
+"
+
+HMI_append_ti43x = " \
+    evse-hmi \
+"
+
+HMI_append_omap-a15 = " \
+    evse-hmi \
+"
+
+
+RDEPENDS_${PN} = "\
+	${HMI} \
+"
-- 
2.13.0


